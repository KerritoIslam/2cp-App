import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class theme {
  static double titleSmallFontSize = 16.sp;
  static double titleMediumFontSize = 24.sp;
  static double displaySmallFontSize = 16.sp;
  static double displayMediumFontSize = 25.sp;
  static double displayLargeFontSize = 32.sp;
  static double bodyMediumFontSize = 15.sp;
  static double bodySmallFontSize = 12.sp;
  static ThemeData lightTheme = ThemeData(
    secondaryHeaderColor: Colors.black,
    indicatorColor: Colors.green,
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: TextStyle(
        color: Colors.red,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: Color(0xFF323030),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0),
        ),
      ),
    ),
    cardColor: Color(0xffd9d9d9),
    primaryColor: Color(0xFF92E3A9),
    textTheme: TextTheme(
      titleSmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: titleSmallFontSize,
        color: Color(0xFF92E3A9),
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: titleMediumFontSize,
        color: Color(0xFF92E3A9),
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: displaySmallFontSize,
        color: Color(0xFF000000),
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: displayMediumFontSize,
        color: Color(0xFF000000),
        fontWeight: FontWeight.w800,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: displayLargeFontSize,
        color: Color(0xFF000000),
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: bodyMediumFontSize,
        color: Color(0xFF000000),
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: bodySmallFontSize,
        color: Color(0xFF000000),
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: bodyMediumFontSize,
        color: Color(0xFF9D9D9D),
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    splashColor: Colors.transparent,
    secondaryHeaderColor: Colors.white,
    snackBarTheme: SnackBarThemeData(
      
      contentTextStyle: TextStyle(
        color: Colors.red,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0),
        ),
      ),
    ),
    cardColor: Color(0xff323030),
    scaffoldBackgroundColor: Color(0xFF323030),
    primaryColor: Color(0xFF92E3A9),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: displayLargeFontSize,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: titleSmallFontSize,
        color: Color(0xFF92E3A9),
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: titleMediumFontSize,
        color: Color(0xFF92E3A9),
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: displaySmallFontSize,
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: displayMediumFontSize,
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w800,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: bodyMediumFontSize,
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: bodySmallFontSize,
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: bodyMediumFontSize,
        color: Color(0xFF9D9D9D),
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

class Forms {
  static OutlineInputBorder regularBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF92E3A9), width: 2),
    borderRadius: BorderRadius.circular(8.0),
  );
  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: BorderSide(color: const Color.fromARGB(255, 233, 53, 40), width: 2),
    borderRadius: BorderRadius.circular(8.0),
  );
}
