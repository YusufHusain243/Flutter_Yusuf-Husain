import 'package:flutter_application_1/bloc/contact_event.dart';
import 'package:flutter_application_1/bloc/contact_state.dart';
import 'package:flutter_application_1/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc()
      : super(ContactState([DataContact(name: 'Yusuf', numberPhone: '1111')])) {
    on<AddContact>((event, emit) {
      state.contacts
          .add(DataContact(name: event.name, numberPhone: event.phoneNumber));
      emit(ContactState(state.contacts));
    });
  }
}
