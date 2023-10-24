// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_roles_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetRolesResponse extends GetRolesResponse {
  @override
  final String? code;
  @override
  final String? message;
  @override
  final BuiltList<Roles>? roles;
  @override
  final String? nextToken;

  factory _$GetRolesResponse(
          [void Function(GetRolesResponseBuilder)? updates]) =>
      (new GetRolesResponseBuilder()..update(updates))._build();

  _$GetRolesResponse._({this.code, this.message, this.roles, this.nextToken})
      : super._();

  @override
  GetRolesResponse rebuild(void Function(GetRolesResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetRolesResponseBuilder toBuilder() =>
      new GetRolesResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetRolesResponse &&
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
    return (newBuiltValueToStringHelper(r'GetRolesResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('roles', roles)
          ..add('nextToken', nextToken))
        .toString();
  }
}

class GetRolesResponseBuilder
    implements Builder<GetRolesResponse, GetRolesResponseBuilder> {
  _$GetRolesResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<Roles>? _roles;
  ListBuilder<Roles> get roles => _$this._roles ??= new ListBuilder<Roles>();
  set roles(ListBuilder<Roles>? roles) => _$this._roles = roles;

  String? _nextToken;
  String? get nextToken => _$this._nextToken;
  set nextToken(String? nextToken) => _$this._nextToken = nextToken;

  GetRolesResponseBuilder() {
    GetRolesResponse._defaults(this);
  }

  GetRolesResponseBuilder get _$this {
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
  void replace(GetRolesResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetRolesResponse;
  }

  @override
  void update(void Function(GetRolesResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetRolesResponse build() => _build();

  _$GetRolesResponse _build() {
    _$GetRolesResponse _$result;
    try {
      _$result = _$v ??
          new _$GetRolesResponse._(
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
            r'GetRolesResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
