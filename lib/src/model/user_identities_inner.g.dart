// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_identities_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserIdentitiesInner extends UserIdentitiesInner {
  @override
  final String? type;
  @override
  final String? identity;

  factory _$UserIdentitiesInner(
          [void Function(UserIdentitiesInnerBuilder)? updates]) =>
      (new UserIdentitiesInnerBuilder()..update(updates))._build();

  _$UserIdentitiesInner._({this.type, this.identity}) : super._();

  @override
  UserIdentitiesInner rebuild(
          void Function(UserIdentitiesInnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserIdentitiesInnerBuilder toBuilder() =>
      new UserIdentitiesInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserIdentitiesInner &&
        type == other.type &&
        identity == other.identity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, identity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserIdentitiesInner')
          ..add('type', type)
          ..add('identity', identity))
        .toString();
  }
}

class UserIdentitiesInnerBuilder
    implements Builder<UserIdentitiesInner, UserIdentitiesInnerBuilder> {
  _$UserIdentitiesInner? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _identity;
  String? get identity => _$this._identity;
  set identity(String? identity) => _$this._identity = identity;

  UserIdentitiesInnerBuilder() {
    UserIdentitiesInner._defaults(this);
  }

  UserIdentitiesInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _identity = $v.identity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserIdentitiesInner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserIdentitiesInner;
  }

  @override
  void update(void Function(UserIdentitiesInnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserIdentitiesInner build() => _build();

  _$UserIdentitiesInner _build() {
    final _$result =
        _$v ?? new _$UserIdentitiesInner._(type: type, identity: identity);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
