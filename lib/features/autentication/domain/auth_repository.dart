import 'package:app/core/failure/failure.dart';
import 'package:app/features/autentication/data/models/user_model.dart';
import 'package:app/features/autentication/data/sources/remots/rest_auth_remote.dart';
import 'package:app/features/autentication/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

class AuthRepository {
  final RestAuthRemote restAuthRemote;
  AuthRepository({required this.restAuthRemote});
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final response = await restAuthRemote.login(email, password);
      return response.fold((failure) => left(failure),
          (response) => right(userModelToEntity(response)));
    } on Failure catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, User>> register(
      String name, String email, String password) async {
    try {
      final response = await restAuthRemote.register(name, email, password);
      return response.fold(
          (failure) => left(failure), (user) => right(userModelToEntity(user)));
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
