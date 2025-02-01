import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RestAuthRemote {
  final Dio _dio = DioServices.dio;

  Future<Either<Failure, Response>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/Auth/Login/',
        data: {
          'email': email,
          'password': password,
        },
      );
      return right(response);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Response>> register(
      String name, String email, String password) async {
    try {
      final response = await _dio.post('/Auth/Signup/', data: {
        "password": password,
        "email": email,
      });
      return right(response);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Response>> logout(String token) async {
    try {
      final response = await _dio.post(
        '/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return right(response);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Response>> getUserProfile(String token) async {
    try {
      final response = await _dio.get(
        '/profile',
        options: Options(
          headers: {
            'Authorization': 'Token $token',
          },
        ),
      );
      return right(response);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //eseless comment
  Future<Either<Failure, Response>> updateUser(
      String token, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(
        '/edit_user',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Token $token',
          },
        ),
      );
      return right(response);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}

/* void main() async {
  final remot = RestAuthRemote();
  final response1 =
      await remot.register('islam', 'islamtestinglogin@gmail.com', '123456');
  if (response1.isRight()) {
    print(
        'this is a register response : ${response1.leftMap((l) => l.toString())}');
  } else {
    print(response1);
  }

  final response = await remot.login('islamtestinglogin@gmail.com', '123456');
  if (response.isRight()) {
    print('this is a login response : ' '$response');
  } 
}
 */