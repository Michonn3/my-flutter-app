import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String userName;
  const HomeScreen({required this.userName, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Back!')),
      body: Padding(
        padding: const EdgeInsets.all(16), // add some space arount
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(height: 20),
                  Row(children: [Text('Profile')]),
                  Row(children: [Text('Refrigerator')]),
                  Row(children: [Text('Recipes')]),
                  Row(children: [Text('Reverse Meal Plan')]),
                  Row(children: [Text('About Us')]),
                  Row(children: [Text('FAQs')]),
                  Row(children: [Text('Contact Us')]),
                  SizedBox(height: 440),
                ],
              ),
            ),
            SizedBox(width: 16), // Space between column and cards
            // Cards on the right
            Expanded(
              // Prevent overflow if screen is small
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text('Card 1'),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text('Card 2'),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text('Card 3'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
