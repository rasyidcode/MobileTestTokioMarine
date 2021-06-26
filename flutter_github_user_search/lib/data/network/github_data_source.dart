import 'dart:convert';

import 'package:flutter_github_user_search/data/models/search/github_search_error.dart';
import 'package:flutter_github_user_search/data/models/search/user/search_result.dart';
import 'package:http/http.dart' as http;

const MAX_SEARCH_RESULTS = 15;

class GithubDataSource {
  final http.Client _client;

  final String _searchBaseUrl =
      'https://api.github.com/search/users?&per_page=$MAX_SEARCH_RESULTS';

  GithubDataSource(this._client);

  Future<SearchResult?> searchUsers({
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
      return SearchResult.fromJson(response.body);
    } else {
      throw GithubSearchError(jsonDecode(response.body)['message']);
    }
  }
}
