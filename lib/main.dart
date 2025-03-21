import 'package:flutter/material.dart';
import 'create_profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Demo',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: CreateProfilePage(),
    );
  }
}
