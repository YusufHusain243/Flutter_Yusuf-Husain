// Mocks generated by Mockito 5.1.0 from annotations
// in flutter_application_1/test/food_api_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:flutter_application_1/model/api/food_api.dart' as _i2;
import 'package:flutter_application_1/model/food_model.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [FoodAPI].
///
/// See the documentation for Mockito's code generation for more information.
class MockFoodAPI extends _i1.Mock implements _i2.FoodAPI {
  MockFoodAPI() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Food>> getFood() =>
      (super.noSuchMethod(Invocation.method(#getFood, []),
              returnValue: Future<List<_i4.Food>>.value(<_i4.Food>[]))
          as _i3.Future<List<_i4.Food>>);
}
