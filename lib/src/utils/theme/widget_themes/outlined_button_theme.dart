import 'package:flutter/material.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/constants/sizes.dart';

class SmOutlineButtonTheme {
  SmOutlineButtonTheme._();

  // Light theme
  static final lightOutlineBTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      disabledForegroundColor: smDarkColor.withOpacity(0.38),
      side: const BorderSide(color: smDarkColor),
      padding: const EdgeInsets.symmetric(vertical: smButtonHeight),
    ),
  );

  // Dark Theme
  static final darkOutlineBTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      disabledForegroundColor: smWhiteColor.withOpacity(0.38),
      side: const BorderSide(color: smSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: smButtonHeight),
    ),
  );
}
