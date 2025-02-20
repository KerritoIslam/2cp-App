import 'package:app/features/autentication/application/bloc/auth_bloc.dart';
import 'package:app/features/autentication/application/bloc/auth_events.dart';
import 'package:app/features/autentication/data/sources/local/local_secure_storage.dart';
import 'package:app/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class DioServices {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.42.0.1:8000/',
    ),
  )..interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        print(options.path);
        if (!options.path.contains("Auth")) {
          return handler.next(options);
        }
        final dataSource = locator.get<LocalSecureStorage>();

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
        final authBloc = locator.get<AuthBloc>();
        if (error.response?.statusCode == 401) {
          final dataSource = locator.get<LocalSecureStorage>();

          final token = await dataSource.getTokens().then((value) => value.fold(
                (l) => "",
                (r) => r.accessToken,
              ));
          if (token == "") {
            authBloc.add(AuthLogoutRequested());
            return handler.next(error);
          }
          Map<String, dynamic> decodedrefrechtoken = JwtDecoder.decode(token);
          if (decodedrefrechtoken == '') {
            return handler.next(error);
          }
          DateTime exp = DateTime.fromMillisecondsSinceEpoch(
              decodedrefrechtoken['exp'] * 1000);
          if (DateTime.now().isAfter(exp)) {
            authBloc.add(AuthLogoutRequested());
            return handler.next(error);
          }
          final response = await _dio.post(
            '/Auth/Refresh',
            data: {
              'refreshToken': token,
            },
          );
          if (response.statusCode == 200) {
            await dataSource.setTokens(
                response.data['access'], response.data['refresh']);
            return handler.next(error);
          }
        }
        authBloc.add(AuthLogoutRequested());
        return handler.next(error);
      },
    ));
  static Dio get dio => _dio;
}
