import 'package:flutter_application_1/model/api/users_api.dart';
import 'package:flutter_application_1/model/users_model.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'users_api_test.mocks.dart';

@GenerateMocks([UserAPI])
void main() {
  group('Users Api', () {
    UserAPI userAPI = MockUserAPI();
    User userData = User(
      id: 0,
      username: 'username',
      email: 'username@gmail.com',
      password: 'username',
    );

    test('registrasi', () async {
      when(userAPI.regis(userData))
          .thenAnswer((_) async => 'Registration Success');
      var users = await userAPI.regis(userData);
      expect(users, 'Registration Success');
    });

    test('reset password', () async {
      when(userAPI.resetPassword(37, 'zidan1')).thenAnswer((_) async => true);
      var users = await userAPI.resetPassword(37, 'zidan1');
      expect(users, true);
    });

    test('login', () async {
      when(userAPI.login(userData)).thenAnswer((_) async => {
            'status': true,
            'data': {
              'id': 37,
              'username': 'zidan',
              'email': 'zidan@gmail.com',
              'password': 'zidan',
              'created_at': '2022-05-19T07:31:19.000000Z',
              'updated_at': '2022-05-19T07:31:19.000000Z',
            }
          });
      var users = await userAPI.login(userData);
      expect(users.isNotEmpty, true);
    });
  });
}
