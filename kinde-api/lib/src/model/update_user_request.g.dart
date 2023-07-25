// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateUserRequest extends UpdateUserRequest {
  @override
  final String? givenName;
  @override
  final String? familyName;
  @override
  final bool? isSuspended;
  @override
  final bool? isPasswordResetRequested;

  factory _$UpdateUserRequest(
          [void Function(UpdateUserRequestBuilder)? updates]) =>
      (new UpdateUserRequestBuilder()..update(updates))._build();

  _$UpdateUserRequest._(
      {this.givenName,
      this.familyName,
      this.isSuspended,
      this.isPasswordResetRequested})
      : super._();

  @override
  UpdateUserRequest rebuild(void Function(UpdateUserRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateUserRequestBuilder toBuilder() =>
      new UpdateUserRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateUserRequest &&
        givenName == other.givenName &&
        familyName == other.familyName &&
        isSuspended == other.isSuspended &&
        isPasswordResetRequested == other.isPasswordResetRequested;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, givenName.hashCode);
    _$hash = $jc(_$hash, familyName.hashCode);
    _$hash = $jc(_$hash, isSuspended.hashCode);
    _$hash = $jc(_$hash, isPasswordResetRequested.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateUserRequest')
          ..add('givenName', givenName)
          ..add('familyName', familyName)
          ..add('isSuspended', isSuspended)
          ..add('isPasswordResetRequested', isPasswordResetRequested))
        .toString();
  }
}

class UpdateUserRequestBuilder
    implements Builder<UpdateUserRequest, UpdateUserRequestBuilder> {
  _$UpdateUserRequest? _$v;

  String? _givenName;
  String? get givenName => _$this._givenName;
  set givenName(String? givenName) => _$this._givenName = givenName;

  String? _familyName;
  String? get familyName => _$this._familyName;
  set familyName(String? familyName) => _$this._familyName = familyName;

  bool? _isSuspended;
  bool? get isSuspended => _$this._isSuspended;
  set isSuspended(bool? isSuspended) => _$this._isSuspended = isSuspended;

  bool? _isPasswordResetRequested;
  bool? get isPasswordResetRequested => _$this._isPasswordResetRequested;
  set isPasswordResetRequested(bool? isPasswordResetRequested) =>
      _$this._isPasswordResetRequested = isPasswordResetRequested;

  UpdateUserRequestBuilder() {
    UpdateUserRequest._defaults(this);
  }

  UpdateUserRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _givenName = $v.givenName;
      _familyName = $v.familyName;
      _isSuspended = $v.isSuspended;
      _isPasswordResetRequested = $v.isPasswordResetRequested;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateUserRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateUserRequest;
  }

  @override
  void update(void Function(UpdateUserRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateUserRequest build() => _build();

  _$UpdateUserRequest _build() {
    final _$result = _$v ??
        new _$UpdateUserRequest._(
            givenName: givenName,
            familyName: familyName,
            isSuspended: isSuspended,
            isPasswordResetRequested: isPasswordResetRequested);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
