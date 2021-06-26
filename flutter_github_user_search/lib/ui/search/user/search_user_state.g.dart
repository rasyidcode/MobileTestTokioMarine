// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_user_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchUserState extends SearchUserState {
  @override
  final bool isLoading;
  @override
  final BuiltList<GithubUser> users;
  @override
  final String error;
  @override
  final bool hasReachedEndOfResults;

  factory _$SearchUserState([void Function(SearchUserStateBuilder)? updates]) =>
      (new SearchUserStateBuilder()..update(updates)).build();

  _$SearchUserState._(
      {required this.isLoading,
      required this.users,
      required this.error,
      required this.hasReachedEndOfResults})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, 'SearchUserState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(users, 'SearchUserState', 'users');
    BuiltValueNullFieldError.checkNotNull(error, 'SearchUserState', 'error');
    BuiltValueNullFieldError.checkNotNull(
        hasReachedEndOfResults, 'SearchUserState', 'hasReachedEndOfResults');
  }

  @override
  SearchUserState rebuild(void Function(SearchUserStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchUserStateBuilder toBuilder() =>
      new SearchUserStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchUserState &&
        isLoading == other.isLoading &&
        users == other.users &&
        error == other.error &&
        hasReachedEndOfResults == other.hasReachedEndOfResults;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isLoading.hashCode), users.hashCode), error.hashCode),
        hasReachedEndOfResults.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchUserState')
          ..add('isLoading', isLoading)
          ..add('users', users)
          ..add('error', error)
          ..add('hasReachedEndOfResults', hasReachedEndOfResults))
        .toString();
  }
}

class SearchUserStateBuilder
    implements Builder<SearchUserState, SearchUserStateBuilder> {
  _$SearchUserState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  ListBuilder<GithubUser>? _users;
  ListBuilder<GithubUser> get users =>
      _$this._users ??= new ListBuilder<GithubUser>();
  set users(ListBuilder<GithubUser>? users) => _$this._users = users;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _hasReachedEndOfResults;
  bool? get hasReachedEndOfResults => _$this._hasReachedEndOfResults;
  set hasReachedEndOfResults(bool? hasReachedEndOfResults) =>
      _$this._hasReachedEndOfResults = hasReachedEndOfResults;

  SearchUserStateBuilder();

  SearchUserStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _users = $v.users.toBuilder();
      _error = $v.error;
      _hasReachedEndOfResults = $v.hasReachedEndOfResults;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchUserState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchUserState;
  }

  @override
  void update(void Function(SearchUserStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchUserState build() {
    _$SearchUserState _$result;
    try {
      _$result = _$v ??
          new _$SearchUserState._(
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, 'SearchUserState', 'isLoading'),
              users: users.build(),
              error: BuiltValueNullFieldError.checkNotNull(
                  error, 'SearchUserState', 'error'),
              hasReachedEndOfResults: BuiltValueNullFieldError.checkNotNull(
                  hasReachedEndOfResults,
                  'SearchUserState',
                  'hasReachedEndOfResults'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchUserState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
