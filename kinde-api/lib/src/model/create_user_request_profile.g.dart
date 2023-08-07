// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_request_profile.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateUserRequestProfile extends CreateUserRequestProfile {
  @override
  final String? givenName;
  @override
  final String? familyName;

  factory _$CreateUserRequestProfile(
          [void Function(CreateUserRequestProfileBuilder)? updates]) =>
      (new CreateUserRequestProfileBuilder()..update(updates))._build();

  _$CreateUserRequestProfile._({this.givenName, this.familyName}) : super._();

  @override
  CreateUserRequestProfile rebuild(
          void Function(CreateUserRequestProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateUserRequestProfileBuilder toBuilder() =>
      new CreateUserRequestProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateUserRequestProfile &&
        givenName == other.givenName &&
        familyName == other.familyName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, givenName.hashCode);
    _$hash = $jc(_$hash, familyName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateUserRequestProfile')
          ..add('givenName', givenName)
          ..add('familyName', familyName))
        .toString();
  }
}

class CreateUserRequestProfileBuilder
    implements
        Builder<CreateUserRequestProfile, CreateUserRequestProfileBuilder> {
  _$CreateUserRequestProfile? _$v;

  String? _givenName;
  String? get givenName => _$this._givenName;
  set givenName(String? givenName) => _$this._givenName = givenName;

  String? _familyName;
  String? get familyName => _$this._familyName;
  set familyName(String? familyName) => _$this._familyName = familyName;

  CreateUserRequestProfileBuilder() {
    CreateUserRequestProfile._defaults(this);
  }

  CreateUserRequestProfileBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _givenName = $v.givenName;
      _familyName = $v.familyName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateUserRequestProfile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateUserRequestProfile;
  }

  @override
  void update(void Function(CreateUserRequestProfileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateUserRequestProfile build() => _build();

  _$CreateUserRequestProfile _build() {
    final _$result = _$v ??
        new _$CreateUserRequestProfile._(
            givenName: givenName, familyName: familyName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
