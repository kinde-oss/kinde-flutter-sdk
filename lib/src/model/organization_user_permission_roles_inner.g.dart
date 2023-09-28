// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_user_permission_roles_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrganizationUserPermissionRolesInner
    extends OrganizationUserPermissionRolesInner {
  @override
  final String? id;
  @override
  final String? key;

  factory _$OrganizationUserPermissionRolesInner(
          [void Function(OrganizationUserPermissionRolesInnerBuilder)?
              updates]) =>
      (new OrganizationUserPermissionRolesInnerBuilder()..update(updates))
          ._build();

  _$OrganizationUserPermissionRolesInner._({this.id, this.key}) : super._();

  @override
  OrganizationUserPermissionRolesInner rebuild(
          void Function(OrganizationUserPermissionRolesInnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizationUserPermissionRolesInnerBuilder toBuilder() =>
      new OrganizationUserPermissionRolesInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganizationUserPermissionRolesInner &&
        id == other.id &&
        key == other.key;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrganizationUserPermissionRolesInner')
          ..add('id', id)
          ..add('key', key))
        .toString();
  }
}

class OrganizationUserPermissionRolesInnerBuilder
    implements
        Builder<OrganizationUserPermissionRolesInner,
            OrganizationUserPermissionRolesInnerBuilder> {
  _$OrganizationUserPermissionRolesInner? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  OrganizationUserPermissionRolesInnerBuilder() {
    OrganizationUserPermissionRolesInner._defaults(this);
  }

  OrganizationUserPermissionRolesInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganizationUserPermissionRolesInner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganizationUserPermissionRolesInner;
  }

  @override
  void update(
      void Function(OrganizationUserPermissionRolesInnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrganizationUserPermissionRolesInner build() => _build();

  _$OrganizationUserPermissionRolesInner _build() {
    final _$result =
        _$v ?? new _$OrganizationUserPermissionRolesInner._(id: id, key: key);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
