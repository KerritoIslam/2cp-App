import 'package:dio/dio.dart';

class DioServices {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.42.0.1:8000/',

    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Do something before request is sent
          return handler.next(options); //continue
        },
        onResponse: (response, handler) {
          // Do something with response data
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          // Do something with response error
          return handler.next(e); //continue
        },
      ),
    );
  static Dio get dio => _dio;
}
