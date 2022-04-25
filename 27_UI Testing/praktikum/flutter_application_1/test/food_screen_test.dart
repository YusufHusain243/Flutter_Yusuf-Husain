import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/food/detail_food_screen.dart';
import 'package:flutter_application_1/screen/food/food_screen.dart';
import 'package:flutter_application_1/screen/food/food_view_model.dart';
import 'package:flutter_application_1/screen/main_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('test main screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MainScreen(),
    ));

    expect(find.byKey(const Key('food_button')), findsOneWidget);
    await tester.tap(find.byKey(const Key('food_button')));
  });

  testWidgets('test error', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MainScreen(),
    ));

    expect(find.byKey(const Key('food_button')), findsNothing);
  });

  testWidgets('test food screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => FoodViewModel(),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FoodScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.byKey(const Key('title_app_food')), findsOneWidget);
  });

  testWidgets('test detail food screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => FoodViewModel(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DetailFoodScreen(
            id: 1,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byKey(const Key('title_app_detail')), findsOneWidget);
  });
}
