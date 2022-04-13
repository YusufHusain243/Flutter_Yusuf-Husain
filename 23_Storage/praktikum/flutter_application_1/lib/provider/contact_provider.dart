import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/contact.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;

  void add(Contact contact) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _contacts.add(contact);
    final String dataContact = Contact.encode(_contacts);
    await prefs.setString('contact', dataContact);
    notifyListeners();
  }

  Future<void> getContact() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? contactString = prefs.getString('contact');
    final List<Contact> data = Contact.decode(contactString!);
    _contacts = data;
    notifyListeners();
  }
}
