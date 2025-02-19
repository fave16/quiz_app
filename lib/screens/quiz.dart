import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home/gradient_background.dart';
import 'package:quiz_app/screens/home/home_screen.dart';
import 'package:quiz_app/screens/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = "home-screen";

  // void initState() {
  //   activeScreen = HomeScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = "qustions-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomeScreen(switchScreen);

    if (activeScreen == "questions-screen") {
      screenWidget = const QuestionScreen();
    }
    return Scaffold(
      body: GradientBackground.purple(
        child: screenWidget,
      ),
    );
  }
}
