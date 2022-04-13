import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/model/contact.dart';

class ContactState extends Equatable {
  List<Contact> contacts;

  ContactState(this.contacts);
  @override
  List<Object?> get props => [contacts];
}
