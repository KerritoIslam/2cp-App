import 'package:flutter/material.dart';

class theme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xFFFFFFFF),
      primaryColor: Color(0xFF92E3A9),
      textTheme: TextTheme(
        titleSmall: TextStyle(
          fontSize: 16,
          color: Color(0xFF92E3A9),
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          fontSize: 24,
          color: Color(0xFF92E3A9),
          fontWeight: FontWeight.w700,
        ),
        displaySmall: TextStyle(
          fontSize: 16,
          color: Color(0xFF000000),
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          fontSize: 24,
          color: Color(0xFF000000),
          fontWeight: FontWeight.w700,
          
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          color: Color(0xFF000000),
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: Color(0xFF000000),
          fontWeight: FontWeight.w400,
        ),
      ));
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xFF323030),
      primaryColor: Color(0xFF92E3A9),
      textTheme: TextTheme(
        titleSmall: TextStyle(
          fontSize: 16,
          color: Color(0xFF92E3A9),
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          fontSize: 24,
          color: Color(0xFF92E3A9),
          fontWeight: FontWeight.w700,
        ),
        displaySmall: TextStyle(
          fontSize: 16,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          fontSize: 24,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w400,
        ),
      ));
}
