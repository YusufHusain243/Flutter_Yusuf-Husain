import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/users_model.dart';

class UserAPI {
  Future<String> regis(User user) async {
    print(user);
    var dataRegis = jsonEncode(<String, dynamic>{
      'email': user.email,
      'password': user.password,
      'username': user.username,
    });
    final response = await Dio().post(
      "https://yusuf.bentenserver.my.id/public/api/users/registration",
      data: dataRegis,
    );

    if (response.statusCode == 201) {
      return 'Registration Success';
    } else {
      return 'Registration Failed';
    }
  }

  Future<Map<String, dynamic>> login(User user) async {
    // print(user);
    var dataLogin = jsonEncode(<String, dynamic>{
      'email': user.email,
      'password': user.password,
    });
    final response = await Dio().post(
      "https://yusuf.bentenserver.my.id/public/api/users/login",
      data: dataLogin,
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return {};
    }
  }

  static Future<bool> resetPassword(int id, String password) async {
    var resetPassword = jsonEncode(<String, dynamic>{
      'id': id,
      'password': password,
    });

    final response = await Dio().patch(
      "https://yusuf.bentenserver.my.id/public/api/users/reset-pass",
      data: resetPassword,
    );

    if (response.statusCode == 200) {
      return response.data['status'];
    } else {
      return false;
    }
  }
}
