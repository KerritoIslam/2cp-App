import 'package:flutter/material.dart';

class them {
    static ThemeData lightTheme = ThemeData(
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
        )
    );
}
