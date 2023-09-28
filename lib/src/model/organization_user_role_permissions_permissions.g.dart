// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_user_role_permissions_permissions.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrganizationUserRolePermissionsPermissions
    extends OrganizationUserRolePermissionsPermissions {
  @override
  final String? key;

  factory _$OrganizationUserRolePermissionsPermissions(
          [void Function(OrganizationUserRolePermissionsPermissionsBuilder)?
              updates]) =>
      (new OrganizationUserRolePermissionsPermissionsBuilder()..update(updates))
          ._build();

  _$OrganizationUserRolePermissionsPermissions._({this.key}) : super._();

  @override
  OrganizationUserRolePermissionsPermissions rebuild(
          void Function(OrganizationUserRolePermissionsPermissionsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizationUserRolePermissionsPermissionsBuilder toBuilder() =>
      new OrganizationUserRolePermissionsPermissionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganizationUserRolePermissionsPermissions &&
        key == other.key;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'OrganizationUserRolePermissionsPermissions')
          ..add('key', key))
        .toString();
  }
}

class OrganizationUserRolePermissionsPermissionsBuilder
    implements
        Builder<OrganizationUserRolePermissionsPermissions,
            OrganizationUserRolePermissionsPermissionsBuilder> {
  _$OrganizationUserRolePermissionsPermissions? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  OrganizationUserRolePermissionsPermissionsBuilder() {
    OrganizationUserRolePermissionsPermissions._defaults(this);
  }

  OrganizationUserRolePermissionsPermissionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganizationUserRolePermissionsPermissions other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganizationUserRolePermissionsPermissions;
  }

  @override
  void update(
      void Function(OrganizationUserRolePermissionsPermissionsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  OrganizationUserRolePermissionsPermissions build() => _build();

  _$OrganizationUserRolePermissionsPermissions _build() {
    final _$result =
        _$v ?? new _$OrganizationUserRolePermissionsPermissions._(key: key);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
