import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import './question_summary.dart';
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswer,
    required this.onRestart
    });
  final List<String> chosenAnswer;
  final void Function() onRestart;

  List<Map<String,Object>> getSummaryData()
  {
    final List<Map<String,Object>> summary=[];
   for(var i=0;i<chosenAnswer.length;i++)
   {
     summary.add({
      'question_index':i,
      'question':questions[i].texts,
      'correct_answer': questions[i].answers[0],
      'user_answer':chosenAnswer[i],
    }
    );
   }
   return summary;
  }
  @override
  Widget build(BuildContext context) {
    final summaryData=getSummaryData();
    final numTotalQuestions=questions.length;
    final numCorrectQuestions= summaryData.where((data){
      return data['user_answer']==data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered $numCorrectQuestions out of $numTotalQuestions answers correctly !',
              style: GoogleFonts.montserrat(
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic
              ),
              textAlign: TextAlign.center,
            ),
           const SizedBox(height: 20.0,),
            QuestionsSummary(summaryData) ,
            const SizedBox(height: 20.0,),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'))        
          ],
        ),
      ),
    );
  }
}