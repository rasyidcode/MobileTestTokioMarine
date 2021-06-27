import 'dart:io';
import 'dart:math';

import 'package:flutter_github_user_search/data/exceptions/all_exceptions.dart';
import 'package:flutter_github_user_search/data/models/search/user/search_user_result.dart';
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
      expect(response, TypeMatcher<SearchUserResult>());
      expect(response!.users.length, 2);
      expect(response.users[0].login, 'rasyidcode');
    });

    test('Throw error on 422 Unprocessable Entity response', () {
      when(
        mockClient.get(
          any,
          headers: anyNamed('headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response(fixture('github_422_error'), 422),
      );

      expect(() => githubDataSource.searchUsers(query: 'test', page: 1),
          throwsA(TypeMatcher<GithubErrorException>()));
    });

    test('throw error on 304', () {
      when(
        mockClient.get(
          any,
          headers: anyNamed('headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response('{}', 304),
      );

      expect(() => githubDataSource.searchUsers(query: 'test', page: 1),
          throwsA(TypeMatcher<GithubErrorException>()));
    });

    test('throw error on 503', () {
      when(
        mockClient.get(
          any,
          headers: anyNamed('headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response('{}', 503),
      );

      expect(() => githubDataSource.searchUsers(query: 'test', page: 1),
          throwsA(TypeMatcher<GithubErrorException>()));
    });

    // test('make sure the URL is correct', () {
    //   when(
    //     mockClient.get(
    //       any,
    //       headers: anyNamed('headers'),
    //     ),
    //   ).thenAnswer(
    //     (_) async => http.Response(
    //       fixture('github_search_users_result'),
    //       200,
    //       headers: {'Accept': 'application/vnd.github.v3+json'},
    //     ),
    //   );

    //   githubDataSource.searchUsers(query: 'test', page: 1);

    //   verify(
    //     mockClient.get(
    //       argThat(startsWith('https://api.github.com/search/users')),
    //       headers: anyNamed('headers'),
    //     ),
    //   );
    // });
  });
}
