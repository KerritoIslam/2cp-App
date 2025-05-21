import 'dart:io';

import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/authentication/data/models/login_dto_model.dart';
import 'package:app/features/authentication/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:signin_with_linkedin/signin_with_linkedin.dart';

class RestAuthRemote {
  final Dio _dio = DioServices.dio;

  Future<Either<Failure, LoginResDtoModel>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await _dio.post(
        '/Auth/Login',
        data: {'email': email, 'password': password},
      );
      if (response.data['user']['type'] == 'Company')
        return left(Failure('User must be a Student'));
      return right(LoginResDtoModel.fromJson(response.data));
    } on DioException catch (e) {
      print(e.toString());
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
    String name,
    String email,
    String password,
  ) async {
    try {
      final response = await _dio.post(
        '/Auth/Signup',
        data: {
          "name": name,
          "email": email,
          "type": "Student",
          "password": password,
        },
      );

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

  //todo: check if needed
  Future<Either<Failure, UserModel>> getUserProfile() async {
    try {
      final response = await _dio.get('/Auth/user');

      return right(UserModel.fromJson(response.data));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, UserModel>> updateUser(
      UserModel user, File? cv, File? profilepic) async {
    try {
      // Create FormData
      FormData formData = FormData.fromMap(user.toJson());

      formData.fields.removeWhere(
          (element) => element.key == 'profilepic' || element.key == 'cv');

      if (cv != null) {
        formData.files
            .add(MapEntry('cv_input', await MultipartFile.fromFile(cv.path)));
      }
      if (profilepic != null) {
        formData.files.add(
            MapEntry('pic', await MultipartFile.fromFile(profilepic.path)));
      }
      print('FormData fields: ${formData.fields}');
      print('FormData files: ${formData.files.map((f) => f.key).toList()}');

      final response = await _dio.put(
        '/Auth/user',
        data: formData,
      );

      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return right(UserModel.fromJson(response.data));
      } else {
        return left(Failure('Failed to update user: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('DioException response: ${e.response?.data}');
      return left(Failure(e.message ?? 'Failed to update user'));
    } catch (e) {
      print('Exception: $e');
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, int>> getOTP(String email) async {
    try {
      final response = await _dio.post(
        '/Auth/otpemail',
        data: {'email': email},
      );
      return right(int.parse(response.data['otp']));
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        return left(Failure('User not found'));
      }
      return left(Failure(e.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Unit>> resetPassword(
    String email,
    String password,
  ) async {
    try {
      await _dio.put(
        '/Auth/userpassword',
        data: {'email': email, 'password': password},
      );
      return right(unit);
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        return left(Failure('User not found'));
      }
      return left(Failure(e.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, TokensModel>> refrechTokens(
    String refreshToken,
  ) async {
    try {
      final response = await _dio.post(
        '/Auth/Refresh',
        data: {'refresh': refreshToken},
      );
      return right(
        TokensModel(
          accessToken: response.data['access'],
          refreshToken: response.data['refresh'],
        ),
      );
    } on DioException catch (e) {
      if (e.response == null) {
        return left(Failure('Unkonw error Please Try Again Later!'));
      }
      if (e.response!.statusCode == 401) {
        return left(Failure('Invalid Refresh Token'));
      }
      return left(Failure(e.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, LoginResDtoModel>> googleSignIn() async {
    try {
      await dotenv.load();
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email', 'profile', 'openid'],

        //serverClientId: dotenv.env['GOOGLE_SERVER_CLIENT_ID'] ?? '',
      );

      final googleSignInAccount = await googleSignIn.signIn();
      print("-----------------------------------------1115");
      print(googleSignInAccount!.serverAuthCode);

      final googleSignInAuthentication =
          await googleSignInAccount.authentication;

      if (googleSignInAuthentication.idToken == null) {
        return left(Failure('Failed to get ID token from Google'));
      }

      try {
        print("-----------------------------------------1111");
        print(googleSignInAuthentication.idToken);
        print(googleSignInAuthentication.idToken!.length);
        print("-----------------------------------------1121");
        print(googleSignIn.clientId);
        print(googleSignInAccount.toString());

        final response = await _dio.post(
          '/Auth/google',
          data: {
            //'code': googleSignInAuthentication.serverAuthCode,
            'idToken': googleSignInAuthentication.idToken,
          },
        );
        print("-----------------------------------------1121");
        print(response.data.toString());
        return right(LoginResDtoModel.fromJson(response.data));
      } on DioException catch (e) {
        if (e.response?.statusCode == 401) {
          return left(Failure('Invalid Google credentials'));
        }
        return left(Failure(e.toString()));
      }
    } on DioException catch (e) {
      print("-----------------------------------------1111");
      print(e.toString());
      if (e.response?.statusCode == 401) {
        return left(Failure('Invalid Google credentials'));
      }
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, LoginResDtoModel>> linkedInSignIn(
    BuildContext context,
  ) async {
    try {
      String linkedInToken = '';
      await dotenv.load();
      final linkedInConfig = LinkedInConfig(
        clientId: dotenv.env['LINKEDIN_CLIENT_ID'] ?? '<<CLIENT ID>>',
        clientSecret:
            dotenv.env['LINKEDIN_CLIENT_SECRET'] ?? '<<CLIENT SECRET>>',
        redirectUrl: dotenv.env['LINKEDIN_REDIRECT_URL'] ?? '<<REDIRECT URL>>',
        scope: ['r_email_address', 'r_liteprofile'],
      );
      await SignInWithLinkedIn.signIn(
        context,
        config: linkedInConfig,
        onGetAuthToken: (data) {
          print("-----------------------------------------1113");
          print(data);
          linkedInToken = data.toJson()['access_token'];
        },
        onSignInError: (error) {
          print('Error on sign in: $error');
        },
      );
      try {
        print(linkedInToken);
        if (linkedInToken.isEmpty) {
          return left(Failure('Sign In Canceled'));
        }
        final response = await _dio.post(
          '/Auth/linkdein',
          data: {'access_token': linkedInToken},
        );
        print("-----------------------------------------1114");
        print(response.toString());
        return right(LoginResDtoModel.fromJson(response.data));
      } on DioException catch (e) {
        return left(Failure(e.toString()));
      }
    } on DioException catch (e) {
      print("-----------------------------------------1115");
      print(e.toString());
      if (e.response!.statusCode == 401) {
        return left(Failure('LinkedIn Sign In Failed'));
      }
      return left(Failure(e.toString()));
    } catch (e) {
      print("-----------------------------------------116");
      print(e.toString());
      return left(Failure(e.toString()));
    }
  }
}
