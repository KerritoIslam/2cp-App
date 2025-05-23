import 'dart:io';

import 'package:app/core/failure/failure.dart';
import 'package:app/features/authentication/data/models/login_dto_model.dart';
import 'package:app/features/authentication/data/sources/local/local_secure_storage.dart';
import 'package:app/features/authentication/data/sources/remote/rest_auth_remote.dart';
import 'package:app/features/authentication/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepository {
  final RestAuthRemote restAuthRemote;
  final LocalSecureStorage localSecureStorage;
  final LocalStorage localStorage;
  AuthRepository(
      {required this.localSecureStorage,
      required this.restAuthRemote,
      required this.localStorage});
  //NOTE: this refactoring was made to avoid nested Try catch blocs
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final response = await restAuthRemote.login(email, password);
      return response.fold(
        (failure) => left(failure), // Return failure if login fails
        (response) async {
          final user = User.fromModel(response.user);
          final userResult = await localStorage.setUser(user.toJson());
          if (userResult.isLeft()) {
            return left(Failure(
                'Error saving user: ${userResult.fold((l) => l.message, (r) => '')}'));
          }
          final tokenResult = await _saveTokens(
              response.tokens.accessToken, response.tokens.refreshToken);

          return tokenResult.fold(
            (failure) => left(failure), // Return failure if saving tokens fails
            (_) => right(User.fromModel(
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
        final user = User.fromModel(res.user);
        final userResult = await localStorage.setUser(user.toJson());
        if (userResult.isLeft()) {
          return left(Failure(
              'Error saving user: ${userResult.fold((l) => l.message, (r) => '')}'));
        }
        final tokensReponse =
            await _saveTokens(res.tokens.accessToken, res.tokens.refreshToken);
        return tokensReponse.fold(
            (l) => left(l), (_) => right(User.fromModel(res.user)));
      });
    } on Failure catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, User>> getUser() async {
    try {
      final response = await restAuthRemote.getUserProfile();

      return response.fold((l) => left(l), (r) => right(User.fromModel(r)));
    } on Failure catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, User>> googleSignIn() async {
    try {
      final response = await restAuthRemote.googleSignIn();

      return response.fold((failure) => left(failure), (res) async {
        final user = User.fromModel(res.user);
        final userResult = await localStorage.setUser(user.toJson());
        if (userResult.isLeft()) {
          return left(Failure(
              'Error saving user: ${userResult.fold((l) => l.message, (r) => '')}'));
        }
        final tokensReponse =
            await _saveTokens(res.tokens.accessToken, res.tokens.refreshToken);
        return tokensReponse.fold(
            (l) => left(l), (_) => right(User.fromModel(res.user)));
      });
    } on Failure catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, User>> linkedInSignIn(BuildContext context) async {
    try {
      final response = await restAuthRemote.linkedInSignIn(context);

      return response.fold((failure) => left(failure), (res) async {
        final user = User.fromModel(res.user);
        final userResult = await localStorage.setUser(user.toJson());
        if (userResult.isLeft()) {
          return left(Failure(
              'Error saving user: ${userResult.fold((l) => l.message, (r) => '')}'));
        }
        final tokensReponse =
            await _saveTokens(res.tokens.accessToken, res.tokens.refreshToken);
        return tokensReponse.fold(
            (l) => left(l), (_) => right(User.fromModel(res.user)));
      });
    } on Failure catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, int>> forgetPassword(String email) async {
    try {
      final response = await restAuthRemote.getOTP(email);
      return response.fold((failure) => left(failure), (res) => right(res));
    } on Failure catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Unit>> resetPassword(
      String email, String password) async {
    try {
      final response = await restAuthRemote.resetPassword(email, password);
      return response.fold((failure) => left(failure), (res) => right(res));
    } on Failure catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, TokensModel>> checkTokens() async {
    try {
      final response = await localSecureStorage.getTokens();
      return response.fold((failure) => left(failure), (res) async {
        if (res.accessToken.isNotEmpty) {
          if (res.refreshToken.isNotEmpty &&
              JwtDecoder.isExpired(res.refreshToken)) {
            return left(Failure('Token is expired'));
          }
          return right(res);
        } else {
          return left(Failure('Token is empty'));
        }
      });
    } on Failure catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, User>> updateUser(User user, File? cv, File? profilepic) async {
    try {
      final response = await restAuthRemote.updateUser(user.toModel(), cv, profilepic);
      return response.fold((failure) => left(failure), (res) async {
        final user = User.fromModel(res);
        final userResult = await localStorage.setUser(user.toJson());
        if (userResult.isLeft()) {
          return left(Failure(
              'Error saving user: ${userResult.fold((l) => l.message, (r) => '')}'));
        }
        return right(User.fromModel(res));
      });
    } on Failure catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
