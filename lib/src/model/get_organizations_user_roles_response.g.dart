// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_organizations_user_roles_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetOrganizationsUserRolesResponse
    extends GetOrganizationsUserRolesResponse {
  @override
  final String? code;
  @override
  final String? message;
  @override
  final BuiltList<OrganizationUserRole>? roles;
  @override
  final String? nextToken;

  factory _$GetOrganizationsUserRolesResponse([
    void Function(GetOrganizationsUserRolesResponseBuilder)? updates,
  ]) =>
      (new GetOrganizationsUserRolesResponseBuilder()..update(updates))
          ._build();

  _$GetOrganizationsUserRolesResponse._({
    this.code,
    this.message,
    this.roles,
    this.nextToken,
  }) : super._();

  @override
  GetOrganizationsUserRolesResponse rebuild(
    void Function(GetOrganizationsUserRolesResponseBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  GetOrganizationsUserRolesResponseBuilder toBuilder() =>
      new GetOrganizationsUserRolesResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetOrganizationsUserRolesResponse &&
        code == other.code &&
        message == other.message &&
        roles == other.roles &&
        nextToken == other.nextToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, roles.hashCode);
    _$hash = $jc(_$hash, nextToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetOrganizationsUserRolesResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('roles', roles)
          ..add('nextToken', nextToken))
        .toString();
  }
}

class GetOrganizationsUserRolesResponseBuilder
    implements
        Builder<
          GetOrganizationsUserRolesResponse,
          GetOrganizationsUserRolesResponseBuilder
        > {
  _$GetOrganizationsUserRolesResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<OrganizationUserRole>? _roles;
  ListBuilder<OrganizationUserRole> get roles =>
      _$this._roles ??= new ListBuilder<OrganizationUserRole>();
  set roles(ListBuilder<OrganizationUserRole>? roles) => _$this._roles = roles;

  String? _nextToken;
  String? get nextToken => _$this._nextToken;
  set nextToken(String? nextToken) => _$this._nextToken = nextToken;

  GetOrganizationsUserRolesResponseBuilder() {
    GetOrganizationsUserRolesResponse._defaults(this);
  }

  GetOrganizationsUserRolesResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _roles = $v.roles?.toBuilder();
      _nextToken = $v.nextToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetOrganizationsUserRolesResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetOrganizationsUserRolesResponse;
  }

  @override
  void update(
    void Function(GetOrganizationsUserRolesResponseBuilder)? updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  GetOrganizationsUserRolesResponse build() => _build();

  _$GetOrganizationsUserRolesResponse _build() {
    _$GetOrganizationsUserRolesResponse _$result;
    try {
      _$result =
          _$v ??
          new _$GetOrganizationsUserRolesResponse._(
            code: code,
            message: message,
            roles: _roles?.build(),
            nextToken: nextToken,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'roles';
        _roles?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
          r'GetOrganizationsUserRolesResponse',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
