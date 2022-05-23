import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/login/login_screen.dart';
import 'package:flutter_application_1/screen/login/login_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('login screen', () {
    testWidgets('test logo', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => LoginViewModel(),
            ),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
          ),
        ),
      );
      expect(find.byKey(const Key('logo')), findsOneWidget);
    });

    testWidgets('test input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => LoginViewModel(),
            ),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
          ),
        ),
      );
      await tester.enterText(find.byKey(const Key('email')), 'hi');
      expect(find.text('hi'), findsOneWidget);
    });

    testWidgets('test button register', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => LoginViewModel(),
            ),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
          ),
        ),
      );
      var button = find.byKey(const Key('register'));
      expect(button, findsOneWidget);
    });
  });
}
