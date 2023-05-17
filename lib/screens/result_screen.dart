import 'package:basic_english/data/questions.dart';
import 'package:basic_english/quiz_summary/quiz_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.restartQuiz});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getsummaryData() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'user_answer': chosenAnswers[i],
        'correct_answer': questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getsummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lora(
                fontSize: 22,
                color: const Color.fromARGB(195, 255, 255, 255),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuizSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: restartQuiz,
              child: Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
