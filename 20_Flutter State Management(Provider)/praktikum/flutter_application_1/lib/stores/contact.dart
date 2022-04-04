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
