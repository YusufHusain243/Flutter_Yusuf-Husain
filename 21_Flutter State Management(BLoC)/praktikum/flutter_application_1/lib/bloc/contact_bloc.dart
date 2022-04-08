import 'package:flutter_application_1/bloc/contact_event.dart';
import 'package:flutter_application_1/bloc/contact_state.dart';
import 'package:flutter_application_1/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc()
      : super(
          ContactState(
            [
              DataContact(
                id: 1,
                name: 'Yusuf',
                numberPhone: '1111',
              )
            ],
          ),
        ) {
    on<AddContact>(
      (event, emit) {
        List<DataContact> newList = List.from(state.contacts)
          ..add(
            DataContact(
              id: event.id,
              name: event.name,
              numberPhone: event.phoneNumber,
            ),
          );
        emit(ContactState(newList));
      },
    );
  }
}
