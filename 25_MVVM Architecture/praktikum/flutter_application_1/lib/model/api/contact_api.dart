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
}
