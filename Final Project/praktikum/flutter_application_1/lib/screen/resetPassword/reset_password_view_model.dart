import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/api/users_api.dart';

class ResetPasswordViewModel with ChangeNotifier {
  Future<bool> resetPassword(int id, String password) async {
    try {
      var result = await UserAPI().resetPassword(id, password);
      if (result = true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
