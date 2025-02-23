import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/autentication/data/models/login_dto_model.dart';
import 'package:app/features/autentication/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:signin_with_linkedin/signin_with_linkedin.dart';

class RestAuthRemote {
  final Dio _dio = DioServices.dio;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email',
        'profile',
      ],
      clientId:
          "241487075785-ca4eq6d3642e5qasusc2342ndckimnar.apps.googleusercontent.com");
  final _linkedInConfig = LinkedInConfig(
    clientId: '<<CLIENT ID>>',
    clientSecret: '<<CLIENT SECRET>>',
    redirectUrl: '<<REDIRECT URL>>',
    scope: ['openid', 'profile', 'email'],
  );
  Future<Either<Failure, LoginResDtoModel>> login(
      String email, String password) async {
    try {
      final response = await _dio.post(
        '/Auth/Login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return right(LoginResDtoModel.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response == null) {
        return left(Failure('Unkonw error Please Try Again Later!'));
      }
      if (e.response!.statusCode == 401) {
        return left(Failure('email or password is incorrect'));
      }
      if (e.response!.statusCode == 404) {
        return left(Failure('User not found'));
      }
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, LoginResDtoModel>> register(
      String name, String email, String password) async {
    try {
      final response = await _dio.post('/Auth/Signup', data: {
        "name": name,
        "email": email,
        "type": "Student",
        "password": password
      });

      return right(LoginResDtoModel.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
        return left(Failure('this email or name is already used'));
      }
      if (e.response!.statusCode == 404) {
        return left(Failure('Internal Erro'));
      }

      if (kDebugMode) {
        print(e.toString());
      }
      return left(Failure('An error occurred'));
    }
  }

  Future<Either<Failure, Unit>> logout() async {
    try {
      await _dio.post(
        '/logout',
      );
      return right(unit);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

//todo: check if needed
  Future<Either<Failure, UserModel>> getUserProfile() async {
    try {
      final response = await _dio.get(
        '/profile',
      );
      return right(UserModel.fromJson(response.data['user']));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, UserModel>> updateUser(UserModel user) async {
    try {
      final response = await _dio.put(
        '/edit_user',
        data: user.toJson(),
      );
      return right(UserModel.fromJson(response.data['user']));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, LoginResDtoModel>> googleSignIn() async {
    try {
      final googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        return left(Failure('Sign In Canceled'));
      }
      final googleSignInAuthentication =
          await googleSignInAccount.authentication;
      try {
        final response = await _dio.post(
          '/Auth/Google',
          data: {
            'token': googleSignInAuthentication.idToken,
          },
        );
        return right(LoginResDtoModel.fromJson(response.data));
      } on DioException catch (e) {
        return left(Failure(e.toString()));
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        return left(Failure('Google Sign In Failed'));
      }
      return left(Failure(e.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, LoginResDtoModel>> linkedInSignIn(
      BuildContext context) async {
    try {
      String linkedInToken = '';

      await SignInWithLinkedIn.signIn(
        context,
        config: _linkedInConfig,
        onGetAuthToken: (data) {
          linkedInToken = data.toJson()['access_token'];
        },
        onSignInError: (error) {
          print('Error on sign in: $error');
        },
      );
      try {
        final response = await _dio.post(
          '/Auth/LinkedIn',
          data: {
            'token': linkedInToken,
          },
        );
        return right(LoginResDtoModel.fromJson(response.data));
      } on DioException catch (e) {
        return left(Failure(e.toString()));
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        return left(Failure('LinkedIn Sign In Failed'));
      }
      return left(Failure(e.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
