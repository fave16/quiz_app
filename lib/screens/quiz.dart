import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home/gradient_background.dart';
import 'package:quiz_app/screens/home/home_screen.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import '../data/questions.dart';
import '../screens/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "home-screen";

  // void initState() {
  //   activeScreen = HomeScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void switchScreenToQuestionScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomeScreen(switchScreen);

    if (activeScreen == "questions-screen") {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: switchScreenToQuestionScreen,
      );
    }
    return Scaffold(
      body: GradientBackground.purple(
        child: screenWidget,
      ),
    );
  }
}
