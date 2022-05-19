import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/detail_project.dart';

class DetailProjectAPI {
  Future<List<DetailProject>> getDetailProject(int id) async {
    final response = await Dio().get(
      'https://yusuf.bentenserver.my.id/public/api/item-project/index/$id',
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

  Future<bool> addDetailProject(DetailProject detailProject) async {
    var dataProject = jsonEncode(<String, dynamic>{
      'project_id': detailProject.projectId,
      'name': detailProject.name,
      'status': detailProject.status,
    });

    final response = await Dio().post(
      'https://yusuf.bentenserver.my.id/public/api/item-project/create',
      data: dataProject,
    );

    if (response.statusCode == 200) {
      return response.data['status'];
    }
    return false;
  }

  Future<bool> deleteDetailProject(int id) async {
    final response = await Dio().delete(
      'https://yusuf.bentenserver.my.id/public/api/item-project/delete/$id',
    );

    if (response.statusCode == 200) {
      return response.data['status'];
    }
    return false;
  }

  Future<bool> updateDetailProject(int id, bool status) async {
    var updateStatus = jsonEncode(<String, dynamic>{
      'status': status,
      'id': id,
    });
    final response = await Dio().patch(
      'https://yusuf.bentenserver.my.id/public/api/item-project/update',
      data: updateStatus,
    );
    if (response.statusCode == 200) {
      return response.data['status'];
    }
    return false;
  }
}
