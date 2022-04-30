import 'dart:convert';

import 'package:flutter_application_1/model/projects_model.dart';
import 'package:dio/dio.dart';

class ProjectAPI {
  static Future<List<Project>> getProject(int id) async {
    final response = await Dio().get(
      'https://yusuf.bentenserver.my.id/public/api/project/index/$id',
    );

    if (response.statusCode == 200) {
      List<Project> projects = (response.data as List)
          .map((e) => Project(
              id: e['id'],
              userId: int.parse(e['user_id']),
              nameProject: e['name_project'],
              codeProject: e['code_project']))
          .toList();

      return projects;
    }
    return [];
  }

  static Future<bool> createProject(Project project) async {
    var dataProject = jsonEncode(<String, dynamic>{
      'user_id': project.userId,
      'name_project': project.nameProject,
      'code_project': project.codeProject,
    });
    final response = await Dio().post(
      'https://yusuf.bentenserver.my.id/public/api/project/create',
      data: dataProject,
    );

    if (response.statusCode == 200) {
      return response.data['status'];
    }
    return false;
  }

  static Future<bool> deleteProject(int id) async {
    final response = await Dio().delete(
      'https://yusuf.bentenserver.my.id/public/api/project/delete/$id',
    );

    if (response.statusCode == 200) {
      return response.data['status'];
    }
    return false;
  }

  static Future<bool> joinProject(String codeProject, int userId) async {
    var dataProject = jsonEncode(<String, dynamic>{
      'user_id': userId,
      'code_project': codeProject,
    });

    print(dataProject);

    final response = await Dio().post(
      'https://yusuf.bentenserver.my.id/public/api/project/join',
      data: dataProject,
    );

    print(response.data);

    if (response.statusCode == 200) {
      return response.data['status'];
    }
    return false;
  }
}
