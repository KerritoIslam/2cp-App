import 'package:dio/dio.dart';

class DioServices {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://172.20.10.3:8000/',
    ),
  );
  static Dio get dio => _dio;
}
