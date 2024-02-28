import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizz_app/quizz/presentation/providers/quizz_provider.dart';

class QuestionContainer extends ConsumerWidget {
  const QuestionContainer({
    Key? key,
    required this.id,
    required this.name,
    required this.description,
  }) : super(key: key);
  final String id;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 239, 246, 253),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  ref.read(quizzProvider.notifier).deleteQuizz(id: id);
                },
                icon: const Icon(
                  Icons.delete,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
