
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers=[];
  var activeScreen='start-screen';
  void switchScreen()
  {
    setState(() {
      activeScreen='questions-screen';
    });
  }
  void chooseAnswer(String answer)
  {
    selectedAnswers.add(answer);
    if(selectedAnswers.length==questions.length)
    {
      setState(() {
        activeScreen='results-screen';
      });
    }
  }
  void restartQuiz()
  {
    setState(() {
      selectedAnswers=[];
      activeScreen='questions-screen';
    });
  }
  @override
  Widget build(BuildContext context) {
Widget screenWidget=StartScreen(switchScreen);
    if(activeScreen =='questions-screen')
    {
      screenWidget=QuestionScreen(onSelectAnswer: chooseAnswer);
    }
    if(activeScreen=='results-screen')
    {
      screenWidget=ResultsScreen(chosenAnswer:selectedAnswers,onRestart: restartQuiz,);
    }
    
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      
    ),
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 168, 137, 37),Color.fromARGB(255, 70, 42, 42)]
          )
        ),
        child: screenWidget,
    ),
    ),
   );
  }
}