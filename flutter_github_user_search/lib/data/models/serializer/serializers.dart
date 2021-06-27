library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_github_user_search/data/models/detail/github_user_detail.dart';
import 'package:flutter_github_user_search/data/models/search/user/github_user.dart';
import 'package:flutter_github_user_search/data/models/search/user/search_user_result.dart';

part 'serializers.g.dart';

@SerializersFor(const [SearchUserResult, GithubUser, GithubUserDetail])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
