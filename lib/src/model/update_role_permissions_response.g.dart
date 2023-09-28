// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_role_permissions_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateRolePermissionsResponse extends UpdateRolePermissionsResponse {
  @override
  final String? code;
  @override
  final String? message;
  @override
  final BuiltList<String>? permissionsAdded;
  @override
  final BuiltList<String>? permissionsRemoved;

  factory _$UpdateRolePermissionsResponse(
          [void Function(UpdateRolePermissionsResponseBuilder)? updates]) =>
      (new UpdateRolePermissionsResponseBuilder()..update(updates))._build();

  _$UpdateRolePermissionsResponse._(
      {this.code, this.message, this.permissionsAdded, this.permissionsRemoved})
      : super._();

  @override
  UpdateRolePermissionsResponse rebuild(
          void Function(UpdateRolePermissionsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateRolePermissionsResponseBuilder toBuilder() =>
      new UpdateRolePermissionsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateRolePermissionsResponse &&
        code == other.code &&
        message == other.message &&
        permissionsAdded == other.permissionsAdded &&
        permissionsRemoved == other.permissionsRemoved;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, permissionsAdded.hashCode);
    _$hash = $jc(_$hash, permissionsRemoved.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateRolePermissionsResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('permissionsAdded', permissionsAdded)
          ..add('permissionsRemoved', permissionsRemoved))
        .toString();
  }
}

class UpdateRolePermissionsResponseBuilder
    implements
        Builder<UpdateRolePermissionsResponse,
            UpdateRolePermissionsResponseBuilder> {
  _$UpdateRolePermissionsResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<String>? _permissionsAdded;
  ListBuilder<String> get permissionsAdded =>
      _$this._permissionsAdded ??= new ListBuilder<String>();
  set permissionsAdded(ListBuilder<String>? permissionsAdded) =>
      _$this._permissionsAdded = permissionsAdded;

  ListBuilder<String>? _permissionsRemoved;
  ListBuilder<String> get permissionsRemoved =>
      _$this._permissionsRemoved ??= new ListBuilder<String>();
  set permissionsRemoved(ListBuilder<String>? permissionsRemoved) =>
      _$this._permissionsRemoved = permissionsRemoved;

  UpdateRolePermissionsResponseBuilder() {
    UpdateRolePermissionsResponse._defaults(this);
  }

  UpdateRolePermissionsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _permissionsAdded = $v.permissionsAdded?.toBuilder();
      _permissionsRemoved = $v.permissionsRemoved?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateRolePermissionsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateRolePermissionsResponse;
  }

  @override
  void update(void Function(UpdateRolePermissionsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateRolePermissionsResponse build() => _build();

  _$UpdateRolePermissionsResponse _build() {
    _$UpdateRolePermissionsResponse _$result;
    try {
      _$result = _$v ??
          new _$UpdateRolePermissionsResponse._(
              code: code,
              message: message,
              permissionsAdded: _permissionsAdded?.build(),
              permissionsRemoved: _permissionsRemoved?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'permissionsAdded';
        _permissionsAdded?.build();
        _$failedField = 'permissionsRemoved';
        _permissionsRemoved?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateRolePermissionsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
