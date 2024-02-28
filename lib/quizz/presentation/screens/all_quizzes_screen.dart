import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizz_app/config/routes/routes.dart';
import 'package:quizz_app/quizz/presentation/providers/quizz_provider.dart';
import 'package:quizz_app/quizz/presentation/screens/answer_test_screen.dart';
import 'package:quizz_app/quizz/presentation/widgets/question_container.dart';

class AllQuizzesScreen extends ConsumerWidget {
  const AllQuizzesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizz = ref.watch(quizzProvider);
    return Scaffold(
      body: quizz.when(
        data: (quizzes) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(quizzProvider);
            },
            child: quizzes.isEmpty
                ? const Center(
                    child: Text('No hay quizzes'),
                  )
                : ListView.builder(
                    itemCount: quizzes.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          navigatePush(
                            context,
                            AnswerTestScreen(
                              name: quizzes[index].nombre,
                              description: quizzes[index].descripcion,
                              questions: quizzes[index].preguntas,
                            ),
                          );
                        },
                        child: QuestionContainer(
                          id: quizzes[index].id,
                          name: quizzes[index].nombre,
                          description: quizzes[index].descripcion,
                        ),
                      );
                    },
                  ),
          );
        },
        error: (error, stack) {
          return Center(
            child: Text('Error: $error'),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
