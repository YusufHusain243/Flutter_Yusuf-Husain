import 'package:flutter_application_1/model/api/projects_api.dart';
import 'package:flutter_application_1/model/projects_model.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'projects_api_test.mocks.dart';

@GenerateMocks([ProjectAPI])
void main() {
  group('projects api', () {
    ProjectAPI projectAPI = MockProjectAPI();
    test('get all projects', () async {
      when(projectAPI.getProject(33).then((_) async => <Project>[
            Project(
              id: 33,
              userId: 9,
              nameProject: 'aaa',
              codeProject: 'aaa',
            )
          ]));
      var projects = await projectAPI.getProject(33);
      expect(projects.isEmpty, true);
    });
  });
}
