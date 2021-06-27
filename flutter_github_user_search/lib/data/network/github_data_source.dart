import 'dart:convert';

import 'package:flutter_github_user_search/data/exceptions/github_unknown_error_exception.dart';
import 'package:flutter_github_user_search/data/models/detail/github_user_detail.dart';
import 'package:flutter_github_user_search/data/exceptions/github_error_exception.dart';
import 'package:flutter_github_user_search/data/models/search/user/search_user_result.dart';
import 'package:http/http.dart' as http;

const MAX_SEARCH_RESULTS = 15;

class GithubDataSource {
  final http.Client _client;

  final String _searchBaseUrl =
      'https://api.github.com/search/users?&per_page=$MAX_SEARCH_RESULTS';

  final String _detailUserBaseUrl = 'https://api.github.com/users/';

  GithubDataSource(this._client);

  Future<SearchUserResult?> searchUsers({
    required String query,
    required int page,
  }) async {
    final urlRaw = _searchBaseUrl + '&q=$query&page=$page';
    final urlEncoded = Uri.encodeFull(urlRaw);
    final response = await _client.get(
      Uri.parse(urlEncoded),
      headers: {
        'Accept': 'application/vnd.github.v3+json',
      },
    );

    if (response.statusCode == 200) {
      return SearchUserResult.fromJson(response.body);
    } else {
      final Map<String, dynamic> errorResponse = jsonDecode(response.body);
      if (errorResponse.containsKey('message')) {
        throw GithubErrorException(errorResponse['message']);
      } else {
        throw GithubUnknownErrorException;
      }
    }
  }

  Future<GithubUserDetail?> getUserDetail({required String login}) async {
    final urlEncoded = Uri.parse(_detailUserBaseUrl + login);
    final response = await _client.get(
      urlEncoded,
      headers: {
        'Accept': 'application/vnd.github.v3+json',
      },
    );

    if (response.statusCode == 200) {
      return GithubUserDetail.fromJson(response.body);
    } else {
      final Map<String, dynamic> errorResponse = jsonDecode(response.body);
      if (errorResponse.containsKey('message')) {
        throw GithubErrorException(errorResponse['message']);
      } else {
        throw GithubUnknownErrorException();
      }
    }
  }
}
