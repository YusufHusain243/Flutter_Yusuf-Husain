import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/food_model.dart';

class FoodAPI {
  Future<List<Food>> getFood() async {
    final response = await Dio().get(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods',
    );

    if (response.statusCode == 200) {
      List<Food> foods = (response.data as List)
          .map((e) => Food(id: e['id'], name: e['name']))
          .toList();

      return foods;
    }
    return [];
  }
}
