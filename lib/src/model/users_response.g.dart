// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UsersResponse extends UsersResponse {
  @override
  final String? code;
  @override
  final String? message;
  @override
  final BuiltList<User>? users;
  @override
  final String? nextToken;

  factory _$UsersResponse([void Function(UsersResponseBuilder)? updates]) =>
      (new UsersResponseBuilder()..update(updates))._build();

  _$UsersResponse._({this.code, this.message, this.users, this.nextToken})
      : super._();

  @override
  UsersResponse rebuild(void Function(UsersResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersResponseBuilder toBuilder() => new UsersResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersResponse &&
        code == other.code &&
        message == other.message &&
        users == other.users &&
        nextToken == other.nextToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jc(_$hash, nextToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('users', users)
          ..add('nextToken', nextToken))
        .toString();
  }
}

class UsersResponseBuilder
    implements Builder<UsersResponse, UsersResponseBuilder> {
  _$UsersResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<User>? _users;
  ListBuilder<User> get users => _$this._users ??= new ListBuilder<User>();
  set users(ListBuilder<User>? users) => _$this._users = users;

  String? _nextToken;
  String? get nextToken => _$this._nextToken;
  set nextToken(String? nextToken) => _$this._nextToken = nextToken;

  UsersResponseBuilder() {
    UsersResponse._defaults(this);
  }

  UsersResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _users = $v.users?.toBuilder();
      _nextToken = $v.nextToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersResponse;
  }

  @override
  void update(void Function(UsersResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersResponse build() => _build();

  _$UsersResponse _build() {
    _$UsersResponse _$result;
    try {
      _$result = _$v ??
          new _$UsersResponse._(
              code: code,
              message: message,
              users: _users?.build(),
              nextToken: nextToken);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
