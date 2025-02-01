import 'package:dio/dio.dart';

class DioServices {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://192.168.138.105:8000',
    ),
  );
  static Dio get dio => _dio;
}
