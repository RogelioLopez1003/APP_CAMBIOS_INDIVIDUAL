import 'package:flutter/material.dart';
import 'package:flutter_quiz_1/models/questions.dart';
import 'package:flutter_quiz_1/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_quiz_1/button.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers, this.restartQuiz, {super.key}); // Constructor function

  final void Function() restartQuiz;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
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
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 224, 170, 235),
                fontSize: 24,  //Aumento del tamaño de texto
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButtonExample('Restart Quiz',restartQuiz, const Icon(Icons.restart_alt)), //Cambio del ícono del botón de reinicio
          ],
        ),
      ),
    );
  }
}
