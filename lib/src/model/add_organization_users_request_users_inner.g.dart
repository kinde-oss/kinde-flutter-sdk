// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_organization_users_request_users_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddOrganizationUsersRequestUsersInner
    extends AddOrganizationUsersRequestUsersInner {
  @override
  final String? id;
  @override
  final BuiltList<String>? roles;
  @override
  final BuiltList<String>? permissions;

  factory _$AddOrganizationUsersRequestUsersInner(
          [void Function(AddOrganizationUsersRequestUsersInnerBuilder)?
              updates]) =>
      (new AddOrganizationUsersRequestUsersInnerBuilder()..update(updates))
          ._build();

  _$AddOrganizationUsersRequestUsersInner._(
      {this.id, this.roles, this.permissions})
      : super._();

  @override
  AddOrganizationUsersRequestUsersInner rebuild(
          void Function(AddOrganizationUsersRequestUsersInnerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddOrganizationUsersRequestUsersInnerBuilder toBuilder() =>
      new AddOrganizationUsersRequestUsersInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddOrganizationUsersRequestUsersInner &&
        id == other.id &&
        roles == other.roles &&
        permissions == other.permissions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, roles.hashCode);
    _$hash = $jc(_$hash, permissions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'AddOrganizationUsersRequestUsersInner')
          ..add('id', id)
          ..add('roles', roles)
          ..add('permissions', permissions))
        .toString();
  }
}

class AddOrganizationUsersRequestUsersInnerBuilder
    implements
        Builder<AddOrganizationUsersRequestUsersInner,
            AddOrganizationUsersRequestUsersInnerBuilder> {
  _$AddOrganizationUsersRequestUsersInner? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ListBuilder<String>? _roles;
  ListBuilder<String> get roles => _$this._roles ??= new ListBuilder<String>();
  set roles(ListBuilder<String>? roles) => _$this._roles = roles;

  ListBuilder<String>? _permissions;
  ListBuilder<String> get permissions =>
      _$this._permissions ??= new ListBuilder<String>();
  set permissions(ListBuilder<String>? permissions) =>
      _$this._permissions = permissions;

  AddOrganizationUsersRequestUsersInnerBuilder() {
    AddOrganizationUsersRequestUsersInner._defaults(this);
  }

  AddOrganizationUsersRequestUsersInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _roles = $v.roles?.toBuilder();
      _permissions = $v.permissions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddOrganizationUsersRequestUsersInner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddOrganizationUsersRequestUsersInner;
  }

  @override
  void update(
      void Function(AddOrganizationUsersRequestUsersInnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddOrganizationUsersRequestUsersInner build() => _build();

  _$AddOrganizationUsersRequestUsersInner _build() {
    _$AddOrganizationUsersRequestUsersInner _$result;
    try {
      _$result = _$v ??
          new _$AddOrganizationUsersRequestUsersInner._(
              id: id,
              roles: _roles?.build(),
              permissions: _permissions?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'roles';
        _roles?.build();
        _$failedField = 'permissions';
        _permissions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AddOrganizationUsersRequestUsersInner',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
