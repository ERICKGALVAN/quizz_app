import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
    addInterceptors();
  }

  static void addInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          const storage = FlutterSecureStorage();
          final token = await storage.read(key: 'token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            // ignore: avoid_print
            print('error 401');
          }
          return handler.next(error);
        },
      ),
    );
  }
}
