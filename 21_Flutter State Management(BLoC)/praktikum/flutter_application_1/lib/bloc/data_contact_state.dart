import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/model.dart';

class DataContactState extends Equatable {
  List<DetailDataContact> detailContact;

  DataContactState(this.detailContact);
  @override
  List<Object?> get props => [detailContact];
}
