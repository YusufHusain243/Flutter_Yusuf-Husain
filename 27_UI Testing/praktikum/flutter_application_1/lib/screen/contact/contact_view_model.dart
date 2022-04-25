import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/api/contact_api.dart';
import 'package:flutter_application_1/model/contact_model.dart';
import 'package:flutter_application_1/screen/contact/contact_view_state.dart';

class ContactViewModel with ChangeNotifier {
  ContactViewState _state = ContactViewState.none;
  ContactViewState get state => _state;

  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;

  Contact _contactId = Contact(id: 4, name: 'name', phone: 'phone');
  Contact get contactId => _contactId;

  String? status;

  ChangeState(ContactViewState s) {
    _state = s;
    notifyListeners();
  }

  getAllContacts() async {
    ChangeState(ContactViewState.loading);
    try {
      final c = await ContactAPI.getContact();
      _contacts = c;
      notifyListeners();
      ChangeState(ContactViewState.none);
    } catch (e) {
      ChangeState(ContactViewState.error);
    }
  }

  getContactId(int id) async {
    ChangeState(ContactViewState.loading);
    try {
      final c = await ContactAPI.getContactId(id);
      _contactId = c!;
      notifyListeners();
      ChangeState(ContactViewState.none);
    } catch (e) {
      ChangeState(ContactViewState.error);
    }
  }

  addContact(Contact contact) async {
    ChangeState(ContactViewState.loading);
    try {
      final c = await ContactAPI.addContact(contact);
      status = c;
      _contacts.add(contact);
      notifyListeners();
      ChangeState(ContactViewState.none);
    } catch (e) {
      ChangeState(ContactViewState.error);
    }
  }
}
