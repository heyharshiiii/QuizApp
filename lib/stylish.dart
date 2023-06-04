import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Texty extends StatelessWidget {
  const Texty(this.textyy,{super.key});
  final String textyy;
  @override
  Widget build(BuildContext context) {
    return Text(textyy,
      textAlign: TextAlign.center,
      style: GoogleFonts.montez(
        fontSize: 28.0,
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
    );
  }
}