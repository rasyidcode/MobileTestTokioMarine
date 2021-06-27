// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_detail_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ShowUserDetail extends ShowUserDetail {
  @override
  final String login;

  factory _$ShowUserDetail([void Function(ShowUserDetailBuilder)? updates]) =>
      (new ShowUserDetailBuilder()..update(updates)).build();

  _$ShowUserDetail._({required this.login}) : super._() {
    BuiltValueNullFieldError.checkNotNull(login, 'ShowUserDetail', 'login');
  }

  @override
  ShowUserDetail rebuild(void Function(ShowUserDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShowUserDetailBuilder toBuilder() =>
      new ShowUserDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShowUserDetail && login == other.login;
  }

  @override
  int get hashCode {
    return $jf($jc(0, login.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ShowUserDetail')..add('login', login))
        .toString();
  }
}

class ShowUserDetailBuilder
    implements Builder<ShowUserDetail, ShowUserDetailBuilder> {
  _$ShowUserDetail? _$v;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  ShowUserDetailBuilder();

  ShowUserDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _login = $v.login;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShowUserDetail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShowUserDetail;
  }

  @override
  void update(void Function(ShowUserDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ShowUserDetail build() {
    final _$result = _$v ??
        new _$ShowUserDetail._(
            login: BuiltValueNullFieldError.checkNotNull(
                login, 'ShowUserDetail', 'login'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
