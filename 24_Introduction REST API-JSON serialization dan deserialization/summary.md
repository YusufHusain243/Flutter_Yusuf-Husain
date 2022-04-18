# (24) Introduction REST API – JSON serialization/deserialization

Nama : Yusuf Husain <br>
Nim : 193020503032 <br>
Email : yusufhusain243@gmail.com <br>
Universitas : Universitas Palangka Raya

## Resume Introduction REST API – JSON serialization/deserialization

1. REST API memiliki kepanjangan representational state transfer application programming interface. yang mana hal ini berarti arsitektural yang memisahkan tampilan dengan proses bisnis. bagian tampilan dengan proses bisnis berkirim data melalui http request.

2. DIO dio adalah salah satu package yang ada di flutter dimana gunanya adalah sebagai HTTP Client yang dimanfaatkan untuk melakukan REST API

3. JSON
   - Serialisasi JSON
     artinya adalah mengubah struktur data ke dalam bentuk JSON. dimana dalam pembuatan nya menggunakan fungsi jsonEncode yang berasal dari package dart:convert
   - Deserialisasi JSON
     ini adalah kebalikan dari Serialisasi JSON yang mana mengubah bentuk JSON ke dalam struktur data. dimana dalam pembuatan nya menggunakan fungsi jsonEncode yang berasal dari package dart:convert

## Task

1. Lakukan POST request dengan menggunakan Dio untuk mengirimkan data contact! Gunakan URL yang terdapat pada slide ke 12

2. ubhlah bentuk JSON berikut ke dalam bentuk Object dari suatu Class! Gunakan data JSON pada URL https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2

## Jawaban

berikut adalah program dan outputnya

1. POST, GET and GET by ID using provider
```dart
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contact.dart';
import 'package:http/http.dart' as http;

class ContactProvider extends ChangeNotifier {
  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;
  String status = '';
  Dio api = new Dio();

  Future<String> add(Contact contact) async {
    final response = await http.post(
      Uri.parse(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': contact.id,
        'name': contact.name,
        'phone': contact.phone,
      }),
    );
    if (response.statusCode == 201) {
      status = 'Tambah Berhasil';
      return status;
    } else {
      status = 'Tambah gagal';
      return status;
    }
  }

  Future<List<Contact>> getContact() async {
    Response<List<dynamic>> response = await api.get(
      "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts",
    );
    if (response.statusCode == 200) {
      List<Contact>? contactList =
          response.data?.map((item) => Contact.fromJson(item)).toList();
      _contacts = contactList!;
      print(_contacts);
      return _contacts;
    }
    return _contacts;
  }

  Future getContactId(int id) async {
    final response = await api.get(
      "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/$id",
    );
    if (response.statusCode == 200) {
      final userdata2 = Contact.fromJson(response.data);
      _contacts.add(Contact(
          id: userdata2.id, name: userdata2.name, phone: userdata2.phone));
    }
  }
}
```

3. Output

https://user-images.githubusercontent.com/74952343/163694947-23b2949a-56b3-4761-b7f1-79898decc5bd.mp4


