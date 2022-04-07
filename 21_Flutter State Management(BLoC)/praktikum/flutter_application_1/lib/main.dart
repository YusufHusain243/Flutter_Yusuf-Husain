import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/contact_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloc>(
      create: (context) => ContactBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: ContactPage(),
        ),
      ),
    );
  }
}
