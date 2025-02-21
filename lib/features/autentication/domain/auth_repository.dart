import 'package:app/core/failure/failure.dart';
import 'package:app/features/autentication/data/models/user_model.dart';
import 'package:app/features/autentication/data/sources/local/local_secure_storage.dart';
import 'package:app/features/autentication/data/sources/remots/rest_auth_remote.dart';
import 'package:app/features/autentication/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

class AuthRepository {
  final RestAuthRemote restAuthRemote;
  final LocalSecureStorage localSecureStorage;
  AuthRepository(
      {required this.localSecureStorage, required this.restAuthRemote});
  //NOTE: this refactoring was made to avoid nested Try catch blocs
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final response = await restAuthRemote.login(email, password);
      return response.fold(
        (failure) => left(failure), // Return failure if login fails
        (response) async {
          // Save tokens if login succeeds
          final tokenResult = await _saveTokens(
              response.tokens.accessToken, response.tokens.refreshToken);
          
          return tokenResult.fold(
            (failure) => left(failure), // Return failure if saving tokens fails
            (_) => right(userModelToEntity(
                response.user)), // Return the user entity on success
          );
        },
      );
    } on Failure catch (e) {
      return left(Failure(e.toString())); // Handle general failures
    }
  }

  Future<Either<Failure, Unit>> _saveTokens(
      String accessToken, String refreshToken) async {
    try {
      await localSecureStorage.setTokens(accessToken, refreshToken);
      return right(unit); // Return success if tokens are saved
    } on Exception catch (e) {
      return left(Failure(
          'Error saving tokens: $e')); // Return failure if token saving fails
    }
  }

  Future<Either<Failure, User>> register(
      String name, String email, String password) async {
    try {
      final response = await restAuthRemote.register(name, email, password);
      return response.fold((failure) => left(failure), (res) async {
        final tokensReponse =
            await _saveTokens(res.tokens.accessToken, res.tokens.refreshToken);
        return tokensReponse.fold(
            (l) => left(l), (_) => right(userModelToEntity(res.user)));
      });
    } on Failure catch (e) {
      return left(Failure(e.toString()));
    }
  } 
  Future<Either<Failure,User>> googleSignIn() async {
    try {
      final response = await restAuthRemote.googleSignIn();
      
      return response.fold((failure) => left(failure), (res) async {
        final tokensReponse =
            await _saveTokens(res.tokens.accessToken, res.tokens.refreshToken);
        return tokensReponse.fold(
            (l) => left(l), (_) => right(userModelToEntity(res.user)));
      });
    } on Failure catch (e) {
      return left(Failure(e.toString()));
    }
  }
  User userModelToEntity(UserModel userModel) {
    return User(
      id: userModel.id,
      name: userModel.name,
      email: userModel.email,
      password: userModel.password,
    );
  }

  UserModel userEntityToModel(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      password: user.password,
    );
  }
}
