import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/detail_project.dart';
import 'package:flutter_application_1/model/history.dart';

class DetailProjectAPI {
  Future<List<DetailProject>> getDetailProject(int id) async {
    final response = await Dio().get(
      'http://10.0.2.2:8000/api/item-project/index/$id',
    );
    // final response = await Dio().get(
    //   'https://yusuf.bentenserver.my.id/public/api/item-project/index/$id',
    // );

    if (response.statusCode == 200) {
      List<DetailProject> projects = (response.data as List).map((e) {
        var status;
        if (e['status'] == 1) {
          status = true;
        } else {
          status = false;
        }
        return DetailProject(
          id: e['id'],
          projectId: e['project_id'],
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
      'http://10.0.2.2:8000/api/item-project/history/$projectId',
    );
    // final response = await Dio().get(
    //   'https://yusuf.bentenserver.my.id/public/api/item-project/index/$id',
    // );

    if (response.statusCode == 200) {
      List<History> history = (response.data as List).map((e) {
        var status;
        if (e['status'] == 1) {
          status = true;
        } else {
          status = false;
        }
        return History(
          id: e['id'],
          projectId: e['project_id'],
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
      'http://10.0.2.2:8000/api/item-project/create',
      data: dataProject,
    );
    // final response = await Dio().post(
    //   'https://yusuf.bentenserver.my.id/public/api/item-project/create',
    //   data: dataProject,
    // );

    if (response.statusCode == 200) {
      return response.data['status'];
    }
    return false;
  }

  Future<bool> deleteDetailProject(int id) async {
    final response = await Dio().delete(
      'http://10.0.2.2:8000/api/item-project/delete/$id',
    );
    // final response = await Dio().delete(
    //   'https://yusuf.bentenserver.my.id/public/api/item-project/delete/$id',
    // );

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
      'http://10.0.2.2:8000/api/item-project/update',
      data: updateStatus,
    );
    // final response = await Dio().patch(
    //   'https://yusuf.bentenserver.my.id/public/api/item-project/update',
    //   data: updateStatus,
    // );
    if (response.statusCode == 200) {
      return response.data['status'];
    }
    return false;
  }
}
