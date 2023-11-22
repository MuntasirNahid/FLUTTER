import 'package:authbased/src/constants/colors.dart';
import 'package:flutter/material.dart';

class TextFormFieldTheme {
  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: secondaryColor,
    labelStyle: TextStyle(
      color: secondaryColor,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: secondaryColor,
      ),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: primaryColor,
    floatingLabelStyle: TextStyle(
      color: primaryColor,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: primaryColor,
      ),
    ),
  );
}
