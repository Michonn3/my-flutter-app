// This file defines global styles

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData sandyTheme = ThemeData(
    fontFamily: 'LiberationSerif', // applies to all text
    //colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFD2B48C)),
    useMaterial3: true,
    scaffoldBackgroundColor: Color(
      0xFFD2B48C,
    ), // Tan background for all Scaffolds

    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFD2B48C),
      foregroundColor: Colors.black, // Text/ icon in AppBar
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        fontFamily: 'LiberationSerif',
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
    ),
  );
}
