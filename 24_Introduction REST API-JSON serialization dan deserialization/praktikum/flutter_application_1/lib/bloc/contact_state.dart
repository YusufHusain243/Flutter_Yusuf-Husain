import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/model/contact.dart';

class ContactState extends Equatable {
  List<Contact> contacts;
  String? status;

  ContactState(this.contacts, this.status);
  @override
  List<Object?> get props => [contacts];
}
