/*
 This file controls how a card is styled. 
 You may re-use StyledCard with custom icons as needed.
*/
import 'package:flutter/material.dart';
import 'custom_icon.dart';

class StyledCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final double iconSize;
  final Color iconColor;

  const StyledCard({
    super.key,
    required this.title,
    required this.icon,
    this.iconSize = 60,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    if (title.isEmpty) return const SizedBox();

    return Card(
      color: Colors.transparent,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          // Controls color gradient in Cards
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFF808000), Color(0xFFB9A76A)],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        height: 200,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8),
            CustomIcon(icon: icon, size: iconSize, color: Color(0XFFFFFDD0)),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF708090),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              child: Text('View'),
            ),
          ],
        ),
      ),
    );
  }
}
