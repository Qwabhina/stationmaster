import 'package:flutter/material.dart';
import 'package:stationmaster/src/constants/colors.dart';
import 'package:stationmaster/src/constants/sizes.dart';

class SmElevatedButtonTheme {
  SmElevatedButtonTheme._();

  // Light theme
  static final lightOutlineBTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      side: const BorderSide(color: smPrimaryColor),
      padding: const EdgeInsets.symmetric(vertical: smButtonHeight),
    ),
  );

  // Dark Theme
  static final darkOutlineBTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: smButtonHeight),
    ),
  );
}
