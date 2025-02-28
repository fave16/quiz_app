import 'package:flutter/material.dart';
import '../data/questions.dart';
import '../questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers });

  final List<String> chosenAnswers;
  // final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "questions": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final summaryData = getSummaryData();
    final numCorrectQuestions = summaryData.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have answered $numCorrectQuestions out of $numTotalQuestions questions correctly"),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton(
              onPressed: (){}, 
              child: const Text("Restrat Quiz"))
          ],
        ),
      ),
    );
  }
}
