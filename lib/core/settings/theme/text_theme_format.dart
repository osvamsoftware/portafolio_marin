import 'package:flutter/material.dart';

class TextThemeData {
  static TextTheme getTextTheme(Color color) {
    return TextTheme(
      displayLarge: TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: 37,
      ),
      displayMedium: TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: 23,
      ),
      displaySmall: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 23,
      ),
      headlineMedium: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 21,
      ),
      titleMedium: TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 17,
        wordSpacing: 0.41,
      ),
      titleSmall: TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: 15,
        height: 1.6,
      ),
      headlineSmall: TextStyle(
        color: color,
        fontWeight: FontWeight.w300,
        fontSize: 16,
      ),
      bodyLarge: TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 2,
      ),
      bodyMedium: TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
    );
  }
}

class TextStyleApp {
  final TextStyle bodyMedium = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  final displayLarge = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 37,
  );
  final displayMedium = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 27,
  );

  final displaySmall = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 23,
  );
}

final TextStyleApp textStyleApp = TextStyleApp();
