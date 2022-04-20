import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/contact_model.dart';

class ContactAPI {
  static Future<List<Contact>> getContact() async {
    final response = await Dio().get(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
    );

    List<Contact> contacts = (response.data as List)
        .map((e) => Contact(id: e['id'], name: e['name'], phone: e['phone']))
        .toList();

    return contacts;
  }

  static Future<Contact?> getContactId(int id) async {
    final response = await Dio().get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/$id');

    if (response.statusCode == 200) {
      Contact listData = Contact.fromJson(response.data);
      return listData;
    }

    return null;
  }

  static Future<String> addContact(Contact contact) async {
    var dataContact = jsonEncode(<String, dynamic>{
      'id': contact.id,
      'name': contact.name,
      'phone': contact.phone,
    });
    final response = await Dio().post(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
      data: dataContact,
    );

    if (response.statusCode == 201) {
      return 'Tambah Berhasil';
    } else {
      return 'Tambah Gagal';
    }
  }
}
