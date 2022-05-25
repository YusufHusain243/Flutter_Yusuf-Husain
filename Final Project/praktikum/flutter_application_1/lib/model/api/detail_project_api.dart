import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/detail_project.dart';
import 'package:flutter_application_1/model/history.dart';

class DetailProjectAPI {
  Future<List<DetailProject>> getDetailProject(int id) async {
    final response = await Dio().get(
      'https://teamworkapp.xyz/api/item-project/index/$id',
    );

    if (response.statusCode == 200) {
      List<DetailProject> projects = (response.data as List).map((e) {
        var status;
        if (e['status'] == '1') {
          status = true;
        } else {
          status = false;
        }
        return DetailProject(
          id: e['id'],
          projectId: int.parse(e['project_id']),
          name: e['name'],
          status: status,
        );
      }).toList();
      return projects;
    }
    return [];
  }

  Future<List<History>> getHistory(int projectId) async {
    final response = await Dio().get(
      'https://teamworkapp.xyz/api/item-project/history/$projectId',
    );
    if (response.statusCode == 200) {
      List<History> history = (response.data as List).map((e) {
        var status;
        if (e['status'] == '1') {
          status = true;
        } else {
          status = false;
        }

        return History(
          id: e['id'],
          projectId: int.parse(e['project_id']),
          name: e['name'],
          status: status,
          createdAt: e['created_at'],
        );
      }).toList();
      return history;
    }
    return [];
  }

  Future<bool> addDetailProject(DetailProject detailProject) async {
    var dataProject = jsonEncode(<String, dynamic>{
      'project_id': detailProject.projectId,
      'name': detailProject.name,
      'status': detailProject.status,
    });

    final response = await Dio().post(
      'https://teamworkapp.xyz/api/item-project/create',
      data: dataProject,
    );

    if (response.statusCode == 200) {
      return response.data['status'];
    }
    return false;
  }

  Future<bool> deleteDetailProject(int id) async {
    final response = await Dio().delete(
      'https://teamworkapp.xyz/api/item-project/delete/$id',
    );

    if (response.statusCode == 200) {
      return response.data['status'];
    }
    return false;
  }

  Future<bool> updateDetailProject(int id, String name, bool status) async {
    var updateStatus = jsonEncode(<String, dynamic>{
      'id': id,
      'name': name,
      'status': status,
    });

    final response = await Dio().patch(
      'https://teamworkapp.xyz/api/item-project/update',
      data: updateStatus,
    );
    if (response.statusCode == 200) {
      return response.data['status'];
    }
    return false;
  }
}
