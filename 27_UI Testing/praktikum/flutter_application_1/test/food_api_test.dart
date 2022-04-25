import 'package:flutter_application_1/model/api/food_api.dart';
import 'package:flutter_application_1/model/food_model.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'food_api_test.mocks.dart';

@GenerateMocks([FoodAPI])
void main() {
  group('Food Api', () {
    FoodAPI foodAPI = MockFoodAPI();
    test('get all foods', () async {
      when(foodAPI.getFood()).thenAnswer(
        (_) async => <Food>[
          Food(id: 1, name: 'a'),
        ],
      );
      var foods = await foodAPI.getFood();
      expect(foods.isNotEmpty, true);
    });
  });
}
