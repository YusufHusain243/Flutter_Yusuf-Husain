# (26) Finite State Machine & Unit Testing

Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Resume Finite State Machine & Unit Testing

## Task

1. buatlah sebuah halaman baru dengan MVVM lengkap untuk menampilkan data dari : https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods
2. dari MVVM diatas, lakukan unit test pada model api dengan menerapkan mocking

## Jawaban

1. program

   - MVVM foods

     - struktur_file <br>
       ![struktur_file](https://user-images.githubusercontent.com/74952343/164582171-70c3548b-10b2-4f59-ac2f-ee4b93f731fd.jpeg)
     - food_api <br>
       ![food_api](https://user-images.githubusercontent.com/74952343/164581954-f5073e4d-b1e2-4982-af2e-fb6398828c45.png)
     - food_model <br>
       ![food_model](https://user-images.githubusercontent.com/74952343/164582007-2cee3dd9-4e7f-416c-9f67-613c9ccab0df.png)

     - food_view_state <br>
       ![food_view_state](https://user-images.githubusercontent.com/74952343/164582028-322417e7-d9fe-4ce4-9723-a5e7cc08c860.png)

     - food_view_model <br>
       ![food_view_model](https://user-images.githubusercontent.com/74952343/164582043-32cb75e6-5c8a-4613-a768-f034d39f4453.png)

     - food_screen <br>
       ![food_screen](https://user-images.githubusercontent.com/74952343/164582090-997ee61e-0e03-4173-b953-78b2468b2184.png)

   - Testing

     - FoodAPI

       ```dart
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

       ```

     - FoodViewModel

       ```dart
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
       ```

2. output
