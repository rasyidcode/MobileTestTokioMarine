// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_result;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchResult> _$searchResultSerializer =
    new _$SearchResultSerializer();

class _$SearchResultSerializer implements StructuredSerializer<SearchResult> {
  @override
  final Iterable<Type> types = const [SearchResult, _$SearchResult];
  @override
  final String wireName = 'SearchResult';

  @override
  Iterable<Object?> serialize(Serializers serializers, SearchResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'total_count',
      serializers.serialize(object.totalCount,
          specifiedType: const FullType(int)),
      'items',
      serializers.serialize(object.users,
          specifiedType:
              const FullType(BuiltList, const [const FullType(GithubUser)])),
    ];

    return result;
  }

  @override
  SearchResult deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'total_count':
          result.totalCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'items':
          result.users.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GithubUser)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$SearchResult extends SearchResult {
  @override
  final int totalCount;
  @override
  final BuiltList<GithubUser> users;

  factory _$SearchResult([void Function(SearchResultBuilder)? updates]) =>
      (new SearchResultBuilder()..update(updates)).build();

  _$SearchResult._({required this.totalCount, required this.users})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        totalCount, 'SearchResult', 'totalCount');
    BuiltValueNullFieldError.checkNotNull(users, 'SearchResult', 'users');
  }

  @override
  SearchResult rebuild(void Function(SearchResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchResultBuilder toBuilder() => new SearchResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchResult &&
        totalCount == other.totalCount &&
        users == other.users;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, totalCount.hashCode), users.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchResult')
          ..add('totalCount', totalCount)
          ..add('users', users))
        .toString();
  }
}

class SearchResultBuilder
    implements Builder<SearchResult, SearchResultBuilder> {
  _$SearchResult? _$v;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  ListBuilder<GithubUser>? _users;
  ListBuilder<GithubUser> get users =>
      _$this._users ??= new ListBuilder<GithubUser>();
  set users(ListBuilder<GithubUser>? users) => _$this._users = users;

  SearchResultBuilder();

  SearchResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _totalCount = $v.totalCount;
      _users = $v.users.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchResult;
  }

  @override
  void update(void Function(SearchResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchResult build() {
    _$SearchResult _$result;
    try {
      _$result = _$v ??
          new _$SearchResult._(
              totalCount: BuiltValueNullFieldError.checkNotNull(
                  totalCount, 'SearchResult', 'totalCount'),
              users: users.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
