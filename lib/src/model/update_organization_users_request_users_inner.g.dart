// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_organization_users_request_users_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateOrganizationUsersRequestUsersInner
    extends UpdateOrganizationUsersRequestUsersInner {
  @override
  final String? id;
  @override
  final String? operation;
  @override
  final BuiltList<String>? roles;
  @override
  final BuiltList<String>? permissions;

  factory _$UpdateOrganizationUsersRequestUsersInner(
          [void Function(UpdateOrganizationUsersRequestUsersInnerBuilder)?
              updates]) =>
      (new UpdateOrganizationUsersRequestUsersInnerBuilder()..update(updates))
          ._build();

  _$UpdateOrganizationUsersRequestUsersInner._(
      {this.id, this.operation, this.roles, this.permissions})
      : super._();

  @override
  UpdateOrganizationUsersRequestUsersInner rebuild(
          void Function(UpdateOrganizationUsersRequestUsersInnerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateOrganizationUsersRequestUsersInnerBuilder toBuilder() =>
      new UpdateOrganizationUsersRequestUsersInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateOrganizationUsersRequestUsersInner &&
        id == other.id &&
        operation == other.operation &&
        roles == other.roles &&
        permissions == other.permissions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jc(_$hash, roles.hashCode);
    _$hash = $jc(_$hash, permissions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'UpdateOrganizationUsersRequestUsersInner')
          ..add('id', id)
          ..add('operation', operation)
          ..add('roles', roles)
          ..add('permissions', permissions))
        .toString();
  }
}

class UpdateOrganizationUsersRequestUsersInnerBuilder
    implements
        Builder<UpdateOrganizationUsersRequestUsersInner,
            UpdateOrganizationUsersRequestUsersInnerBuilder> {
  _$UpdateOrganizationUsersRequestUsersInner? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _operation;
  String? get operation => _$this._operation;
  set operation(String? operation) => _$this._operation = operation;

  ListBuilder<String>? _roles;
  ListBuilder<String> get roles => _$this._roles ??= new ListBuilder<String>();
  set roles(ListBuilder<String>? roles) => _$this._roles = roles;

  ListBuilder<String>? _permissions;
  ListBuilder<String> get permissions =>
      _$this._permissions ??= new ListBuilder<String>();
  set permissions(ListBuilder<String>? permissions) =>
      _$this._permissions = permissions;

  UpdateOrganizationUsersRequestUsersInnerBuilder() {
    UpdateOrganizationUsersRequestUsersInner._defaults(this);
  }

  UpdateOrganizationUsersRequestUsersInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _operation = $v.operation;
      _roles = $v.roles?.toBuilder();
      _permissions = $v.permissions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateOrganizationUsersRequestUsersInner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateOrganizationUsersRequestUsersInner;
  }

  @override
  void update(
      void Function(UpdateOrganizationUsersRequestUsersInnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateOrganizationUsersRequestUsersInner build() => _build();

  _$UpdateOrganizationUsersRequestUsersInner _build() {
    _$UpdateOrganizationUsersRequestUsersInner _$result;
    try {
      _$result = _$v ??
          new _$UpdateOrganizationUsersRequestUsersInner._(
              id: id,
              operation: operation,
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
            r'UpdateOrganizationUsersRequestUsersInner',
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
