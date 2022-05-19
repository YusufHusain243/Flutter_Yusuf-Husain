import 'package:flutter_application_1/model/api/projects_api.dart';
import 'package:flutter_application_1/model/projects_model.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'projects_api_test.mocks.dart';

@GenerateMocks([ProjectAPI])
void main() {
  group('Projects Api', () {
    ProjectAPI projectAPI = MockProjectAPI();
    Project projectData = Project(
      id: 100,
      userId: 9,
      nameProject: 'nameProject',
      codeProject: 'codeProject',
    );
    test('get all projects', () async {
      when(projectAPI.getProject(9)).thenAnswer((_) async => <Project>[
            Project(
              id: 42,
              userId: 9,
              nameProject: 'aaa',
              codeProject: 'aaa',
            )
          ]);
      var projects = await projectAPI.getProject(9);
      expect(projects.isNotEmpty, true);
    });

    test('create projects', () async {
      when(projectAPI.createProject(projectData)).thenAnswer((_) async => true);
      var projects = await projectAPI.createProject(projectData);
      expect(projects, true);
    });

    test('delete projects', () async {
      when(projectAPI.deleteProject(42)).thenAnswer((_) async => true);
      var projects = await projectAPI.deleteProject(42);
      expect(projects, true);
    });

    test('join projects', () async {
      when(projectAPI.joinProject('aaa', 9)).thenAnswer((_) async => true);
      var projects = await projectAPI.joinProject('aaa', 9);
      expect(projects, true);
    });
  });
}
