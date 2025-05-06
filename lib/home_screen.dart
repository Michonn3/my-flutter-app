import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Home')),
      body: Center(child: Text('You made it!', style: TextStyle(fontSize: 24))),
    );
  }
}
