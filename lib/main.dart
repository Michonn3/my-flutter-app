import 'package:flutter/material.dart';
import './screens/create_profile_page.dart';
import 'theme/app_theme.dart';
import 'package:flutter/rendering.dart'; // ONLY USE IN DEVELOPMENT- RENDERS WIDGET OUTLINES

void main() {
  debugPaintSizeEnabled =
      false; // ONLY USE IN DEVELOPMENT- RENDERS WIDGET OUTLINE
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes to Kart',
      theme: AppTheme.sandyTheme,
      home: CreateProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
