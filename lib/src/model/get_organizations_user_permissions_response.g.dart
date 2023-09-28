// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_organizations_user_permissions_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetOrganizationsUserPermissionsResponse
    extends GetOrganizationsUserPermissionsResponse {
  @override
  final String? code;
  @override
  final String? message;
  @override
  final BuiltList<OrganizationUserPermission>? permissions;

  factory _$GetOrganizationsUserPermissionsResponse(
          [void Function(GetOrganizationsUserPermissionsResponseBuilder)?
              updates]) =>
      (new GetOrganizationsUserPermissionsResponseBuilder()..update(updates))
          ._build();

  _$GetOrganizationsUserPermissionsResponse._(
      {this.code, this.message, this.permissions})
      : super._();

  @override
  GetOrganizationsUserPermissionsResponse rebuild(
          void Function(GetOrganizationsUserPermissionsResponseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetOrganizationsUserPermissionsResponseBuilder toBuilder() =>
      new GetOrganizationsUserPermissionsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetOrganizationsUserPermissionsResponse &&
        code == other.code &&
        message == other.message &&
        permissions == other.permissions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, permissions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GetOrganizationsUserPermissionsResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('permissions', permissions))
        .toString();
  }
}

class GetOrganizationsUserPermissionsResponseBuilder
    implements
        Builder<GetOrganizationsUserPermissionsResponse,
            GetOrganizationsUserPermissionsResponseBuilder> {
  _$GetOrganizationsUserPermissionsResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<OrganizationUserPermission>? _permissions;
  ListBuilder<OrganizationUserPermission> get permissions =>
      _$this._permissions ??= new ListBuilder<OrganizationUserPermission>();
  set permissions(ListBuilder<OrganizationUserPermission>? permissions) =>
      _$this._permissions = permissions;

  GetOrganizationsUserPermissionsResponseBuilder() {
    GetOrganizationsUserPermissionsResponse._defaults(this);
  }

  GetOrganizationsUserPermissionsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _permissions = $v.permissions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetOrganizationsUserPermissionsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetOrganizationsUserPermissionsResponse;
  }

  @override
  void update(
      void Function(GetOrganizationsUserPermissionsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetOrganizationsUserPermissionsResponse build() => _build();

  _$GetOrganizationsUserPermissionsResponse _build() {
    _$GetOrganizationsUserPermissionsResponse _$result;
    try {
      _$result = _$v ??
          new _$GetOrganizationsUserPermissionsResponse._(
              code: code, message: message, permissions: _permissions?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'permissions';
        _permissions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetOrganizationsUserPermissionsResponse',
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
