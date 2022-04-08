import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/contact_bloc.dart';
import 'package:flutter_application_1/bloc/data_contact_bloc.dart';
import 'package:flutter_application_1/detail_contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ContactBloc>(
          create: (context) => ContactBloc(),
        ),
        BlocProvider(
          create: (context) => DataContactBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const ContactPage(),
          '/detail_contact': (context) => const DetailContact(),
        },
      ),
    );
  }
}
