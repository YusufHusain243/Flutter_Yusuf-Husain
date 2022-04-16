import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/bloc/contact_event.dart';
import 'package:flutter_application_1/bloc/contact_state.dart';
import 'package:flutter_application_1/model/contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  Dio api = new Dio();
  ContactBloc()
      : super(
          ContactState(
            [
              Contact(),
            ],
            '',
          ),
        ) {
    on<AddContact>(
      (event, emit) async {
        List<Contact> newList = List.from(state.contacts)
          ..add(
            Contact(
              id: event.id,
              name: event.name,
              phone: event.phone,
            ),
          );
        final response = await http.post(
          Uri.parse(
            'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
          ),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'id': event.id,
            'name': event.name,
            'phone': event.phone,
          }),
        );
        if (response.statusCode == 201) {
          emit(ContactState(newList, 'Tambah data berhasil'));
        } else {
          emit(ContactState([], 'Tambah data gagal'));
        }
      },
    );

    on<GetContact>((event, emit) async {
      Response<List<dynamic>> response = await api.get(
        "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts",
      );
      if (response.statusCode == 200) {
        List<Contact>? contactList =
            response.data?.map((item) => Contact.fromJson(item)).toList();
        emit(ContactState(contactList!, 'Berhasil Get Data'));
      }
    });
  }
}
