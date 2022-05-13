import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/api/users_api.dart';
import 'package:flutter_application_1/model/users_model.dart';

class RegisterViewModel with ChangeNotifier {
  String _status = 'Loading';
  String get status => _status;

  Future<bool> register(User user) async {
    try {
      final u = await UserAPI().regis(user);
      _status = u.toString();
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
