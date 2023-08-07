// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_identity_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserIdentityResult extends UserIdentityResult {
  @override
  final bool? created;

  factory _$UserIdentityResult(
          [void Function(UserIdentityResultBuilder)? updates]) =>
      (new UserIdentityResultBuilder()..update(updates))._build();

  _$UserIdentityResult._({this.created}) : super._();

  @override
  UserIdentityResult rebuild(
          void Function(UserIdentityResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserIdentityResultBuilder toBuilder() =>
      new UserIdentityResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserIdentityResult && created == other.created;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, created.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserIdentityResult')
          ..add('created', created))
        .toString();
  }
}

class UserIdentityResultBuilder
    implements Builder<UserIdentityResult, UserIdentityResultBuilder> {
  _$UserIdentityResult? _$v;

  bool? _created;
  bool? get created => _$this._created;
  set created(bool? created) => _$this._created = created;

  UserIdentityResultBuilder() {
    UserIdentityResult._defaults(this);
  }

  UserIdentityResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _created = $v.created;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserIdentityResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserIdentityResult;
  }

  @override
  void update(void Function(UserIdentityResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserIdentityResult build() => _build();

  _$UserIdentityResult _build() {
    final _$result = _$v ?? new _$UserIdentityResult._(created: created);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
