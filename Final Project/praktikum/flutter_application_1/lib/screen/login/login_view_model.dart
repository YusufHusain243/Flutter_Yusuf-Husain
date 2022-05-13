import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/api/users_api.dart';
import 'package:flutter_application_1/model/users_model.dart';

class LoginViewModel with ChangeNotifier {
  User _user = User(id: 0, username: '', email: '', password: '');
  User get user => _user;

  String _status = 'Loading';
  String get status => _status;

  Future<bool> login(User user) async {
    try {
      final u = await UserAPI().login(user);
      if (u['status'] = true) {
        _status = 'Login Success';
        _user = User(
          id: u['data']['id'],
          username: u['data']['username'],
          email: u['data']['email'],
          password: u['data']['password'],
        );
        notifyListeners();
        return true;
      } else {
        _status = 'Login Failed';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _status = 'Login Failed';
      notifyListeners();
      return false;
    }
  }
}
