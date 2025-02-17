import 'package:dio/dio.dart';

class DioServices {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.166.95:8000/',
    ),
  );
  static Dio get dio => _dio;
}
