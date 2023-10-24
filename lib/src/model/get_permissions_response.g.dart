// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_permissions_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetPermissionsResponse extends GetPermissionsResponse {
  @override
  final String? code;
  @override
  final String? message;
  @override
  final BuiltList<Permissions>? permissions;
  @override
  final String? nextToken;

  factory _$GetPermissionsResponse(
          [void Function(GetPermissionsResponseBuilder)? updates]) =>
      (new GetPermissionsResponseBuilder()..update(updates))._build();

  _$GetPermissionsResponse._(
      {this.code, this.message, this.permissions, this.nextToken})
      : super._();

  @override
  GetPermissionsResponse rebuild(
          void Function(GetPermissionsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetPermissionsResponseBuilder toBuilder() =>
      new GetPermissionsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetPermissionsResponse &&
        code == other.code &&
        message == other.message &&
        permissions == other.permissions &&
        nextToken == other.nextToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, permissions.hashCode);
    _$hash = $jc(_$hash, nextToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetPermissionsResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('permissions', permissions)
          ..add('nextToken', nextToken))
        .toString();
  }
}

class GetPermissionsResponseBuilder
    implements Builder<GetPermissionsResponse, GetPermissionsResponseBuilder> {
  _$GetPermissionsResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<Permissions>? _permissions;
  ListBuilder<Permissions> get permissions =>
      _$this._permissions ??= new ListBuilder<Permissions>();
  set permissions(ListBuilder<Permissions>? permissions) =>
      _$this._permissions = permissions;

  String? _nextToken;
  String? get nextToken => _$this._nextToken;
  set nextToken(String? nextToken) => _$this._nextToken = nextToken;

  GetPermissionsResponseBuilder() {
    GetPermissionsResponse._defaults(this);
  }

  GetPermissionsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _permissions = $v.permissions?.toBuilder();
      _nextToken = $v.nextToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetPermissionsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetPermissionsResponse;
  }

  @override
  void update(void Function(GetPermissionsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetPermissionsResponse build() => _build();

  _$GetPermissionsResponse _build() {
    _$GetPermissionsResponse _$result;
    try {
      _$result = _$v ??
          new _$GetPermissionsResponse._(
              code: code,
              message: message,
              permissions: _permissions?.build(),
              nextToken: nextToken);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'permissions';
        _permissions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetPermissionsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
