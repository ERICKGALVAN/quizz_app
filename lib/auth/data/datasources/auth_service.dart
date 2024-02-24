import 'package:dio/dio.dart';
import 'package:quizz_app/config/network/dio_config.dart';

class AuthService {
  final dio = DioConfig.dio;

  Future register({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dio.post('/register', data: {
        'username': username,
        'password': password,
      });
      print(response);
    } catch (e) {
      rethrow;
    }
  }
}
