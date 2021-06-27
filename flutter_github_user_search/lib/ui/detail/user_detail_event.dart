library user_detail_event;

import 'package:built_value/built_value.dart';

part 'user_detail_event.g.dart';

abstract class UserDetailEvent {}

abstract class ShowUserDetail extends UserDetailEvent
    implements Built<ShowUserDetail, ShowUserDetailBuilder> {
  String get login;

  ShowUserDetail._();

  factory ShowUserDetail([updates(ShowUserDetailBuilder b)]) = _$ShowUserDetail;
}
