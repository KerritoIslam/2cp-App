import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/autentication/data/models/login_dto_model.dart';
import 'package:app/features/autentication/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class RestAuthRemote {
  final Dio _dio = DioServices.dio;

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
      if (e.response!.statusCode == 401) {
        return left(Failure('email or password is incorrect'));
      }
      if (e.response!.statusCode==404){
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
        "student": {"category": "CS", "education": "esi"},
        "password": password
      });
  
      return right(LoginResDtoModel.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
        return left(Failure('this email or name is already used'));
      }
      if (e.response!.statusCode==404){
      return left(Failure('Internal Erro'));
      }

      if (kDebugMode) {
        print(e.toString());
      
      }return left(Failure('An error occurred'));
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
}

void main() async {
  final remot = RestAuthRemote();
  final response1 = await remot.register(
      'islam45797945', 'ilamtestgmlogin@gijijimail.com', 'islam123@');
  if (response1.isRight()) {
    print(
        'this is a register response : ${response1.leftMap((l) => l.toString())}');
  } else {
    print(response1);
  }
}
