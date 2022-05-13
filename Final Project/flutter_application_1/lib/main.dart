import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/detailProject/detail_project_view_model.dart';
import 'package:flutter_application_1/screen/home/home_view_model.dart';
import 'package:flutter_application_1/screen/login/login_screen.dart';
import 'package:flutter_application_1/screen/login/login_view_model.dart';
import 'package:flutter_application_1/screen/register/register_view_model.dart';
import 'package:flutter_application_1/screen/resetPassword/reset_password_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RegisterViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailProjectViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ResetPasswordViewModel(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    ),
  );
}
