import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MeltaskTheme {
  static ThemeData get lightThemeData {
    final themeData = ThemeData.light();

    return ThemeData.light().copyWith(
      textTheme: GoogleFonts.quicksandTextTheme(
        themeData.textTheme,
      ),
      primaryColor: const Color(0xff9D00FF),
    );
  }

  static ThemeData get darkThemeData {
    final themeData = ThemeData.dark();

    return ThemeData.dark().copyWith(
      textTheme: GoogleFonts.quicksandTextTheme(
        themeData.textTheme,
      ),
      primaryColor: const Color(0xffA5F89B),
    );
  }
}
