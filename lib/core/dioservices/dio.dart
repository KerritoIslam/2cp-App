import 'package:dio/dio.dart';

class DioServices {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://127.0.0.1:8000',
    ),
  );
  static Dio get dio => _dio;
}
