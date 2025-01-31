import 'package:app/core/dioservices/dio.dart';
import 'package:dio/dio.dart';

class RestAuthRemote {
  final Dio _dio = DioServices.dio;

  Future<Response> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/Auth/Login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> register(String name, String email, String password) async {
    try {
      final response = await _dio.post('/Auth/Signup/', data: {
        "name": name,
        "password": password,
        "email": email,
        "type": "Company",
        "company": {"category": "EC"}
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> logout(String token) async {
    try {
      final response = await _dio.post(
        '/logout',
        options: Options(
          headers: {
            'Authorization': 'Token $token',
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getUserProfile(String token) async {
    try {
      final response = await _dio.get(
        '/profile',
        options: Options(
          headers: {
            'Authorization': 'Token $token',
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> UpdateUser(String token, Map<String, dynamic> data) async {
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
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

void main() async {
  final remot = RestAuthRemote();
  final Response response1 =
      await remot.register('islam', 'islamtestinglogin@gmail.com', '123456');
  print(
      '${'this is a login response : ' + response1.data}${response1.statusCode}');
  final Response response =
      await remot.login('islamtestinglogin@gmail.com', '123456');
  print(
      '${'this is a login response : ' + response.data}${response.statusCode}');
}
