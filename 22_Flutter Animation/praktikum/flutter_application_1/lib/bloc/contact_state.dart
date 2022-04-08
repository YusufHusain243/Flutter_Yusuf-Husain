import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/model.dart';

class ContactState extends Equatable {
  List<DataContact> contacts;

  ContactState(this.contacts);
  @override
  List<Object?> get props => [contacts];
}
