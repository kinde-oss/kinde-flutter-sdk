// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_user_role_permissions.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrganizationUserRolePermissions
    extends OrganizationUserRolePermissions {
  @override
  final String? id;
  @override
  final String? role;
  @override
  final OrganizationUserRolePermissionsPermissions? permissions;

  factory _$OrganizationUserRolePermissions(
          [void Function(OrganizationUserRolePermissionsBuilder)? updates]) =>
      (new OrganizationUserRolePermissionsBuilder()..update(updates))._build();

  _$OrganizationUserRolePermissions._({this.id, this.role, this.permissions})
      : super._();

  @override
  OrganizationUserRolePermissions rebuild(
          void Function(OrganizationUserRolePermissionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizationUserRolePermissionsBuilder toBuilder() =>
      new OrganizationUserRolePermissionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganizationUserRolePermissions &&
        id == other.id &&
        role == other.role &&
        permissions == other.permissions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, permissions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrganizationUserRolePermissions')
          ..add('id', id)
          ..add('role', role)
          ..add('permissions', permissions))
        .toString();
  }
}

class OrganizationUserRolePermissionsBuilder
    implements
        Builder<OrganizationUserRolePermissions,
            OrganizationUserRolePermissionsBuilder> {
  _$OrganizationUserRolePermissions? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _role;
  String? get role => _$this._role;
  set role(String? role) => _$this._role = role;

  OrganizationUserRolePermissionsPermissionsBuilder? _permissions;
  OrganizationUserRolePermissionsPermissionsBuilder get permissions =>
      _$this._permissions ??=
          new OrganizationUserRolePermissionsPermissionsBuilder();
  set permissions(
          OrganizationUserRolePermissionsPermissionsBuilder? permissions) =>
      _$this._permissions = permissions;

  OrganizationUserRolePermissionsBuilder() {
    OrganizationUserRolePermissions._defaults(this);
  }

  OrganizationUserRolePermissionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _role = $v.role;
      _permissions = $v.permissions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganizationUserRolePermissions other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganizationUserRolePermissions;
  }

  @override
  void update(void Function(OrganizationUserRolePermissionsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrganizationUserRolePermissions build() => _build();

  _$OrganizationUserRolePermissions _build() {
    _$OrganizationUserRolePermissions _$result;
    try {
      _$result = _$v ??
          new _$OrganizationUserRolePermissions._(
              id: id, role: role, permissions: _permissions?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'permissions';
        _permissions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OrganizationUserRolePermissions', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
