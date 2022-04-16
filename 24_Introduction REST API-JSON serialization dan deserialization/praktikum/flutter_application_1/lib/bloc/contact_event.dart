import 'package:equatable/equatable.dart';

abstract class ContactEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddContact extends ContactEvent {
  final int id;
  final String name;
  final String phone;
  AddContact(
    this.id,
    this.name,
    this.phone,
  );
}

class GetContact extends ContactEvent {}
