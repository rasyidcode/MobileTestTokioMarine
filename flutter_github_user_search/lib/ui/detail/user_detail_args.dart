library user_detail_args;

import 'package:built_value/built_value.dart';

part 'user_detail_args.g.dart';

abstract class UserDetailArgs
    implements Built<UserDetailArgs, UserDetailArgsBuilder> {
  String get login;
  UserDetailArgs._();

  factory UserDetailArgs([updates(UserDetailArgsBuilder b)]) = _$UserDetailArgs;
}
