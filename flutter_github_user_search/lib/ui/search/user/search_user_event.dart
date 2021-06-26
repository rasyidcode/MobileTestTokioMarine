library search_user_event;

import 'package:built_value/built_value.dart';

part 'search_user_event.g.dart';

abstract class SearchUserEvent {}

abstract class SearchInitiated extends SearchUserEvent
    implements Built<SearchInitiated, SearchInitiatedBuilder> {
  String get query;
  SearchInitiated._();

  factory SearchInitiated([updates(SearchInitiatedBuilder b)]) =
      _$SearchInitiated;
}

class FetchNextPage extends SearchUserEvent {}
