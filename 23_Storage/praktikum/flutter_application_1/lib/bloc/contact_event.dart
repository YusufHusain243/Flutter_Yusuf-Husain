import 'package:equatable/equatable.dart';

abstract class ContactEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddContact extends ContactEvent {
  final String name;
  final String phoneNumber;
  AddContact(
    this.name,
    this.phoneNumber,
  );
}

class GetContact extends ContactEvent {}
