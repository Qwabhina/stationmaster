import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stationmaster/src/constants/colors.dart';

class SmTextTheme {
  // Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    displayMedium: GoogleFonts.sourceSansPro(
        color: smPrimaryColor, fontWeight: FontWeight.w700, height: 0.85),
    displaySmall: GoogleFonts.sourceSansPro(
        color: smPrimaryColor,
        fontWeight: FontWeight.w700,
        height: 0.9,
        letterSpacing: -0.5),
    headlineMedium: GoogleFonts.sourceSansPro(
        color: smPrimaryColor, fontWeight: FontWeight.w600, height: 0.925),
    headlineSmall: GoogleFonts.sourceSansPro(
        fontWeight: FontWeight.w600, height: 0.95, letterSpacing: -0.5),
    titleMedium: GoogleFonts.sourceSansPro(color: smDarkColor, fontSize: 16),
    titleSmall: GoogleFonts.sourceSansPro(color: smDarkColor, fontSize: 20),
  );

  // Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    displayMedium:
        GoogleFonts.sourceSansPro(fontWeight: FontWeight.w700, height: 0.85),
    displaySmall: GoogleFonts.sourceSansPro(
        fontWeight: FontWeight.w700, height: 0.9, letterSpacing: -0.5),
    headlineMedium:
        GoogleFonts.sourceSansPro(fontWeight: FontWeight.w600, height: 0.925),
    headlineSmall: GoogleFonts.sourceSansPro(
        fontWeight: FontWeight.w600, height: 0.95, letterSpacing: -0.5),
    titleMedium: GoogleFonts.sourceSansPro(fontSize: 16),
    titleSmall: GoogleFonts.sourceSansPro(fontSize: 20),
  );
}
