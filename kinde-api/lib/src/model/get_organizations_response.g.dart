// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_organizations_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetOrganizationsResponse extends GetOrganizationsResponse {
  @override
  final String? code;
  @override
  final String? message;
  @override
  final BuiltList<Role>? roles;
  @override
  final String? nextToken;

  factory _$GetOrganizationsResponse(
          [void Function(GetOrganizationsResponseBuilder)? updates]) =>
      (new GetOrganizationsResponseBuilder()..update(updates))._build();

  _$GetOrganizationsResponse._(
      {this.code, this.message, this.roles, this.nextToken})
      : super._();

  @override
  GetOrganizationsResponse rebuild(
          void Function(GetOrganizationsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetOrganizationsResponseBuilder toBuilder() =>
      new GetOrganizationsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetOrganizationsResponse &&
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
    return (newBuiltValueToStringHelper(r'GetOrganizationsResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('roles', roles)
          ..add('nextToken', nextToken))
        .toString();
  }
}

class GetOrganizationsResponseBuilder
    implements
        Builder<GetOrganizationsResponse, GetOrganizationsResponseBuilder> {
  _$GetOrganizationsResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<Role>? _roles;
  ListBuilder<Role> get roles => _$this._roles ??= new ListBuilder<Role>();
  set roles(ListBuilder<Role>? roles) => _$this._roles = roles;

  String? _nextToken;
  String? get nextToken => _$this._nextToken;
  set nextToken(String? nextToken) => _$this._nextToken = nextToken;

  GetOrganizationsResponseBuilder() {
    GetOrganizationsResponse._defaults(this);
  }

  GetOrganizationsResponseBuilder get _$this {
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
  void replace(GetOrganizationsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetOrganizationsResponse;
  }

  @override
  void update(void Function(GetOrganizationsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetOrganizationsResponse build() => _build();

  _$GetOrganizationsResponse _build() {
    _$GetOrganizationsResponse _$result;
    try {
      _$result = _$v ??
          new _$GetOrganizationsResponse._(
              code: code,
              message: message,
              roles: _roles?.build(),
              nextToken: nextToken);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'roles';
        _roles?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetOrganizationsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
