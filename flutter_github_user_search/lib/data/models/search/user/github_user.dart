library github_user;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_github_user_search/data/models/serializer/serializers.dart';

part 'github_user.g.dart';

abstract class GithubUser implements Built<GithubUser, GithubUserBuilder> {
  String get login;
  @BuiltValueField(wireName: 'avatar_url')
  String get avatarUrl;

  GithubUser._();

  factory GithubUser([updates(GithubUserBuilder b)]) = _$GithubUser;

  String toJson() {
    return json.encode(serializers.serializeWith(GithubUser.serializer, this));
  }

  static GithubUser? fromJson(String jsonString) {
    return serializers.deserializeWith(
        GithubUser.serializer, json.decode(jsonString));
  }

  static Serializer<GithubUser> get serializer => _$githubUserSerializer;
}
