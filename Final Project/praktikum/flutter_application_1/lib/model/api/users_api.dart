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
      "http://10.0.2.2:8000/api/users/registration",
      data: dataRegis,
    );
    // final response = await Dio().post(
    //   "https://yusuf.bentenserver.my.id/public/api/users/registration",
    //   data: dataRegis,
    // );
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
      "http://10.0.2.2:8000/api/users/login",
      data: dataLogin,
    );
    // final response = await Dio().post(
    //   "https://yusuf.bentenserver.my.id/public/api/users/login",
    //   data: dataLogin,
    // );

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
      "http://10.0.2.2:8000/api/users/reset-pass",
      data: resetPassword,
    );
    // final response = await Dio().patch(
    //   "https://yusuf.bentenserver.my.id/public/api/users/reset-pass",
    //   data: resetPassword,
    // );

    if (response.statusCode == 200) {
      return response.data['status'];
    } else {
      return false;
    }
  }
}
