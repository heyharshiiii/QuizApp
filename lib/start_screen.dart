import 'package:flutter/material.dart';
class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset(
        'assets/images/quiz-logo.png',
        color: Colors.white70,
        ),
      const SizedBox(height: 30.0),
      const Text('Learn Flutter The Fun Way !',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),),
      const SizedBox(height: 30.0),
      OutlinedButton.icon(

        onPressed: startQuiz,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
      ),
      icon: const Icon(Icons.arrow_right_alt),
       label: const Text('Start Quiz'),
      )
    ]);
  }
}