// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_detail_args;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserDetailArgs extends UserDetailArgs {
  @override
  final String login;

  factory _$UserDetailArgs([void Function(UserDetailArgsBuilder)? updates]) =>
      (new UserDetailArgsBuilder()..update(updates)).build();

  _$UserDetailArgs._({required this.login}) : super._() {
    BuiltValueNullFieldError.checkNotNull(login, 'UserDetailArgs', 'login');
  }

  @override
  UserDetailArgs rebuild(void Function(UserDetailArgsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDetailArgsBuilder toBuilder() =>
      new UserDetailArgsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDetailArgs && login == other.login;
  }

  @override
  int get hashCode {
    return $jf($jc(0, login.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDetailArgs')..add('login', login))
        .toString();
  }
}

class UserDetailArgsBuilder
    implements Builder<UserDetailArgs, UserDetailArgsBuilder> {
  _$UserDetailArgs? _$v;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  UserDetailArgsBuilder();

  UserDetailArgsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _login = $v.login;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDetailArgs other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserDetailArgs;
  }

  @override
  void update(void Function(UserDetailArgsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDetailArgs build() {
    final _$result = _$v ??
        new _$UserDetailArgs._(
            login: BuiltValueNullFieldError.checkNotNull(
                login, 'UserDetailArgs', 'login'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
