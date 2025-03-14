import 'package:app/features/autentication/application/bloc/auth_bloc.dart';
import 'package:app/features/autentication/application/bloc/auth_events.dart';
import 'package:app/features/autentication/data/sources/local/local_secure_storage.dart';
import 'package:app/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class DioServices {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.100.199:8000/',
    ),
  )..interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final unprotected = options.path.contains("/Auth");
        if (unprotected) {
          return handler.next(options);
        }
        //TODO use repository instead of LocalSecureStorage
        final dataSource = locator.get<LocalSecureStorage>();
        late String token;
        final accesToken = await dataSource.getTokens();
        token = accesToken.fold((fail) {
          return token;
        }, (token) => token.accessToken);
        if (token == "") {
          return;
        }
        //TODO check if bearer of Bearer
        options.headers['Authorization'] = "bearer $token";
        return handler.next(options);
      },
      onError: (error, handler) async {
        print(error.requestOptions.path);
        if (error.requestOptions.path.startsWith('/Auth')) {
          if (!error.requestOptions.path.contains('Refresh')) {
            return handler.next(error);
          }
        }
        final authBloc = locator.get<AuthBloc>();
        if (error.response?.statusCode == 401) {
          final dataSource = locator.get<LocalSecureStorage>();
          final res = await dataSource.getTokens();
          final token = res.fold((l) => "", (r) => r.accessToken);
          if (token.isEmpty) {
            authBloc.add(AuthLogoutRequested());
            return handler.next(error);
          }
          Map<String, dynamic> decodedrefrechtoken = JwtDecoder.decode(token);
          if (decodedrefrechtoken.isEmpty) {
            return handler.next(error);
          }
          DateTime exp = DateTime.fromMillisecondsSinceEpoch(
              decodedrefrechtoken['exp'] * 1000);
          if (DateTime.now().isAfter(exp)) {
            authBloc.add(AuthLogoutRequested());
            return handler.next(error);
          }
          //TODO:move this into the repository
          final response = await _dio.post(
            '/Auth/Refresh',
            data: {
              'refresh': token,
            },
          );
          if (response.statusCode == 200) {
            await dataSource.setTokens(
                response.data['access'], response.data['refresh']);
            final options = error.requestOptions;
            options.headers['Authorization'] = response.data['access'];
            final res = await dio.fetch(options);
            return handler.resolve(res);
          }
        }
        authBloc.add(AuthLogoutRequested());
        return handler.next(error);
      },
    ));
  static Dio get dio => _dio;
}
