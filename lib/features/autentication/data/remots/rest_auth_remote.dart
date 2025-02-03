import 'package:app/core/dioservices/dio.dart';
import 'package:app/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
//WARNING :Remove the token from here and put it in the intreceptor
class RestAuthRemote {
  final Dio _dio = DioServices.dio;

  Future<Either<Failure, Response>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/Auth/Login',
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
      final response = await _dio.post('/Auth/Signup', data: {
        "name": name,
        "email": email,
        "type": "Student",
        "student": {"category": "CS", "education": "esi"},
        "password": password
      });
      return right(response);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  // WARNING: YOU DON't PASS THE TOKEN IN the logut
  Future<Either<Failure, Response>> logout(String token) async {
    try {
      final response = await _dio.post(
        '/logout',
        options: Options(),
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
        options: Options(),
      );
      return right(response);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Response>> updateUser(
      String token, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(
        '/edit_user',
        data: data,
        options: Options(),
      );
      return right(response);
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

