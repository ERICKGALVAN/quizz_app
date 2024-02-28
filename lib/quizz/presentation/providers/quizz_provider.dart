import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizz_app/quizz/data/datasources/quizz_service.dart';
import 'package:quizz_app/quizz/data/models/quizz_model.dart';

class QuizzNotifier extends AutoDisposeAsyncNotifier<List<QuizzModel>> {
  final quizzService = QuizzService();
  @override
  FutureOr<List<QuizzModel>> build() {
    return getAllQuizzes();
  }

  Future<List<QuizzModel>> getAllQuizzes() async {
    state = const AsyncLoading();
    final quizzes = await quizzService.getAllQuizzes();
    state = AsyncData(quizzes);
    return quizzes;
  }

  Future<void> createQuizz({
    required String name,
    required String description,
    required List<Map<String, dynamic>> questions,
  }) async {
    try {
      await quizzService.createQuizz(
        name: name,
        description: description,
        questions: questions,
      );
      await getAllQuizzes();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteQuizz({
    required String id,
  }) async {
    try {
      await quizzService.deleteQuizz(id: id);
      await getAllQuizzes();
    } catch (e) {
      rethrow;
    }
  }
}

final quizzProvider =
    AutoDisposeAsyncNotifierProvider<QuizzNotifier, List<QuizzModel>>(
  () {
    return QuizzNotifier();
  },
);
