import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/food/food_screen.dart';
import 'package:flutter_application_1/screen/main_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test food screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: FoodScreen(),
    ));

    expect(find.text('data'), findsOneWidget);
  });

//   testWidgets('[Provider] Update when the value changes', (tester) async {
//     final _providerKey = GlobalKey();
//     final _childKey = GlobalKey();
//     BuildContext context;
//     await tester.pumpWidget(StreamProvider(
//       key: _providerKey,
//       builder: (c) {
//         context = c;
//         return _controller.stream;
//       },
//       child: Container(key: _childKey),
//     ));
// // Check the context test...
//     expect(context, equals(_providerKey.currentContext));
// // Check the model test (if null)...
//     expect(Provider.of<Location>(_childKey.currentContext), null);
//     _controller.add(Location(city: 'London'));
// // Delay the pump...
//     await Future.microtask(tester.pump);
// // Check if the model passed (with some value) is the same as received...
//     expect(
//       Provider.of<Location>(_childKey.currentContext).toJson(),
//       _locationModel.toJson(),
//     );
//     await _controller.close();
//   });
}
