import 'package:equatable/equatable.dart';

class DataContactEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddDetailContact extends DataContactEvent {
  final int id;
  final String namaPanggilan;
  final String pendidikan;
  final String alamat;
  AddDetailContact(
    this.id,
    this.namaPanggilan,
    this.pendidikan,
    this.alamat,
  );
}
