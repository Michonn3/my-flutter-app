import 'package:flutter/material.dart';
import '../widgets/cards_stylized.dart';

class HomeScreen extends StatelessWidget {
  final String userName;

  const HomeScreen({required this.userName, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 12),
            Text(
              'Welcome back, $userName!',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 26),
            ),
            Text('LET\'S GET COOKING!', style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: Image.asset(
                'assets/images/Flowing_Earth_Waves_Green.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16), // add some space arount
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(children: [Text('Profile', softWrap: true)]),
                      Row(children: [Text('Refrigerator', softWrap: true)]),
                      Row(children: [Text('Recipes', softWrap: true)]),
                      Row(
                        children: [Text('Reverse Meal Plan', softWrap: true)],
                      ),
                      Row(children: [Text('About Us', softWrap: true)]),
                      Row(children: [Text('FAQs', softWrap: true)]),
                      Row(children: [Text('Contact Us', softWrap: true)]),
                    ],
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: StyledCard(
                          title: 'Fridge',
                          icon: Icons.egg_outlined,
                          iconColor: Colors.lightBlueAccent,
                        ),
                      ),
                      SizedBox(width: 8),

                      Expanded(
                        child: StyledCard(
                          title: 'Recipes',
                          icon: Icons.menu_book_rounded,
                          iconColor: Colors.deepOrangeAccent,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: StyledCard(
                          title: 'Reverse Meal Plan',
                          icon: Icons.receipt_long_rounded,
                          iconColor: Colors.deepOrangeAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
