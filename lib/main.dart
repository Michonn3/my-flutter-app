import 'package:flutter/material.dart';
import 'create_profile_page.dart';
import 'package:groceries_to_kart/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes to Kart',
      theme: ThemeData(fontFamily: 'LiberationSerif'),
      home: CreateProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
