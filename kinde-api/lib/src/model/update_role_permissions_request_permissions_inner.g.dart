// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_role_permissions_request_permissions_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateRolePermissionsRequestPermissionsInner
    extends UpdateRolePermissionsRequestPermissionsInner {
  @override
  final String? id;
  @override
  final String? operation;

  factory _$UpdateRolePermissionsRequestPermissionsInner(
          [void Function(UpdateRolePermissionsRequestPermissionsInnerBuilder)?
              updates]) =>
      (new UpdateRolePermissionsRequestPermissionsInnerBuilder()
            ..update(updates))
          ._build();

  _$UpdateRolePermissionsRequestPermissionsInner._({this.id, this.operation})
      : super._();

  @override
  UpdateRolePermissionsRequestPermissionsInner rebuild(
          void Function(UpdateRolePermissionsRequestPermissionsInnerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateRolePermissionsRequestPermissionsInnerBuilder toBuilder() =>
      new UpdateRolePermissionsRequestPermissionsInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateRolePermissionsRequestPermissionsInner &&
        id == other.id &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'UpdateRolePermissionsRequestPermissionsInner')
          ..add('id', id)
          ..add('operation', operation))
        .toString();
  }
}

class UpdateRolePermissionsRequestPermissionsInnerBuilder
    implements
        Builder<UpdateRolePermissionsRequestPermissionsInner,
            UpdateRolePermissionsRequestPermissionsInnerBuilder> {
  _$UpdateRolePermissionsRequestPermissionsInner? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _operation;
  String? get operation => _$this._operation;
  set operation(String? operation) => _$this._operation = operation;

  UpdateRolePermissionsRequestPermissionsInnerBuilder() {
    UpdateRolePermissionsRequestPermissionsInner._defaults(this);
  }

  UpdateRolePermissionsRequestPermissionsInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateRolePermissionsRequestPermissionsInner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateRolePermissionsRequestPermissionsInner;
  }

  @override
  void update(
      void Function(UpdateRolePermissionsRequestPermissionsInnerBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateRolePermissionsRequestPermissionsInner build() => _build();

  _$UpdateRolePermissionsRequestPermissionsInner _build() {
    final _$result = _$v ??
        new _$UpdateRolePermissionsRequestPermissionsInner._(
            id: id, operation: operation);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
