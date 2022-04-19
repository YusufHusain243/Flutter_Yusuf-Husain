import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/api/contact_api.dart';
import 'package:flutter_application_1/model/contact_model.dart';

class ContactViewModel with ChangeNotifier {
  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;

  Contact? _contactId;
  Contact? get contactId => _contactId;

  getAllContacts() async {
    final c = await ContactAPI.getContact();
    _contacts = c;
    notifyListeners();
  }

  getContactId(int id) async {
    final c = await ContactAPI.getContactId(id);
    _contactId = Contact(id: c!.id, name: c.name, phone: c.phone);
    notifyListeners();
  }
}
