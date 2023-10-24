// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_user_permission.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrganizationUserPermission extends OrganizationUserPermission {
  @override
  final String? id;
  @override
  final String? key;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final BuiltList<OrganizationUserPermissionRolesInner>? roles;

  factory _$OrganizationUserPermission(
          [void Function(OrganizationUserPermissionBuilder)? updates]) =>
      (new OrganizationUserPermissionBuilder()..update(updates))._build();

  _$OrganizationUserPermission._(
      {this.id, this.key, this.name, this.description, this.roles})
      : super._();

  @override
  OrganizationUserPermission rebuild(
          void Function(OrganizationUserPermissionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizationUserPermissionBuilder toBuilder() =>
      new OrganizationUserPermissionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganizationUserPermission &&
        id == other.id &&
        key == other.key &&
        name == other.name &&
        description == other.description &&
        roles == other.roles;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, roles.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrganizationUserPermission')
          ..add('id', id)
          ..add('key', key)
          ..add('name', name)
          ..add('description', description)
          ..add('roles', roles))
        .toString();
  }
}

class OrganizationUserPermissionBuilder
    implements
        Builder<OrganizationUserPermission, OrganizationUserPermissionBuilder> {
  _$OrganizationUserPermission? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  ListBuilder<OrganizationUserPermissionRolesInner>? _roles;
  ListBuilder<OrganizationUserPermissionRolesInner> get roles =>
      _$this._roles ??= new ListBuilder<OrganizationUserPermissionRolesInner>();
  set roles(ListBuilder<OrganizationUserPermissionRolesInner>? roles) =>
      _$this._roles = roles;

  OrganizationUserPermissionBuilder() {
    OrganizationUserPermission._defaults(this);
  }

  OrganizationUserPermissionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _name = $v.name;
      _description = $v.description;
      _roles = $v.roles?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganizationUserPermission other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganizationUserPermission;
  }

  @override
  void update(void Function(OrganizationUserPermissionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrganizationUserPermission build() => _build();

  _$OrganizationUserPermission _build() {
    _$OrganizationUserPermission _$result;
    try {
      _$result = _$v ??
          new _$OrganizationUserPermission._(
              id: id,
              key: key,
              name: name,
              description: description,
              roles: _roles?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'roles';
        _roles?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OrganizationUserPermission', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
