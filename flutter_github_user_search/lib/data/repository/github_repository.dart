import 'package:built_collection/built_collection.dart';
import 'package:flutter_github_user_search/data/models/detail/github_user_detail.dart';
import 'package:flutter_github_user_search/data/models/search/user/github_user.dart';
import 'package:flutter_github_user_search/data/network/github_data_source.dart';
import 'package:flutter_github_user_search/data/exceptions/all_exceptions.dart';

class GithubRepository {
  GithubDataSource _githubDataSource;

  int _currentPage = 0;
  int _totalPage = 0;
  int _totalUsers = 0;
  String _currentQuery = '';

  GithubRepository(this._githubDataSource);

  Future<BuiltList<GithubUser>> searchUsers({required String query}) async {
    _currentPage = 1;
    final searchResult = await _githubDataSource.searchUsers(
      query: query,
      page: _currentPage,
    );

    if (searchResult == null) throw SearchReturnsNullException();
    if (searchResult.users.isEmpty) throw NoSuchResultException();

    _totalPage = (searchResult.totalCount / MAX_SEARCH_RESULTS).floor();
    _totalUsers = searchResult.totalCount;

    _currentQuery = query;
    return searchResult.users;
  }

  Future<BuiltList<GithubUser>> nextPageUsers() async {
    if (_currentQuery.isEmpty || _currentPage == 0 || _totalPage == 0)
      throw SearchUserNotInitException();
    if (_currentPage * MAX_SEARCH_RESULTS >= _totalUsers)
      throw NoNextPageUsersException();

    final nextPageUsers = await _githubDataSource.searchUsers(
      query: _currentQuery,
      page: _currentPage,
    );

    if (nextPageUsers == null) throw SearchReturnsNullException();
    if (nextPageUsers.users.isEmpty) throw NoSuchResultException();

    _currentPage++;

    return nextPageUsers.users;
  }

  Future<GithubUserDetail> getUserDetail({required String login}) async {
    final userDetail = await _githubDataSource.getUserDetail(login: login);

    if (userDetail == null) throw UserDetailReturnsNullException();
    return userDetail;
  }
}
