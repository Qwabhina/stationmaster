import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmTextTheme {
  // Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headline2: GoogleFonts.poppins(
      color: Colors.black87,
      fontWeight: FontWeight.w500,
    ),
    subtitle2: GoogleFonts.poppins(
      color: Colors.black54,
      fontSize: 24,
    ),
  );

  // Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headline2: GoogleFonts.poppins(
      color: Colors.white70,
      fontWeight: FontWeight.w500,
    ),
    subtitle2: GoogleFonts.poppins(
      color: Colors.white60,
      fontSize: 24,
    ),
  );
}
