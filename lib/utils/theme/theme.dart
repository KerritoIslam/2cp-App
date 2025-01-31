import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class theme {
  static double titleSmallFontSize = 16.sp;
  static double titleMediumFontSize = 24.sp;
  static double displaySmallFontSize = 16.sp;
  static double displayMediumFontSize = 24.sp;
  static double bodyMediumFontSize = 15.sp;
  static double bodySmallFontSize = 12.sp;

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xFFFFFFFF),
      primaryColor: Color(0xFF92E3A9),
      textTheme: TextTheme(
        titleSmall: TextStyle(
          fontSize: titleSmallFontSize,
          color: Color(0xFF92E3A9),
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          fontSize: titleMediumFontSize,
          color: Color(0xFF92E3A9),
          fontWeight: FontWeight.w700,
        ),
        displaySmall: TextStyle(
          fontSize: displaySmallFontSize,
          color: Color(0xFF000000),
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          fontSize: displayMediumFontSize,
          color: Color(0xFF000000),
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(
          fontSize: bodyMediumFontSize,
          color: Color(0xFF000000),
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontSize: bodySmallFontSize,
          color: Color(0xFF000000),
          fontWeight: FontWeight.w400,
        ),
      ));
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xFF323030),
      primaryColor: Color(0xFF92E3A9),
      textTheme: TextTheme(
        titleSmall: TextStyle(
          fontSize: titleSmallFontSize,
          color: Color(0xFF92E3A9),
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          fontSize: titleMediumFontSize,
          color: Color(0xFF92E3A9),
          fontWeight: FontWeight.w700,
        ),
        displaySmall: TextStyle(
          fontSize: displaySmallFontSize,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          fontSize: displayMediumFontSize,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: TextStyle(
          fontSize: bodyMediumFontSize,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          fontSize: bodySmallFontSize,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w400,
        ),
      ));
}
