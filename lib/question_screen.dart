import 'package:flutter/material.dart';
import './answer_button.dart';
import './data/questions.dart';
import './stylish.dart';
class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key,required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
   var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswers)
  {
    widget.onSelectAnswer(selectedAnswers);
      setState(() {
        currentQuestionIndex++;
      });
  }
  @override
  Widget build(BuildContext context) {
  final currentQuestion=questions[currentQuestionIndex];

    return SizedBox(
    width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Texty(currentQuestion.texts),
            const SizedBox(height: 20.0,),
            ...currentQuestion.getShuffledAnswers().map((items){
               return AnswerButton(
                answerText: items,
                onTap: () {
                  answerQuestion(items);
                }
                
                ); 
            }),
          ],
        ),
      ),
    );
  }
} 