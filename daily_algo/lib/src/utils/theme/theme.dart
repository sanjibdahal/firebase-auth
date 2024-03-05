import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._(); // making private

  static ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    brightness: Brightness.light,
    primarySwatch: const MaterialColor(
      0xFF4679F0,
      <int, Color>{
        50: Color(0x1A4679F0),
        100: Color(0x334679F0),
        200: Color(0x4D4679F0),
        300: Color(0x664679F0),
        400: Color(0x804679F0),
        500: Color(0xFF4679F0),
        600: Color(0x994679F0),
        700: Color(0xB34679F0),
        800: Color(0xCC4679F0),
        900: Color(0xE64679F0),
      },
    ),
  );
  static ThemeData darkTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(Typography.whiteCupertino),
    brightness: Brightness.dark,
    primarySwatch: const MaterialColor(
      0xFF4679F0,
      <int, Color>{
        50: Color(0x1A4679F0),
        100: Color(0x334679F0),
        200: Color(0x4D4679F0),
        300: Color(0x664679F0),
        400: Color(0x804679F0),
        500: Color(0xFF4679F0),
        600: Color(0x994679F0),
        700: Color(0xB34679F0),
        800: Color(0xCC4679F0),
        900: Color(0xE64679F0),
      },
    ),
  );
}
