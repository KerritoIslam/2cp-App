import 'package:app/features/autentication/data/sources/local/local_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class DioServices {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.42.0.1:8000/',
    ),
  )..interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (!options.path.contains("Auth")) {
          return handler.next(options);
        }
        final dataSource = LocalSecureStorage(const FlutterSecureStorage());

        late String token;
        final accesToken = await dataSource.getTokens();
        token = accesToken.fold((fail) {
          return token;
        }, (token) => token.accessToken);
        if (token == "") {
          return;
        }

        options.headers['Authorization'] = token;
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          final datasource = LocalSecureStorage(const FlutterSecureStorage());
          final token = await datasource.getTokens().then((value) => value.fold(
                (l) => "",
                (r) => r.accessToken,
              ));
          if (token == "") {
            return handler.next(error);
          }
          Map<String, dynamic> decodedrefrechtoken = JwtDecoder.decode(token);
          if (decodedrefrechtoken == '') {
            return handler.next(error);
          }
          DateTime exp = DateTime.fromMillisecondsSinceEpoch(
              decodedrefrechtoken['exp'] * 1000);
          if (exp.isAfter(DateTime.now())) {
            return handler.next(error);
          }
          final response = await _dio.post(
            '/Auth/Refresh',
            data: {
              'refreshToken': token,
            },
          );
          if (response.statusCode == 200) {
            await datasource.setTokens(
                response.data['access'],token);
            return handler.next(error);
          }
        }
        return handler.next(error);
      },
    ));
  static Dio get dio => _dio;
}
