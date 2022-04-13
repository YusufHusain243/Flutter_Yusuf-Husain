import 'package:flutter_application_1/bloc/contact_event.dart';
import 'package:flutter_application_1/bloc/contact_state.dart';
import 'package:flutter_application_1/model/contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc()
      : super(
          ContactState(
            [
              Contact(
                name: 'Yusuf',
                phoneNumber: '1111',
              )
            ],
          ),
        ) {
    on<AddContact>(
      (event, emit) async {
        List<Contact> newList = List.from(state.contacts)
          ..add(
            Contact(
              name: event.name,
              phoneNumber: event.phoneNumber,
            ),
          );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final String dataContact = Contact.encode(newList);
        await prefs.setString('contactBloc', dataContact);
        emit(ContactState(newList));
      },
    );
    on<GetContact>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? contactString = prefs.getString('contactBloc');
      List<Contact> data = Contact.decode(contactString!);
      emit(ContactState(data));
    });
  }
}
