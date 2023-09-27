

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static final light  = ThemeData(
    primaryColor: Color(0xFF41004C),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Color(0xFF41004C))))),


textTheme: TextTheme(
  headlineLarge:GoogleFonts.outfit(fontSize: 26, fontWeight: FontWeight.w700,color: Colors.black,),
  displayLarge: GoogleFonts.outfit(fontSize: 24, color: Colors.black,fontWeight: FontWeight.w700),
  displayMedium: GoogleFonts.outfit(fontSize: 22, color: Colors.black,fontWeight: FontWeight.w700),
  displaySmall: GoogleFonts.outfit(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w400),
  headlineMedium: GoogleFonts.outfit(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w700),
  headlineSmall: GoogleFonts.outfit(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w700),
  titleLarge: GoogleFonts.outfit(fontSize: 18, color: Colors.black,fontWeight: FontWeight.w700),
  labelMedium: GoogleFonts.outfit(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w700),
  titleMedium: GoogleFonts.outfit(fontSize: 16, color: Colors.black),
  titleSmall: GoogleFonts.outfit(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700),
  bodyLarge: GoogleFonts.outfit(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
  bodyMedium: GoogleFonts.outfit(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
  bodySmall: GoogleFonts.outfit(fontSize: 12, color: Colors.black,fontWeight: FontWeight.normal),
  labelLarge: GoogleFonts.outfit(fontSize: 12, color: Colors.white),
  labelSmall: GoogleFonts.outfit(fontSize: 10, color: Colors.black),
)
  );

  static final dark = ThemeData.dark();
}