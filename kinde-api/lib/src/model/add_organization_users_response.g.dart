// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_organization_users_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddOrganizationUsersResponse extends AddOrganizationUsersResponse {
  @override
  final String? code;
  @override
  final String? message;
  @override
  final BuiltList<String>? usersAdded;

  factory _$AddOrganizationUsersResponse(
          [void Function(AddOrganizationUsersResponseBuilder)? updates]) =>
      (new AddOrganizationUsersResponseBuilder()..update(updates))._build();

  _$AddOrganizationUsersResponse._({this.code, this.message, this.usersAdded})
      : super._();

  @override
  AddOrganizationUsersResponse rebuild(
          void Function(AddOrganizationUsersResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddOrganizationUsersResponseBuilder toBuilder() =>
      new AddOrganizationUsersResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddOrganizationUsersResponse &&
        code == other.code &&
        message == other.message &&
        usersAdded == other.usersAdded;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, usersAdded.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddOrganizationUsersResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('usersAdded', usersAdded))
        .toString();
  }
}

class AddOrganizationUsersResponseBuilder
    implements
        Builder<AddOrganizationUsersResponse,
            AddOrganizationUsersResponseBuilder> {
  _$AddOrganizationUsersResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<String>? _usersAdded;
  ListBuilder<String> get usersAdded =>
      _$this._usersAdded ??= new ListBuilder<String>();
  set usersAdded(ListBuilder<String>? usersAdded) =>
      _$this._usersAdded = usersAdded;

  AddOrganizationUsersResponseBuilder() {
    AddOrganizationUsersResponse._defaults(this);
  }

  AddOrganizationUsersResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _usersAdded = $v.usersAdded?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddOrganizationUsersResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddOrganizationUsersResponse;
  }

  @override
  void update(void Function(AddOrganizationUsersResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddOrganizationUsersResponse build() => _build();

  _$AddOrganizationUsersResponse _build() {
    _$AddOrganizationUsersResponse _$result;
    try {
      _$result = _$v ??
          new _$AddOrganizationUsersResponse._(
              code: code, message: message, usersAdded: _usersAdded?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'usersAdded';
        _usersAdded?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AddOrganizationUsersResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
