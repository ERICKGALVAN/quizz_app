import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quizz_app/config/network/dio_config.dart';
import 'package:quizz_app/quizz/data/models/quizz_model.dart';

class QuizzService {
  final dio = DioConfig.dio;
  final storage = const FlutterSecureStorage();

  Future<List<QuizzModel>> getAllQuizzes() async {
    try {
      final response = await dio.get(
        '/items/',
      );
      final List<QuizzModel> allQuizzes = [];
      for (var item in response.data) {
        allQuizzes.add(QuizzModel.fromJson(item));
      }

      return allQuizzes;
    } catch (e) {
      rethrow;
    }
  }

  Future<QuizzModel> createQuizz({
    required String name,
    required String description,
    required List<Map<String, dynamic>> questions,
  }) async {
    try {
      final response = await dio.post(
        '/items/',
        data: {
          'nombre': name,
          'descripcion': description,
          'preguntas': questions,
        },
      );
      final QuizzModel quizz = QuizzModel.fromJson(response.data);
      return quizz;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteQuizz({
    required String id,
  }) async {
    try {
      final response = await dio.delete(
        '/items/$id',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
