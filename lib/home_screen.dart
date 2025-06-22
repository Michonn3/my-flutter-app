import 'package:flutter/material.dart';
import './utils/pdf_handler.dart';

class HomeScreen extends StatelessWidget {
  final String userName;
  const HomeScreen({required this.userName, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 40),
                Row(children: [Text('Profile')]),
                Row(children: [Text('Refrigerator')]),
                Row(children: [Text('Recipes')]),
                Row(children: [Text('Reverse Meal Plan')]),
                Row(children: [Text('About Us')]),
                Row(children: [Text('FAQs')]),
                Row(children: [Text('Contact Us')]),
              ],
            ),
          ),
        ],
      ),
    );
    /* return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome back, $userName!',
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
    );*/
  }
}
