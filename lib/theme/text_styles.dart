import 'package:flutter/material.dart';

TextSpan styledCardText(String text) {
  if (text.isEmpty) return TextSpan();

  return TextSpan(
    children: [
      TextSpan(
        text: text[0], // First letter
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: text.substring(1), // Rest of the string
        style: TextStyle(fontSize: 16),
      ),
    ],
  );
}
