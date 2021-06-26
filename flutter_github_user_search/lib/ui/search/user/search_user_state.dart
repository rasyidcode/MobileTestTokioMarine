library search_user_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter_github_user_search/data/models/search/user/github_user.dart';

part 'search_user_state.g.dart';

abstract class SearchUserState
    implements Built<SearchUserState, SearchUserStateBuilder> {
  bool get isLoading;
  BuiltList<GithubUser> get users;
  String get error;
  bool get hasReachedEndOfResults;

  bool get isInitial => !isLoading && users.isEmpty && error == '';
  bool get isSuccessful => !isLoading && users.isNotEmpty && error == '';

  SearchUserState._();

  factory SearchUserState([updates(SearchUserStateBuilder b)]) =
      _$SearchUserState;

  factory SearchUserState.initial() {
    return SearchUserState((b) => b
      ..isLoading = false
      ..users.replace(BuiltList<GithubUser>())
      ..error = ''
      ..hasReachedEndOfResults = false);
  }

  factory SearchUserState.loading() {
    return SearchUserState((b) => b
      ..isLoading = true
      ..users.replace(BuiltList<GithubUser>())
      ..error = ''
      ..hasReachedEndOfResults = false);
  }

  factory SearchUserState.failure(String error) {
    return SearchUserState((b) => b
      ..isLoading = false
      ..users.replace(BuiltList<GithubUser>())
      ..error = error
      ..hasReachedEndOfResults = false);
  }

  factory SearchUserState.success(BuiltList<GithubUser> users) {
    return SearchUserState((b) => b
      ..isLoading = false
      ..users.replace(users)
      ..error = ''
      ..hasReachedEndOfResults = false);
  }
}
