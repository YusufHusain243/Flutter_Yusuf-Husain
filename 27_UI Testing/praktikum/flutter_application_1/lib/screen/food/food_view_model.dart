import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/api/food_api.dart';
import 'package:flutter_application_1/model/food_model.dart';
import 'package:flutter_application_1/screen/food/food_view_state.dart';

class FoodViewModel with ChangeNotifier {
  FoodViewState _state = FoodViewState.none;
  FoodViewState get state => _state;

  List<Food> _foods = [];
  List<Food> get foods => _foods;

  FoodAPI foodAPI = new FoodAPI();

  ChangeState(FoodViewState s) {
    _state = s;
    notifyListeners();
  }

  getAllFood() async {
    ChangeState(FoodViewState.loading);
    try {
      final f = await foodAPI.getFood();
      _foods = f;
      notifyListeners();
      ChangeState(FoodViewState.none);
    } catch (e) {
      ChangeState(FoodViewState.error);
    }
  }
}
