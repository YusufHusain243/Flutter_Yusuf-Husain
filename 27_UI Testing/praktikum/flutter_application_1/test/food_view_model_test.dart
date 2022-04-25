import 'package:flutter_application_1/screen/food/food_view_model.dart';
import 'package:flutter_application_1/screen/food/food_view_state.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'food_view_model_test.mocks.dart';

@GenerateMocks([FoodViewModel])
void main() {
  group('Food View Model', () {
    FoodViewModel foodViewModel = MockFoodViewModel();
    test('change state', () async {
      when(foodViewModel.ChangeState(FoodViewState.loading))
          .thenAnswer((_) async => FoodViewState.loading);
      var state = await foodViewModel.ChangeState(FoodViewState.loading);
      expect(state, FoodViewState.loading);
    });
  });
}
