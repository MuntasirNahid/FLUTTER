import 'package:authbased/src/utills/theme/widget_themes/elevated_button_theme.dart';
import 'package:authbased/src/utills/theme/widget_themes/outlined_button_theme.dart';
import 'package:authbased/src/utills/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepPurple,
    textTheme: TextTheme(
      headline2: GoogleFonts.montserrat(
        // color: Colors.black87,
        color: Colors.blue,
      ),
    ),
    outlinedButtonTheme: outlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: elevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    outlinedButtonTheme: outlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: elevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme,
  );
}
