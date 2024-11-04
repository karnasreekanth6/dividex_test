import 'package:dio/dio.dart';



class DioUtils {
  static final DioUtils instance = DioUtils();

  static String baseUrl = "https://vgopay.in/";

  Future<Dio> getDioInstance() async {
    return Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        responseType: ResponseType.json,
        contentType: "application/json"));
  }
}