import 'dart:io';

import 'package:flutter_github_user_search/data/exceptions/all_exceptions.dart';
import 'package:flutter_github_user_search/data/models/search/user/search_user_result.dart';
import 'package:flutter_github_user_search/data/network/github_data_source.dart';
import 'package:flutter_github_user_search/data/repository/github_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'github_repository_test.mocks.dart';

@GenerateMocks([GithubDataSource])
void main() {
  String fixture(String name) =>
      File('test/data/fixtures/$name.json').readAsStringSync();

  late MockGithubDataSource _mockGithubDataSource;
  late GithubRepository _githubRepository;

  setUp(() {
    _mockGithubDataSource = MockGithubDataSource();
    _githubRepository = GithubRepository(_mockGithubDataSource);
  });
  test('throws a NoSuchResultException when calling unknown query string',
      () async {
    when(
      _mockGithubDataSource.searchUsers(
        query: anyNamed('query'),
        page: anyNamed('page'),
      ),
    ).thenAnswer(
      (_) async => SearchUserResult.fromJson(
        fixture('github_search_users_no_result'),
      ),
    );

    expect(
      () => _githubRepository.searchUsers(query: 'asdfdsfdsfdsfdsfdsfdfdfdfd'),
      throwsA(
        TypeMatcher<NoSuchResultException>(),
      ),
    );
  });
}
