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
      "https://teamworkapp.xyz/api/users/registration",
      data: dataRegis,
    );
    if (response.statusCode == 200 && response.data['status'] == 'true') {
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
      "https://teamworkapp.xyz/api/users/login",
      data: dataLogin,
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return {};
    }
  }

  Future<bool> resetPassword(int id, String password) async {
    var resetPassword = jsonEncode(<String, dynamic>{
      'id': id,
      'password': password,
    });

    final response = await Dio().patch(
      "https://teamworkapp.xyz/api/users/reset-pass",
      data: resetPassword,
    );

    if (response.statusCode == 200) {
      return response.data['status'];
    } else {
      return false;
    }
  }
}
