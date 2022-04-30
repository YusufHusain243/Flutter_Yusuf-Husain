import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/users_model.dart';

class UserAPI {
  Future<String> regis(User user) async {
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
}
