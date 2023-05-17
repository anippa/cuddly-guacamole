import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.questionIndex, required this.isCorrect});

  final int questionIndex;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect
            ? const Color.fromARGB(213, 65, 218, 144)
            : const Color.fromARGB(239, 221, 93, 93),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          color: const Color.fromARGB(255, 223, 216, 216),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
