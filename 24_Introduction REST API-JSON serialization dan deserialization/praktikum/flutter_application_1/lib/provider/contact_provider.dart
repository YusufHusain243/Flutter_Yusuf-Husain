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
