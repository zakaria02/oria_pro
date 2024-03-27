import 'package:flutter/material.dart';

import '../constants/oria_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: OriaColors.primaryColor,
      scaffoldBackgroundColor: OriaColors.scaffoldBackgroundColor,
      dividerColor: OriaColors.dividerColor,
      disabledColor: OriaColors.disabledColor,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: "Marcellus",
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: OriaColors.primaryColor,
        ),
        titleMedium: TextStyle(
          fontFamily: "Marcellus",
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: OriaColors.primaryColor,
        ),
        titleSmall: TextStyle(
          fontFamily: "Marcellus",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: OriaColors.primaryColor,
        ),
        displayLarge: TextStyle(
          fontFamily: "Raleway",
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: OriaColors.primaryColor,
        ),
        displayMedium: TextStyle(
          fontFamily: "Raleway",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: OriaColors.primaryColor,
        ),
        labelLarge: TextStyle(
          fontFamily: "Raleway",
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: OriaColors.primaryColor,
        ),
        labelMedium: TextStyle(
          fontFamily: "Raleway",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: OriaColors.primaryColor,
        ),
        labelSmall: TextStyle(
          fontFamily: "Marcellus",
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: OriaColors.primaryColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: "Raleway",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: OriaColors.primaryColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: OriaColors.green,
          textStyle: const TextStyle(
            fontFamily: "Raleway",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
        ),
      ),
    );
  }
}
