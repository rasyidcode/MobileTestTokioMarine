library user_detail_state;

import 'package:built_value/built_value.dart';
import 'package:flutter_github_user_search/data/models/detail/github_user_detail.dart';

part 'user_detail_state.g.dart';

abstract class UserDetailState
    implements Built<UserDetailState, UserDetailStateBuilder> {
  bool get isLoading;
  GithubUserDetail? get userDetail;
  String get error;

  bool get isInitial => !isLoading && userDetail == null && error == '';
  bool get isSuccessful => !isLoading && userDetail != null && error == '';

  UserDetailState._();

  factory UserDetailState([updates(UserDetailStateBuilder b)]) =
      _$UserDetailState;

  factory UserDetailState.initial() {
    return UserDetailState((b) => b
      ..isLoading = false
      ..userDetail = null
      ..error = '');
  }

  factory UserDetailState.loading() {
    return UserDetailState((b) => b
      ..isLoading = true
      ..userDetail = null
      ..error = '');
  }

  factory UserDetailState.failure(String error) {
    return UserDetailState((b) => b
      ..isLoading = false
      ..userDetail = null
      ..error = error);
  }

  factory UserDetailState.success(GithubUserDetail userDetail) {
    return UserDetailState((b) => b
      ..isLoading = false
      ..userDetail.replace(userDetail)
      ..error = '');
  }
}
