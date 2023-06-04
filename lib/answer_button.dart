import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AnswerButton extends StatelessWidget {
  const AnswerButton({required this. answerText, required this.onTap,super.key});
  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 40.0),
          backgroundColor: const Color.fromARGB(66, 5, 47, 59),
          foregroundColor: Colors.white,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
          textStyle: const TextStyle(
            fontSize: 20.0, 
            letterSpacing: 2.0,
                
          ),
          
        ),
        child:Text(answerText,textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          letterSpacing: 1.0,
          fontSize: 15.0,
          fontWeight: FontWeight.w500
        ),
        )
        ),
    );
  }
}