import 'package:authbased/src/constants/colors.dart';
import 'package:flutter/material.dart';

class outlinedButtonTheme {
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(vertical: 15),
      foregroundColor: secondaryColor,
      side: BorderSide(
        color: secondaryColor,
        width: 1.5,
      ),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      padding: EdgeInsets.symmetric(vertical: 15),
      foregroundColor: Colors.white,
      side: BorderSide(
        color: Colors.white,
      ),
    ),
  );
}
