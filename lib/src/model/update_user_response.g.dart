// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateUserResponse extends UpdateUserResponse {
  @override
  final String? id;
  @override
  final String? givenName;
  @override
  final String? familyName;
  @override
  final String? email;
  @override
  final bool? isSuspended;
  @override
  final bool? isPasswordResetRequested;
  @override
  final String? picture;

  factory _$UpdateUserResponse(
          [void Function(UpdateUserResponseBuilder)? updates]) =>
      (new UpdateUserResponseBuilder()..update(updates))._build();

  _$UpdateUserResponse._(
      {this.id,
      this.givenName,
      this.familyName,
      this.email,
      this.isSuspended,
      this.isPasswordResetRequested,
      this.picture})
      : super._();

  @override
  UpdateUserResponse rebuild(
          void Function(UpdateUserResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateUserResponseBuilder toBuilder() =>
      new UpdateUserResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateUserResponse &&
        id == other.id &&
        givenName == other.givenName &&
        familyName == other.familyName &&
        email == other.email &&
        isSuspended == other.isSuspended &&
        isPasswordResetRequested == other.isPasswordResetRequested &&
        picture == other.picture;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, givenName.hashCode);
    _$hash = $jc(_$hash, familyName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, isSuspended.hashCode);
    _$hash = $jc(_$hash, isPasswordResetRequested.hashCode);
    _$hash = $jc(_$hash, picture.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateUserResponse')
          ..add('id', id)
          ..add('givenName', givenName)
          ..add('familyName', familyName)
          ..add('email', email)
          ..add('isSuspended', isSuspended)
          ..add('isPasswordResetRequested', isPasswordResetRequested)
          ..add('picture', picture))
        .toString();
  }
}

class UpdateUserResponseBuilder
    implements Builder<UpdateUserResponse, UpdateUserResponseBuilder> {
  _$UpdateUserResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _givenName;
  String? get givenName => _$this._givenName;
  set givenName(String? givenName) => _$this._givenName = givenName;

  String? _familyName;
  String? get familyName => _$this._familyName;
  set familyName(String? familyName) => _$this._familyName = familyName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  bool? _isSuspended;
  bool? get isSuspended => _$this._isSuspended;
  set isSuspended(bool? isSuspended) => _$this._isSuspended = isSuspended;

  bool? _isPasswordResetRequested;
  bool? get isPasswordResetRequested => _$this._isPasswordResetRequested;
  set isPasswordResetRequested(bool? isPasswordResetRequested) =>
      _$this._isPasswordResetRequested = isPasswordResetRequested;

  String? _picture;
  String? get picture => _$this._picture;
  set picture(String? picture) => _$this._picture = picture;

  UpdateUserResponseBuilder() {
    UpdateUserResponse._defaults(this);
  }

  UpdateUserResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _givenName = $v.givenName;
      _familyName = $v.familyName;
      _email = $v.email;
      _isSuspended = $v.isSuspended;
      _isPasswordResetRequested = $v.isPasswordResetRequested;
      _picture = $v.picture;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateUserResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateUserResponse;
  }

  @override
  void update(void Function(UpdateUserResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateUserResponse build() => _build();

  _$UpdateUserResponse _build() {
    final _$result = _$v ??
        new _$UpdateUserResponse._(
            id: id,
            givenName: givenName,
            familyName: familyName,
            email: email,
            isSuspended: isSuspended,
            isPasswordResetRequested: isPasswordResetRequested,
            picture: picture);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
