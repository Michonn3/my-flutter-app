import 'package:flutter/material.dart';
import 'package:groceries_to_kart/screens/recipes_page.dart';
import 'package:groceries_to_kart/screens/reverse_meal_plan.dart';
import '../widgets/cards_stylized.dart';
import 'package:groceries_to_kart/screens/image_upload_screen.dart';

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
            Text('Let\'s Get Cooking!', style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Image.asset('assets/images/waves.jpg', fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16), // add some space arount
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
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
                          destination: const ImageUploadScreen(),
                        ),
                      ),
                      SizedBox(width: 8),

                      Expanded(
                        child: StyledCard(
                          title: 'Recipes',
                          icon: Icons.menu_book_rounded,
                          destination: const RecipesPage(),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: StyledCard(
                          title: 'Reverse Meal Plan',
                          icon: Icons.receipt_long_rounded,
                          destination: const ReverseMealPlan(),
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
