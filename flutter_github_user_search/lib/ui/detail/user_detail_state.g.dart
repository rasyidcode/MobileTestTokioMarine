// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_detail_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserDetailState extends UserDetailState {
  @override
  final bool isLoading;
  @override
  final GithubUserDetail? userDetail;
  @override
  final String error;

  factory _$UserDetailState([void Function(UserDetailStateBuilder)? updates]) =>
      (new UserDetailStateBuilder()..update(updates)).build();

  _$UserDetailState._(
      {required this.isLoading, this.userDetail, required this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, 'UserDetailState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(error, 'UserDetailState', 'error');
  }

  @override
  UserDetailState rebuild(void Function(UserDetailStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDetailStateBuilder toBuilder() =>
      new UserDetailStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDetailState &&
        isLoading == other.isLoading &&
        userDetail == other.userDetail &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, isLoading.hashCode), userDetail.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDetailState')
          ..add('isLoading', isLoading)
          ..add('userDetail', userDetail)
          ..add('error', error))
        .toString();
  }
}

class UserDetailStateBuilder
    implements Builder<UserDetailState, UserDetailStateBuilder> {
  _$UserDetailState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  GithubUserDetailBuilder? _userDetail;
  GithubUserDetailBuilder get userDetail =>
      _$this._userDetail ??= new GithubUserDetailBuilder();
  set userDetail(GithubUserDetailBuilder? userDetail) =>
      _$this._userDetail = userDetail;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  UserDetailStateBuilder();

  UserDetailStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _userDetail = $v.userDetail?.toBuilder();
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDetailState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserDetailState;
  }

  @override
  void update(void Function(UserDetailStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDetailState build() {
    _$UserDetailState _$result;
    try {
      _$result = _$v ??
          new _$UserDetailState._(
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, 'UserDetailState', 'isLoading'),
              userDetail: _userDetail?.build(),
              error: BuiltValueNullFieldError.checkNotNull(
                  error, 'UserDetailState', 'error'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userDetail';
        _userDetail?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserDetailState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
