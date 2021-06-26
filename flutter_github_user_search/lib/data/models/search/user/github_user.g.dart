// GENERATED CODE - DO NOT MODIFY BY HAND

part of github_user;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GithubUser> _$githubUserSerializer = new _$GithubUserSerializer();

class _$GithubUserSerializer implements StructuredSerializer<GithubUser> {
  @override
  final Iterable<Type> types = const [GithubUser, _$GithubUser];
  @override
  final String wireName = 'GithubUser';

  @override
  Iterable<Object?> serialize(Serializers serializers, GithubUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'avatar_url',
      serializers.serialize(object.avatarUrl,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GithubUser deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GithubUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatar_url':
          result.avatarUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GithubUser extends GithubUser {
  @override
  final String login;
  @override
  final String avatarUrl;

  factory _$GithubUser([void Function(GithubUserBuilder)? updates]) =>
      (new GithubUserBuilder()..update(updates)).build();

  _$GithubUser._({required this.login, required this.avatarUrl}) : super._() {
    BuiltValueNullFieldError.checkNotNull(login, 'GithubUser', 'login');
    BuiltValueNullFieldError.checkNotNull(avatarUrl, 'GithubUser', 'avatarUrl');
  }

  @override
  GithubUser rebuild(void Function(GithubUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GithubUserBuilder toBuilder() => new GithubUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GithubUser &&
        login == other.login &&
        avatarUrl == other.avatarUrl;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, login.hashCode), avatarUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GithubUser')
          ..add('login', login)
          ..add('avatarUrl', avatarUrl))
        .toString();
  }
}

class GithubUserBuilder implements Builder<GithubUser, GithubUserBuilder> {
  _$GithubUser? _$v;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  String? _avatarUrl;
  String? get avatarUrl => _$this._avatarUrl;
  set avatarUrl(String? avatarUrl) => _$this._avatarUrl = avatarUrl;

  GithubUserBuilder();

  GithubUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _login = $v.login;
      _avatarUrl = $v.avatarUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GithubUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GithubUser;
  }

  @override
  void update(void Function(GithubUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GithubUser build() {
    final _$result = _$v ??
        new _$GithubUser._(
            login: BuiltValueNullFieldError.checkNotNull(
                login, 'GithubUser', 'login'),
            avatarUrl: BuiltValueNullFieldError.checkNotNull(
                avatarUrl, 'GithubUser', 'avatarUrl'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
