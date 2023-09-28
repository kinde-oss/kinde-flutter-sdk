// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_organization_users_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetOrganizationUsersResponse extends GetOrganizationUsersResponse {
  @override
  final String? code;
  @override
  final String? message;
  @override
  final BuiltList<OrganizationUser>? organizationUsers;
  @override
  final String? nextToken;

  factory _$GetOrganizationUsersResponse(
          [void Function(GetOrganizationUsersResponseBuilder)? updates]) =>
      (new GetOrganizationUsersResponseBuilder()..update(updates))._build();

  _$GetOrganizationUsersResponse._(
      {this.code, this.message, this.organizationUsers, this.nextToken})
      : super._();

  @override
  GetOrganizationUsersResponse rebuild(
          void Function(GetOrganizationUsersResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetOrganizationUsersResponseBuilder toBuilder() =>
      new GetOrganizationUsersResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetOrganizationUsersResponse &&
        code == other.code &&
        message == other.message &&
        organizationUsers == other.organizationUsers &&
        nextToken == other.nextToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, organizationUsers.hashCode);
    _$hash = $jc(_$hash, nextToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetOrganizationUsersResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('organizationUsers', organizationUsers)
          ..add('nextToken', nextToken))
        .toString();
  }
}

class GetOrganizationUsersResponseBuilder
    implements
        Builder<GetOrganizationUsersResponse,
            GetOrganizationUsersResponseBuilder> {
  _$GetOrganizationUsersResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<OrganizationUser>? _organizationUsers;
  ListBuilder<OrganizationUser> get organizationUsers =>
      _$this._organizationUsers ??= new ListBuilder<OrganizationUser>();
  set organizationUsers(ListBuilder<OrganizationUser>? organizationUsers) =>
      _$this._organizationUsers = organizationUsers;

  String? _nextToken;
  String? get nextToken => _$this._nextToken;
  set nextToken(String? nextToken) => _$this._nextToken = nextToken;

  GetOrganizationUsersResponseBuilder() {
    GetOrganizationUsersResponse._defaults(this);
  }

  GetOrganizationUsersResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _organizationUsers = $v.organizationUsers?.toBuilder();
      _nextToken = $v.nextToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetOrganizationUsersResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetOrganizationUsersResponse;
  }

  @override
  void update(void Function(GetOrganizationUsersResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetOrganizationUsersResponse build() => _build();

  _$GetOrganizationUsersResponse _build() {
    _$GetOrganizationUsersResponse _$result;
    try {
      _$result = _$v ??
          new _$GetOrganizationUsersResponse._(
              code: code,
              message: message,
              organizationUsers: _organizationUsers?.build(),
              nextToken: nextToken);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'organizationUsers';
        _organizationUsers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetOrganizationUsersResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
