import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/contact/contact_view_model.dart';
import 'package:flutter_application_1/screen/food/food_view_model.dart';
import 'package:flutter_application_1/screen/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContactViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => FoodViewModel(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    ),
  );
}
