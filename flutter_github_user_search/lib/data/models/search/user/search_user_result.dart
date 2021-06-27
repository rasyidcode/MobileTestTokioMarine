library search_user_result;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_github_user_search/data/models/search/user/github_user.dart';
import 'package:flutter_github_user_search/data/models/serializer/serializers.dart';

part 'search_user_result.g.dart';

abstract class SearchUserResult
    implements Built<SearchUserResult, SearchUserResultBuilder> {
  @BuiltValueField(wireName: 'total_count')
  int get totalCount;
  @BuiltValueField(wireName: 'items')
  BuiltList<GithubUser> get users;

  SearchUserResult._();

  factory SearchUserResult([updates(SearchUserResultBuilder b)]) =
      _$SearchUserResult;

  String toJson() {
    return json
        .encode(serializers.serializeWith(SearchUserResult.serializer, this));
  }

  static SearchUserResult? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SearchUserResult.serializer, json.decode(jsonString));
  }

  static Serializer<SearchUserResult> get serializer =>
      _$searchUserResultSerializer;
}
