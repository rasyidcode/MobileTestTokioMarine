library search_result;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_github_user_search/data/models/search/user/github_user.dart';
import 'package:flutter_github_user_search/data/models/serializer/serializers.dart';

part 'search_result.g.dart';

abstract class SearchResult
    implements Built<SearchResult, SearchResultBuilder> {
  // fields go here
  @BuiltValueField(wireName: 'total_count')
  int get totalCount;
  @BuiltValueField(wireName: 'items')
  BuiltList<GithubUser> get users;

  SearchResult._();

  factory SearchResult([updates(SearchResultBuilder b)]) = _$SearchResult;

  String toJson() {
    return json
        .encode(serializers.serializeWith(SearchResult.serializer, this));
  }

  static SearchResult? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SearchResult.serializer, json.decode(jsonString));
  }

  static Serializer<SearchResult> get serializer => _$searchResultSerializer;
}
