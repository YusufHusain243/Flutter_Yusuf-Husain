import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/contact/contact_screen.dart';
import 'package:flutter_application_1/screen/food/food_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              key: const Key('button contact'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactScreen(),
                  ),
                );
              },
              child: const Text('Contact'),
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              key: const Key('food_button'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FoodScreen(),
                  ),
                );
              },
              child: const Text('Food'),
            ),
          ],
        ),
      ),
    );
  }
}
