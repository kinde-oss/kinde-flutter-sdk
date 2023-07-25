// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_role_permissions_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateRolePermissionsRequest extends UpdateRolePermissionsRequest {
  @override
  final BuiltList<UpdateRolePermissionsRequestPermissionsInner>? permissions;

  factory _$UpdateRolePermissionsRequest(
          [void Function(UpdateRolePermissionsRequestBuilder)? updates]) =>
      (new UpdateRolePermissionsRequestBuilder()..update(updates))._build();

  _$UpdateRolePermissionsRequest._({this.permissions}) : super._();

  @override
  UpdateRolePermissionsRequest rebuild(
          void Function(UpdateRolePermissionsRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateRolePermissionsRequestBuilder toBuilder() =>
      new UpdateRolePermissionsRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateRolePermissionsRequest &&
        permissions == other.permissions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, permissions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateRolePermissionsRequest')
          ..add('permissions', permissions))
        .toString();
  }
}

class UpdateRolePermissionsRequestBuilder
    implements
        Builder<UpdateRolePermissionsRequest,
            UpdateRolePermissionsRequestBuilder> {
  _$UpdateRolePermissionsRequest? _$v;

  ListBuilder<UpdateRolePermissionsRequestPermissionsInner>? _permissions;
  ListBuilder<UpdateRolePermissionsRequestPermissionsInner> get permissions =>
      _$this._permissions ??=
          new ListBuilder<UpdateRolePermissionsRequestPermissionsInner>();
  set permissions(
          ListBuilder<UpdateRolePermissionsRequestPermissionsInner>?
              permissions) =>
      _$this._permissions = permissions;

  UpdateRolePermissionsRequestBuilder() {
    UpdateRolePermissionsRequest._defaults(this);
  }

  UpdateRolePermissionsRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _permissions = $v.permissions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateRolePermissionsRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateRolePermissionsRequest;
  }

  @override
  void update(void Function(UpdateRolePermissionsRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateRolePermissionsRequest build() => _build();

  _$UpdateRolePermissionsRequest _build() {
    _$UpdateRolePermissionsRequest _$result;
    try {
      _$result = _$v ??
          new _$UpdateRolePermissionsRequest._(
              permissions: _permissions?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'permissions';
        _permissions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateRolePermissionsRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
