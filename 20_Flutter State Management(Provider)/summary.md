# (20) Flutter State Management (Provider)

Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Resume Flutter State Management (Provider)

1. state adalah data yang dapat dibaca saat pembuatan widget. state juga dapat berubah saat widget aktif dan hanya dimiliki oleh statefulwidget
2. oleh karena itu, maka diperlukan global state agar antara widget dapat memanfaatkan state yang sama dengan mudah.
3. global state sendiri adalah state biasa yang dapat digunakan pada seluruh widget.

## Task

1. buatlah state yang menyimpan data list contacts pada halaman contacts
2. pindahkan state tersebut ke dalam global state

## Jawaban

1. program

   ```dart
   import 'package:flutter/material.dart';
   import 'package:flutter_application_1/home_page.dart';
   import 'package:provider/provider.dart';
   import 'package:flutter_application_1/stores/contact.dart' as contact_store;

   void main() {
   runApp(
       MultiProvider(
       providers: [
           ChangeNotifierProvider(
           create: (_) => contact_store.Contact(),
           ),
       ],
       child: const MyApp(),
       ),
   );
   }

   class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return const MaterialApp(
       title: 'Phone Book App',
       home: HomePage(),
       );
   }
   }
   ```

   ```dart
   import 'package:flutter/material.dart';
   import 'package:flutter_application_1/model.dart';
   import 'package:provider/provider.dart';
   import 'package:flutter_application_1/stores/contact.dart' as contact_store;

   class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

   @override
   State<HomePage> createState() => _HomePageState();
   }

   class _HomePageState extends State<HomePage> {
   String name = '';
   String phoneNumber = '';

   var nameController = TextEditingController();
   var phoneNumberController = TextEditingController();
   var formKey = GlobalKey<FormState>();

   @override
   void dispose() {
       nameController.dispose();
       phoneNumberController.dispose();
       super.dispose();
   }

   @override
   Widget build(BuildContext context) {
       final contextProvider = Provider.of<contact_store.Contact>(context);
       return Scaffold(
       appBar: AppBar(
           title: const Text('Phone Book App'),
       ),
       body: Form(
           key: formKey,
           child: Column(
           children: [
               TextField(
               controller: nameController,
               onChanged: (String value) {
                   name = value;
               },
               ),
               TextField(
               controller: phoneNumberController,
               onChanged: (String value) {
                   phoneNumber = value;
               },
               ),
               ElevatedButton(
               onPressed: () {
                   if (!formKey.currentState!.validate()) return;
                   formKey.currentState!.save();
                   contextProvider.add(
                   GetContact(
                       name: name,
                       phoneNumber: phoneNumber,
                   ),
                   );
                   nameController.clear();
                   phoneNumberController.clear();
               },
               child: const Text('Add Number'),
               ),
               Expanded(
               child: ListView.builder(
                   itemCount: contextProvider.contacts.length,
                   itemBuilder: (context, index) {
                   return ListTile(
                       title: Text(contextProvider.contacts[index].name),
                       subtitle: Text(contextProvider.contacts[index].phoneNumber),
                   );
                   },
               ),
               ),
           ],
           ),
       ),
       );
   }
   }
   ```

   ```dart
   import 'package:flutter/cupertino.dart';
   import 'package:flutter_application_1/model.dart';

   class Contact extends ChangeNotifier {
   final List<GetContact> _contacts = [];
   List<GetContact> get contacts => _contacts;

   void add(GetContact contact) {
       _contacts.add(contact);

       notifyListeners();
   }
   }
   ```

   ```dart
   class GetContact {
   String name = '';
   String phoneNumber = '';

   GetContact({
       required this.name,
       required this.phoneNumber,
   });
   }
   ```

2. output
