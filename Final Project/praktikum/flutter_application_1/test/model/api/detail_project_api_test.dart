import 'package:flutter_application_1/model/api/detail_project_api.dart';
import 'package:flutter_application_1/model/detail_project.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'detail_project_api_test.mocks.dart';

@GenerateMocks([DetailProjectAPI])
void main() {
  group('Detail Project Api', () {
    DetailProjectAPI detailProjectAPI = MockDetailProjectAPI();
    DetailProject detailProjectData = DetailProject(
      id: 17,
      projectId: 45,
      name: 'name',
      status: false,
    );

    test('get detail project', () async {
      when(detailProjectAPI.getDetailProject(45))
          .thenAnswer((_) async => <DetailProject>[
                DetailProject(
                  id: 17,
                  projectId: 45,
                  name: 'aaa',
                  status: false,
                )
              ]);
      var detailProjects = await detailProjectAPI.getDetailProject(45);
      expect(detailProjects.isNotEmpty, true);
    });

    test('add detail project', () async {
      when(detailProjectAPI.addDetailProject(detailProjectData))
          .thenAnswer((_) async => true);
      var detailProjects =
          await detailProjectAPI.addDetailProject(detailProjectData);
      expect(detailProjects, true);
    });

    test('delete detail project', () async {
      when(detailProjectAPI.deleteDetailProject(17))
          .thenAnswer((_) async => true);
      var detailProjects = await detailProjectAPI.deleteDetailProject(17);
      expect(detailProjects, true);
    });

    test('update detail project', () async {
      when(detailProjectAPI.updateDetailProject(17, true))
          .thenAnswer((_) async => true);
      var detailProjects = await detailProjectAPI.updateDetailProject(17, true);
      expect(detailProjects, true);
    });
  });
}
