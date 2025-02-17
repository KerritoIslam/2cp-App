import 'package:dio/dio.dart';

class DioServices {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.220.75:8000/',
    ),
  );
  static Dio get dio => _dio;
}
