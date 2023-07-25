// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_organization_user_role_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateOrganizationUserRoleRequest
    extends CreateOrganizationUserRoleRequest {
  @override
  final String? roleId;

  factory _$CreateOrganizationUserRoleRequest(
          [void Function(CreateOrganizationUserRoleRequestBuilder)? updates]) =>
      (new CreateOrganizationUserRoleRequestBuilder()..update(updates))
          ._build();

  _$CreateOrganizationUserRoleRequest._({this.roleId}) : super._();

  @override
  CreateOrganizationUserRoleRequest rebuild(
          void Function(CreateOrganizationUserRoleRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateOrganizationUserRoleRequestBuilder toBuilder() =>
      new CreateOrganizationUserRoleRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateOrganizationUserRoleRequest && roleId == other.roleId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, roleId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateOrganizationUserRoleRequest')
          ..add('roleId', roleId))
        .toString();
  }
}

class CreateOrganizationUserRoleRequestBuilder
    implements
        Builder<CreateOrganizationUserRoleRequest,
            CreateOrganizationUserRoleRequestBuilder> {
  _$CreateOrganizationUserRoleRequest? _$v;

  String? _roleId;
  String? get roleId => _$this._roleId;
  set roleId(String? roleId) => _$this._roleId = roleId;

  CreateOrganizationUserRoleRequestBuilder() {
    CreateOrganizationUserRoleRequest._defaults(this);
  }

  CreateOrganizationUserRoleRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _roleId = $v.roleId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateOrganizationUserRoleRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateOrganizationUserRoleRequest;
  }

  @override
  void update(
      void Function(CreateOrganizationUserRoleRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateOrganizationUserRoleRequest build() => _build();

  _$CreateOrganizationUserRoleRequest _build() {
    final _$result =
        _$v ?? new _$CreateOrganizationUserRoleRequest._(roleId: roleId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
