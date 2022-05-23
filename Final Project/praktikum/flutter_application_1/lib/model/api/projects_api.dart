import 'dart:convert';

import 'package:flutter_application_1/model/projects_model.dart';
import 'package:dio/dio.dart';

class ProjectAPI {
  Future<List<Project>> getProject(int id) async {
    final response = await Dio().get(
      'http://10.0.2.2:8000/api/project/index/$id',
    );
    // final response = await Dio().get(
    //   'https://yusuf.bentenserver.my.id/public/api/project/index/$id',
    // );

    if (response.statusCode == 200) {
      List<Project> projects = (response.data as List)
          .map(
            (e) => Project(
              id: e['id'],
              userId: e['user_id'],
              nameProject: e['name_project'],
              codeProject: e['code_project'],
              statusProject: e['status_project'],
            ),
          )
          .toList();

      return projects;
    }
    return [];
  }

  Future<bool> createProject(Project project) async {
    var dataProject = jsonEncode(<String, dynamic>{
      'user_id': project.userId,
      'name_project': project.nameProject,
      'code_project': project.codeProject,
      'status_project': project.statusProject,
    });
    final response = await Dio().post(
      'http://10.0.2.2:8000/api/project/create',
      data: dataProject,
    );
    // final response = await Dio().post(
    //   'https://yusuf.bentenserver.my.id/public/api/project/create',
    //   data: dataProject,
    // );

    if (response.statusCode == 200) {
      return response.data['status'];
    }
    return false;
  }

  Future<bool> deleteProject(int id) async {
    final response = await Dio().delete(
      'http://10.0.2.2:8000/api/project/delete/$id',
    );
    // final response = await Dio().delete(
    //   'https://yusuf.bentenserver.my.id/public/api/project/delete/$id',
    // );

    if (response.statusCode == 200) {
      return response.data['status'];
    }
    return false;
  }

  Future<bool> joinProject(String codeProject, int userId) async {
    var dataProject = jsonEncode(<String, dynamic>{
      'user_id': userId,
      'code_project': codeProject,
    });

    final response = await Dio().post(
      'http://10.0.2.2:8000/api/project/join',
      data: dataProject,
    );
    // final response = await Dio().post(
    //   'https://yusuf.bentenserver.my.id/public/api/project/join',
    //   data: dataProject,
    // );

    if (response.statusCode == 200) {
      return response.data['status'];
    }
    return false;
  }

  Future<bool> updateStatus(int idProject, String status) async {
    var dataProject = jsonEncode(<String, dynamic>{
      'id': idProject,
      'status_project': status,
    });

    final response = await Dio().patch(
      'http://10.0.2.2:8000/api/project/update',
      data: dataProject,
    );

    print(response.statusCode);
    // final response = await Dio().post(
    //   'https://yusuf.bentenserver.my.id/public/api/project/join',
    //   data: dataProject,
    // );

    if (response.statusCode == 200) {
      return response.data['status'];
    }
    return false;
  }
}
