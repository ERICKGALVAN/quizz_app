import 'package:dio/dio.dart';

class DioConfig {
  static Dio dio = Dio();
  static const String url = "https://quizz-server-wine.vercel.app/";

  void init() {
    dio.options.baseUrl = url;
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    dio.options.validateStatus = (status) => status! < 500;
  }
}
