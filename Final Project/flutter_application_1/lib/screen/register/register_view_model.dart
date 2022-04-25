import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/screen/register/register_view_state.dart';

class RegisterViewModel with ChangeNotifier {
  RegisterViewState _state = RegisterViewState.success;
  RegisterViewState get state => _state;

  ChangeState(RegisterViewState s) {
    _state = s;
    notifyListeners();
  }

  register() async {
    try {
      ChangeState(RegisterViewState.loading);
      Timer(const Duration(seconds: 2), () {
        ChangeState(RegisterViewState.success);
      });
    } catch (e) {
      ChangeState(RegisterViewState.error);
    }
  }
}
