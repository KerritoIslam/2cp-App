import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:app/features/autentication/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RestAuthRemote {
  final Dio _dio = DioServices.dio;

  Future<Either<Failure, UserModel>> login(
      String email, String password) async {
    try {
      final response = await _dio.post(
        '/Auth/Login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return right(UserModel.fromJson(response.data['user']));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, UserModel>> register(
      String name, String email, String password) async {
    try {
      final response = await _dio.post('/Auth/Signup', data: {
        "name": name,
        "email": email,
        "type": "Student",
        "student": {"category": "CS", "education": "esi"},
        "password": password
      });

      return right(UserModel.fromJson(response.data['user']));
    } catch (e) {
      return left(Failure(e.toString()));
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
  final response1 =
      await remot.register('isla', 'ilamtestglogin@gmail.com', 'islam123@');
  if (response1.isRight()) {
    print(
        'this is a register response : ${response1.leftMap((l) => l.toString())}');
  } else {
    print(response1);
  }
}
