import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class theme {
  static double titleSmallFontSize = 16.sp;
  static double titleMediumFontSize = 24.sp;
  static double displaySmallFontSize = 16.sp;
  static double displayMediumFontSize = 24.sp;
  static double bodyMediumFontSize = 15.sp;
  static double bodySmallFontSize = 12.sp;
  static ThemeData lightTheme = ThemeData(
    secondaryHeaderColor: Colors.black,

      splashColor: Colors.transparent,
      scaffoldBackgroundColor: Color(0xFFFFFFFF),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: Color(0xFF323030),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8.0),
          ),
        ),
      ),
      primaryColor: Color(0xFF92E3A9),
            textTheme: TextTheme(
        titleSmall: GoogleFonts.poppins(
          fontSize: titleSmallFontSize,
          color: Color(0xFF92E3A9),
          fontWeight: FontWeight.w700,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: titleMediumFontSize,
          color: Color(0xFF92E3A9),
          fontWeight: FontWeight.w700,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: displaySmallFontSize,
          color: Color(0xFF000000),
          fontWeight: FontWeight.w700,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: displayMediumFontSize,
          color: Color(0xFF000000),
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: bodyMediumFontSize,
          color: Color(0xFF000000),
          fontWeight: FontWeight.w500,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: bodySmallFontSize,
          color: Color(0xFF000000),
          fontWeight: FontWeight.w400,
        ),
        labelMedium: GoogleFonts.poppins(
          fontSize: bodyMediumFontSize,
          color: Color(0xFF9D9D9D),
          fontWeight: FontWeight.w600,
        ),
      ));
  static ThemeData darkTheme = ThemeData(
      splashColor: Colors.transparent,
    secondaryHeaderColor: Colors.white,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8.0),
          ),
        ),
      ),
      scaffoldBackgroundColor: Color(0xFF323030),
      primaryColor: Color(0xFF92E3A9),
      textTheme: TextTheme(
        titleSmall: GoogleFonts.poppins(
          fontSize: titleSmallFontSize,
          color: Color(0xFF92E3A9),
          fontWeight: FontWeight.w700,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: titleMediumFontSize,
          color: Color(0xFF92E3A9),
          fontWeight: FontWeight.w700,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: displaySmallFontSize,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w700,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: displayMediumFontSize,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w700,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: bodyMediumFontSize,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w500,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: bodySmallFontSize,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w400,
        ),
        labelMedium: GoogleFonts.poppins(
          fontSize: bodyMediumFontSize,
          color: Color(0xFF9D9D9D),
          fontWeight: FontWeight.w500,
        ),
      ));
}

class Forms {
  static OutlineInputBorder regularBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF92E3A9), width: 2),
    borderRadius: BorderRadius.circular(8.0),
  );
  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide:
        BorderSide(color: const Color.fromARGB(255, 233, 53, 40), width: 2),
    borderRadius: BorderRadius.circular(8.0),
  );
}
