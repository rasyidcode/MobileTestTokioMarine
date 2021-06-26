import 'dart:io';

import 'package:flutter_github_user_search/data/models/search/user/search_result.dart';
import 'package:flutter_github_user_search/data/network/github_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'github_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  String fixture(String name) =>
      File('test/data/fixtures/$name.json').readAsStringSync();

  late MockClient mockClient;
  late GithubDataSource githubDataSource;

  setUp(() {
    mockClient = MockClient();
    githubDataSource = GithubDataSource(mockClient);
  });

  group('searchUsers', () {
    test('returns SearchResult when the call complete successfully', () async {
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
          fixture('github_search_users_result'),
          200,
          headers: {'Accept': 'application/vnd.github.v3+json'},
        ),
      );

      final response =
          await githubDataSource.searchUsers(query: 'test', page: 1);
      expect(response, TypeMatcher<SearchResult>());
      expect(response!.users.length, 2);
      expect(response.users[0].login, 'rasyidcode');
    });
  });
}
