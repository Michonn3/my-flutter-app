import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'LiberationSerif',
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
    useMaterial3: true,
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 18),
      bodyMedium: TextStyle(fontSize: 16),
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
