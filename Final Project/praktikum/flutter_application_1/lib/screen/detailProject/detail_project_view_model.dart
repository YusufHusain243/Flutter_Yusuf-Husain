import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/api/detail_project_api.dart';
import 'package:flutter_application_1/model/detail_project.dart';
import 'package:flutter_application_1/screen/detailProject/detail_project_view_state.dart';

class DetailProjectViewModel with ChangeNotifier {
  DetailProjectViewState _state = DetailProjectViewState.loading;
  DetailProjectViewState get state => _state;

  List<DetailProject> _detailProjects = [];
  List<DetailProject> get detailProjects => _detailProjects;

  String _status = 'Loading';
  String get status => _status;

  ChangeState(DetailProjectViewState s) {
    _state = s;
    notifyListeners();
  }

  getDetailProjects(int id) async {
    ChangeState(DetailProjectViewState.loading);
    try {
      final p = await DetailProjectAPI().getDetailProject(id);
      _detailProjects = p;
      notifyListeners();
      ChangeState(DetailProjectViewState.success);
    } catch (e) {
      ChangeState(DetailProjectViewState.error);
    }
  }

  addDetailProject(DetailProject detailProject) async {
    ChangeState(DetailProjectViewState.loading);
    try {
      final p = await DetailProjectAPI().addDetailProject(detailProject);
      _status = 'Add Item Success';
      notifyListeners();
      ChangeState(DetailProjectViewState.success);
    } catch (e) {
      _status = 'Add Item Failed';
      notifyListeners();
      ChangeState(DetailProjectViewState.error);
    }
  }

  Future<bool> deleteDetailProject(int id) async {
    try {
      bool result = await DetailProjectAPI().deleteDetailProject(id);
      if (result = true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateDetailProject(int id, bool status) async {
    try {
      bool result = await DetailProjectAPI().updateDetailProject(id, status);
      if (result == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
