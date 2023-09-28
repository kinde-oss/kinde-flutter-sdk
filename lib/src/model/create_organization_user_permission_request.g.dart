// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_organization_user_permission_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateOrganizationUserPermissionRequest
    extends CreateOrganizationUserPermissionRequest {
  @override
  final String? permissionId;

  factory _$CreateOrganizationUserPermissionRequest(
          [void Function(CreateOrganizationUserPermissionRequestBuilder)?
              updates]) =>
      (new CreateOrganizationUserPermissionRequestBuilder()..update(updates))
          ._build();

  _$CreateOrganizationUserPermissionRequest._({this.permissionId}) : super._();

  @override
  CreateOrganizationUserPermissionRequest rebuild(
          void Function(CreateOrganizationUserPermissionRequestBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateOrganizationUserPermissionRequestBuilder toBuilder() =>
      new CreateOrganizationUserPermissionRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateOrganizationUserPermissionRequest &&
        permissionId == other.permissionId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, permissionId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'CreateOrganizationUserPermissionRequest')
          ..add('permissionId', permissionId))
        .toString();
  }
}

class CreateOrganizationUserPermissionRequestBuilder
    implements
        Builder<CreateOrganizationUserPermissionRequest,
            CreateOrganizationUserPermissionRequestBuilder> {
  _$CreateOrganizationUserPermissionRequest? _$v;

  String? _permissionId;
  String? get permissionId => _$this._permissionId;
  set permissionId(String? permissionId) => _$this._permissionId = permissionId;

  CreateOrganizationUserPermissionRequestBuilder() {
    CreateOrganizationUserPermissionRequest._defaults(this);
  }

  CreateOrganizationUserPermissionRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _permissionId = $v.permissionId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateOrganizationUserPermissionRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateOrganizationUserPermissionRequest;
  }

  @override
  void update(
      void Function(CreateOrganizationUserPermissionRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateOrganizationUserPermissionRequest build() => _build();

  _$CreateOrganizationUserPermissionRequest _build() {
    final _$result = _$v ??
        new _$CreateOrganizationUserPermissionRequest._(
            permissionId: permissionId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
