import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/api/detail_project_api.dart';
import 'package:flutter_application_1/model/detail_project.dart';
import 'package:flutter_application_1/model/history.dart';
import 'package:flutter_application_1/screen/detailProject/detail_project_view_state.dart';

import '../../model/api/projects_api.dart';
import '../../model/projects_model.dart';

class DetailProjectViewModel with ChangeNotifier {
  DetailProjectViewState _state = DetailProjectViewState.loading;
  DetailProjectViewState get state => _state;

  List<DetailProject> _detailProjects = [];
  List<DetailProject> get detailProjects => _detailProjects;

  Project _projectId = Project(
    id: 0,
    userId: 0,
    nameProject: '',
    codeProject: '',
    statusProject: '',
  );
  Project get projectId => _projectId;

  List<History> _history = [];
  List<History> get history => _history;

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

  getProjectById(int projectId) async {
    ChangeState(DetailProjectViewState.loading);
    try {
      final p = await ProjectAPI().getProjectById(projectId);
      _projectId = p!;
      notifyListeners();
      ChangeState(DetailProjectViewState.success);
    } catch (e) {
      ChangeState(DetailProjectViewState.error);
    }
  }

  getHistory(int projectId) async {
    ChangeState(DetailProjectViewState.loading);
    try {
      final h = await DetailProjectAPI().getHistory(projectId);
      _history = h;
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

  Future<bool> updateDetailProject(int id, String name, bool status) async {
    try {
      bool result =
          await DetailProjectAPI().updateDetailProject(id, name, status);
      if (result == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateStatus(int idProject, String status) async {
    try {
      final p = await ProjectAPI().updateStatus(idProject, status);
      if (p == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
