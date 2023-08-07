// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_user_role.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrganizationUserRole extends OrganizationUserRole {
  @override
  final String? id;
  @override
  final String? key;
  @override
  final String? name;

  factory _$OrganizationUserRole(
          [void Function(OrganizationUserRoleBuilder)? updates]) =>
      (new OrganizationUserRoleBuilder()..update(updates))._build();

  _$OrganizationUserRole._({this.id, this.key, this.name}) : super._();

  @override
  OrganizationUserRole rebuild(
          void Function(OrganizationUserRoleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizationUserRoleBuilder toBuilder() =>
      new OrganizationUserRoleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganizationUserRole &&
        id == other.id &&
        key == other.key &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrganizationUserRole')
          ..add('id', id)
          ..add('key', key)
          ..add('name', name))
        .toString();
  }
}

class OrganizationUserRoleBuilder
    implements Builder<OrganizationUserRole, OrganizationUserRoleBuilder> {
  _$OrganizationUserRole? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  OrganizationUserRoleBuilder() {
    OrganizationUserRole._defaults(this);
  }

  OrganizationUserRoleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganizationUserRole other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganizationUserRole;
  }

  @override
  void update(void Function(OrganizationUserRoleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrganizationUserRole build() => _build();

  _$OrganizationUserRole _build() {
    final _$result =
        _$v ?? new _$OrganizationUserRole._(id: id, key: key, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
