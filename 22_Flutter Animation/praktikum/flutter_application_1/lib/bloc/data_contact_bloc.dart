import 'package:flutter_application_1/bloc/data_contact_event.dart';
import 'package:flutter_application_1/bloc/data_contact_state.dart';
import 'package:flutter_application_1/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataContactBloc extends Bloc<DataContactEvent, DataContactState> {
  DataContactBloc()
      : super(
          DataContactState([
            DetailDataContact(
              id: 1,
              namaPanggilan: 'Usuf',
              pendidikan: 'SMA',
              alamat: 'Palangka Raya',
            )
          ]),
        ) {
    on<AddDetailContact>((event, emit) {
      List<DetailDataContact> newList = List.from(state.detailContact)
        ..add(
          DetailDataContact(
            id: event.id,
            namaPanggilan: event.namaPanggilan,
            pendidikan: event.pendidikan,
            alamat: event.alamat,
          ),
        );
      emit(DataContactState(newList));
    });
  }
}
