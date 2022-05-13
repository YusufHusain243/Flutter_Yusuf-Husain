import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/model/api/projects_api.dart';
import 'package:flutter_application_1/model/projects_model.dart';
import 'package:flutter_application_1/screen/home/home_view_state.dart';

class HomeViewModel with ChangeNotifier {
  HomeViewState _state = HomeViewState.loading;
  HomeViewState get state => _state;

  List<Project> _projects = [];
  List<Project> get projects => _projects;

  String _status = 'Loading';
  String get status => _status;

  ChangeState(HomeViewState s) {
    _state = s;
    notifyListeners();
  }

  getProjects(int id) async {
    ChangeState(HomeViewState.loading);
    try {
      final p = await ProjectAPI.getProject(id);
      _projects = p;
      notifyListeners();
      ChangeState(HomeViewState.success);
    } catch (e) {
      ChangeState(HomeViewState.error);
    }
  }

  createProject(Project project) async {
    ChangeState(HomeViewState.loading);
    try {
      final p = await ProjectAPI.createProject(project);
      _status = 'Create Success';
      notifyListeners();
      ChangeState(HomeViewState.success);
    } catch (e) {
      _status = 'Create Failed';
      notifyListeners();
      ChangeState(HomeViewState.error);
    }
  }

  deleteProject(int id) async {
    ChangeState(HomeViewState.loading);
    try {
      final p = await ProjectAPI.deleteProject(id);
      _status = 'Delete Success';
      notifyListeners();
      ChangeState(HomeViewState.success);
    } catch (e) {
      _status = 'Delete Failed';
      notifyListeners();
      ChangeState(HomeViewState.error);
    }
  }

  joinProject(String codeProject, int userId) async {
    ChangeState(HomeViewState.loading);
    try {
      final p = await ProjectAPI.joinProject(codeProject, userId);
      _status = 'Join Success';
      notifyListeners();
      ChangeState(HomeViewState.success);
    } catch (e) {
      _status = 'Join Failed';
      notifyListeners();
      ChangeState(HomeViewState.error);
    }
  }
}
