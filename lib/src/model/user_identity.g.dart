// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_identity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserIdentity extends UserIdentity {
  @override
  final String? type;
  @override
  final UserIdentityResult? result;

  factory _$UserIdentity([void Function(UserIdentityBuilder)? updates]) =>
      (new UserIdentityBuilder()..update(updates))._build();

  _$UserIdentity._({this.type, this.result}) : super._();

  @override
  UserIdentity rebuild(void Function(UserIdentityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserIdentityBuilder toBuilder() => new UserIdentityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserIdentity &&
        type == other.type &&
        result == other.result;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, result.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserIdentity')
          ..add('type', type)
          ..add('result', result))
        .toString();
  }
}

class UserIdentityBuilder
    implements Builder<UserIdentity, UserIdentityBuilder> {
  _$UserIdentity? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  UserIdentityResultBuilder? _result;
  UserIdentityResultBuilder get result =>
      _$this._result ??= new UserIdentityResultBuilder();
  set result(UserIdentityResultBuilder? result) => _$this._result = result;

  UserIdentityBuilder() {
    UserIdentity._defaults(this);
  }

  UserIdentityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _result = $v.result?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserIdentity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserIdentity;
  }

  @override
  void update(void Function(UserIdentityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserIdentity build() => _build();

  _$UserIdentity _build() {
    _$UserIdentity _$result;
    try {
      _$result =
          _$v ?? new _$UserIdentity._(type: type, result: _result?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'result';
        _result?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserIdentity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
