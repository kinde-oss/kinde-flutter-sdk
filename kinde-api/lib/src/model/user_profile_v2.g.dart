// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_v2.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserProfileV2 extends UserProfileV2 {
  @override
  final String? id;
  @override
  final String? sub;
  @override
  final String? providedId;
  @override
  final String? name;
  @override
  final String? givenName;
  @override
  final String? familyName;
  @override
  final int? updatedAt;
  @override
  final String? email;
  @override
  final String? picture;

  factory _$UserProfileV2([void Function(UserProfileV2Builder)? updates]) =>
      (new UserProfileV2Builder()..update(updates))._build();

  _$UserProfileV2._(
      {this.id,
      this.sub,
      this.providedId,
      this.name,
      this.givenName,
      this.familyName,
      this.updatedAt,
      this.email,
      this.picture})
      : super._();

  @override
  UserProfileV2 rebuild(void Function(UserProfileV2Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserProfileV2Builder toBuilder() => new UserProfileV2Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserProfileV2 &&
        id == other.id &&
        sub == other.sub &&
        providedId == other.providedId &&
        name == other.name &&
        givenName == other.givenName &&
        familyName == other.familyName &&
        updatedAt == other.updatedAt &&
        email == other.email &&
        picture == other.picture;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, sub.hashCode);
    _$hash = $jc(_$hash, providedId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, givenName.hashCode);
    _$hash = $jc(_$hash, familyName.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, picture.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserProfileV2')
          ..add('id', id)
          ..add('sub', sub)
          ..add('providedId', providedId)
          ..add('name', name)
          ..add('givenName', givenName)
          ..add('familyName', familyName)
          ..add('updatedAt', updatedAt)
          ..add('email', email)
          ..add('picture', picture))
        .toString();
  }
}

class UserProfileV2Builder
    implements Builder<UserProfileV2, UserProfileV2Builder> {
  _$UserProfileV2? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _sub;
  String? get sub => _$this._sub;
  set sub(String? sub) => _$this._sub = sub;

  String? _providedId;
  String? get providedId => _$this._providedId;
  set providedId(String? providedId) => _$this._providedId = providedId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _givenName;
  String? get givenName => _$this._givenName;
  set givenName(String? givenName) => _$this._givenName = givenName;

  String? _familyName;
  String? get familyName => _$this._familyName;
  set familyName(String? familyName) => _$this._familyName = familyName;

  int? _updatedAt;
  int? get updatedAt => _$this._updatedAt;
  set updatedAt(int? updatedAt) => _$this._updatedAt = updatedAt;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _picture;
  String? get picture => _$this._picture;
  set picture(String? picture) => _$this._picture = picture;

  UserProfileV2Builder() {
    UserProfileV2._defaults(this);
  }

  UserProfileV2Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _sub = $v.sub;
      _providedId = $v.providedId;
      _name = $v.name;
      _givenName = $v.givenName;
      _familyName = $v.familyName;
      _updatedAt = $v.updatedAt;
      _email = $v.email;
      _picture = $v.picture;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserProfileV2 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserProfileV2;
  }

  @override
  void update(void Function(UserProfileV2Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserProfileV2 build() => _build();

  _$UserProfileV2 _build() {
    final _$result = _$v ??
        new _$UserProfileV2._(
            id: id,
            sub: sub,
            providedId: providedId,
            name: name,
            givenName: givenName,
            familyName: familyName,
            updatedAt: updatedAt,
            email: email,
            picture: picture);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
