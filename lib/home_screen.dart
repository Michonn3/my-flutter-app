import 'package:flutter/material.dart';
import './utils/pdf_handler.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FilePickerHomePage()),
            );
          },
          child: Text('Go to Upload Page'),
        ),
      ),
    );
  }
}
