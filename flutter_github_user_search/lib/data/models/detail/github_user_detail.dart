library github_user_detail;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_github_user_search/data/models/serializer/serializers.dart';

part 'github_user_detail.g.dart';

abstract class GithubUserDetail
    implements Built<GithubUserDetail, GithubUserDetailBuilder> {
  String get login;
  @BuiltValueField(wireName: 'avatar_url')
  String get avatarUrl;
  @BuiltValueField(wireName: 'html_url')
  String get profileUrl;
  String get name;
  String? get company;
  String get location;
  String get bio;
  @BuiltValueField(wireName: 'public_repos')
  int get repoCount;
  @BuiltValueField(wireName: 'followers')
  int get followersCount;
  @BuiltValueField(wireName: 'following')
  int get followingCount;
  @BuiltValueField(wireName: 'created_at')
  String get userCreatedDate;
  @BuiltValueField(wireName: 'updated_at')
  String get lastUpdatedProfile;

  GithubUserDetail._();

  factory GithubUserDetail([updates(GithubUserDetailBuilder b)]) =
      _$GithubUserDetail;

  String toJson() {
    return json
        .encode(serializers.serializeWith(GithubUserDetail.serializer, this));
  }

  static GithubUserDetail? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GithubUserDetail.serializer, json.decode(jsonString));
  }

  static Serializer<GithubUserDetail> get serializer =>
      _$githubUserDetailSerializer;
}
