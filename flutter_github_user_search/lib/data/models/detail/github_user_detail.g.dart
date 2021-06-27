// GENERATED CODE - DO NOT MODIFY BY HAND

part of github_user_detail;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GithubUserDetail> _$githubUserDetailSerializer =
    new _$GithubUserDetailSerializer();

class _$GithubUserDetailSerializer
    implements StructuredSerializer<GithubUserDetail> {
  @override
  final Iterable<Type> types = const [GithubUserDetail, _$GithubUserDetail];
  @override
  final String wireName = 'GithubUserDetail';

  @override
  Iterable<Object?> serialize(Serializers serializers, GithubUserDetail object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'avatar_url',
      serializers.serialize(object.avatarUrl,
          specifiedType: const FullType(String)),
      'html_url',
      serializers.serialize(object.profileUrl,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(String)),
      'bio',
      serializers.serialize(object.bio, specifiedType: const FullType(String)),
      'public_repos',
      serializers.serialize(object.repoCount,
          specifiedType: const FullType(int)),
      'followers',
      serializers.serialize(object.followersCount,
          specifiedType: const FullType(int)),
      'following',
      serializers.serialize(object.followingCount,
          specifiedType: const FullType(int)),
      'created_at',
      serializers.serialize(object.userCreatedDate,
          specifiedType: const FullType(String)),
      'updated_at',
      serializers.serialize(object.lastUpdatedProfile,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.company;
    if (value != null) {
      result
        ..add('company')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GithubUserDetail deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GithubUserDetailBuilder();

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
        case 'html_url':
          result.profileUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'public_repos':
          result.repoCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'followers':
          result.followersCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'following':
          result.followingCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'created_at':
          result.userCreatedDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updated_at':
          result.lastUpdatedProfile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GithubUserDetail extends GithubUserDetail {
  @override
  final String login;
  @override
  final String avatarUrl;
  @override
  final String profileUrl;
  @override
  final String name;
  @override
  final String? company;
  @override
  final String location;
  @override
  final String bio;
  @override
  final int repoCount;
  @override
  final int followersCount;
  @override
  final int followingCount;
  @override
  final String userCreatedDate;
  @override
  final String lastUpdatedProfile;

  factory _$GithubUserDetail(
          [void Function(GithubUserDetailBuilder)? updates]) =>
      (new GithubUserDetailBuilder()..update(updates)).build();

  _$GithubUserDetail._(
      {required this.login,
      required this.avatarUrl,
      required this.profileUrl,
      required this.name,
      this.company,
      required this.location,
      required this.bio,
      required this.repoCount,
      required this.followersCount,
      required this.followingCount,
      required this.userCreatedDate,
      required this.lastUpdatedProfile})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(login, 'GithubUserDetail', 'login');
    BuiltValueNullFieldError.checkNotNull(
        avatarUrl, 'GithubUserDetail', 'avatarUrl');
    BuiltValueNullFieldError.checkNotNull(
        profileUrl, 'GithubUserDetail', 'profileUrl');
    BuiltValueNullFieldError.checkNotNull(name, 'GithubUserDetail', 'name');
    BuiltValueNullFieldError.checkNotNull(
        location, 'GithubUserDetail', 'location');
    BuiltValueNullFieldError.checkNotNull(bio, 'GithubUserDetail', 'bio');
    BuiltValueNullFieldError.checkNotNull(
        repoCount, 'GithubUserDetail', 'repoCount');
    BuiltValueNullFieldError.checkNotNull(
        followersCount, 'GithubUserDetail', 'followersCount');
    BuiltValueNullFieldError.checkNotNull(
        followingCount, 'GithubUserDetail', 'followingCount');
    BuiltValueNullFieldError.checkNotNull(
        userCreatedDate, 'GithubUserDetail', 'userCreatedDate');
    BuiltValueNullFieldError.checkNotNull(
        lastUpdatedProfile, 'GithubUserDetail', 'lastUpdatedProfile');
  }

  @override
  GithubUserDetail rebuild(void Function(GithubUserDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GithubUserDetailBuilder toBuilder() =>
      new GithubUserDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GithubUserDetail &&
        login == other.login &&
        avatarUrl == other.avatarUrl &&
        profileUrl == other.profileUrl &&
        name == other.name &&
        company == other.company &&
        location == other.location &&
        bio == other.bio &&
        repoCount == other.repoCount &&
        followersCount == other.followersCount &&
        followingCount == other.followingCount &&
        userCreatedDate == other.userCreatedDate &&
        lastUpdatedProfile == other.lastUpdatedProfile;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, login.hashCode),
                                                avatarUrl.hashCode),
                                            profileUrl.hashCode),
                                        name.hashCode),
                                    company.hashCode),
                                location.hashCode),
                            bio.hashCode),
                        repoCount.hashCode),
                    followersCount.hashCode),
                followingCount.hashCode),
            userCreatedDate.hashCode),
        lastUpdatedProfile.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GithubUserDetail')
          ..add('login', login)
          ..add('avatarUrl', avatarUrl)
          ..add('profileUrl', profileUrl)
          ..add('name', name)
          ..add('company', company)
          ..add('location', location)
          ..add('bio', bio)
          ..add('repoCount', repoCount)
          ..add('followersCount', followersCount)
          ..add('followingCount', followingCount)
          ..add('userCreatedDate', userCreatedDate)
          ..add('lastUpdatedProfile', lastUpdatedProfile))
        .toString();
  }
}

class GithubUserDetailBuilder
    implements Builder<GithubUserDetail, GithubUserDetailBuilder> {
  _$GithubUserDetail? _$v;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  String? _avatarUrl;
  String? get avatarUrl => _$this._avatarUrl;
  set avatarUrl(String? avatarUrl) => _$this._avatarUrl = avatarUrl;

  String? _profileUrl;
  String? get profileUrl => _$this._profileUrl;
  set profileUrl(String? profileUrl) => _$this._profileUrl = profileUrl;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _company;
  String? get company => _$this._company;
  set company(String? company) => _$this._company = company;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  int? _repoCount;
  int? get repoCount => _$this._repoCount;
  set repoCount(int? repoCount) => _$this._repoCount = repoCount;

  int? _followersCount;
  int? get followersCount => _$this._followersCount;
  set followersCount(int? followersCount) =>
      _$this._followersCount = followersCount;

  int? _followingCount;
  int? get followingCount => _$this._followingCount;
  set followingCount(int? followingCount) =>
      _$this._followingCount = followingCount;

  String? _userCreatedDate;
  String? get userCreatedDate => _$this._userCreatedDate;
  set userCreatedDate(String? userCreatedDate) =>
      _$this._userCreatedDate = userCreatedDate;

  String? _lastUpdatedProfile;
  String? get lastUpdatedProfile => _$this._lastUpdatedProfile;
  set lastUpdatedProfile(String? lastUpdatedProfile) =>
      _$this._lastUpdatedProfile = lastUpdatedProfile;

  GithubUserDetailBuilder();

  GithubUserDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _login = $v.login;
      _avatarUrl = $v.avatarUrl;
      _profileUrl = $v.profileUrl;
      _name = $v.name;
      _company = $v.company;
      _location = $v.location;
      _bio = $v.bio;
      _repoCount = $v.repoCount;
      _followersCount = $v.followersCount;
      _followingCount = $v.followingCount;
      _userCreatedDate = $v.userCreatedDate;
      _lastUpdatedProfile = $v.lastUpdatedProfile;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GithubUserDetail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GithubUserDetail;
  }

  @override
  void update(void Function(GithubUserDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GithubUserDetail build() {
    final _$result = _$v ??
        new _$GithubUserDetail._(
            login: BuiltValueNullFieldError.checkNotNull(
                login, 'GithubUserDetail', 'login'),
            avatarUrl: BuiltValueNullFieldError.checkNotNull(
                avatarUrl, 'GithubUserDetail', 'avatarUrl'),
            profileUrl: BuiltValueNullFieldError.checkNotNull(
                profileUrl, 'GithubUserDetail', 'profileUrl'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'GithubUserDetail', 'name'),
            company: company,
            location: BuiltValueNullFieldError.checkNotNull(
                location, 'GithubUserDetail', 'location'),
            bio: BuiltValueNullFieldError.checkNotNull(
                bio, 'GithubUserDetail', 'bio'),
            repoCount: BuiltValueNullFieldError.checkNotNull(
                repoCount, 'GithubUserDetail', 'repoCount'),
            followersCount: BuiltValueNullFieldError.checkNotNull(
                followersCount, 'GithubUserDetail', 'followersCount'),
            followingCount: BuiltValueNullFieldError.checkNotNull(
                followingCount, 'GithubUserDetail', 'followingCount'),
            userCreatedDate: BuiltValueNullFieldError.checkNotNull(userCreatedDate, 'GithubUserDetail', 'userCreatedDate'),
            lastUpdatedProfile: BuiltValueNullFieldError.checkNotNull(lastUpdatedProfile, 'GithubUserDetail', 'lastUpdatedProfile'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
