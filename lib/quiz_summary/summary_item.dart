import 'package:flutter/material.dart';
import 'package:basic_english/quiz_summary/question_identifier.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrect = itemData['user_answer'] == itemData['correct_answer'];
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            questionIndex: itemData['question_index'] as int,
            isCorrect: isCorrect,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: GoogleFonts.lora(
                    color: const Color.fromARGB(242, 255, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Your Answer : ${itemData['user_answer'] as String}',
                  style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'Correct Answer : ${itemData['correct_answer'] as String}',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 243, 200, 43),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
