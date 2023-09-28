// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles_permission_response_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RolesPermissionResponseInner extends RolesPermissionResponseInner {
  @override
  final String? id;
  @override
  final String? key;
  @override
  final String? name;
  @override
  final String? description;

  factory _$RolesPermissionResponseInner(
          [void Function(RolesPermissionResponseInnerBuilder)? updates]) =>
      (new RolesPermissionResponseInnerBuilder()..update(updates))._build();

  _$RolesPermissionResponseInner._(
      {this.id, this.key, this.name, this.description})
      : super._();

  @override
  RolesPermissionResponseInner rebuild(
          void Function(RolesPermissionResponseInnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RolesPermissionResponseInnerBuilder toBuilder() =>
      new RolesPermissionResponseInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RolesPermissionResponseInner &&
        id == other.id &&
        key == other.key &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RolesPermissionResponseInner')
          ..add('id', id)
          ..add('key', key)
          ..add('name', name)
          ..add('description', description))
        .toString();
  }
}

class RolesPermissionResponseInnerBuilder
    implements
        Builder<RolesPermissionResponseInner,
            RolesPermissionResponseInnerBuilder> {
  _$RolesPermissionResponseInner? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  RolesPermissionResponseInnerBuilder() {
    RolesPermissionResponseInner._defaults(this);
  }

  RolesPermissionResponseInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _key = $v.key;
      _name = $v.name;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RolesPermissionResponseInner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RolesPermissionResponseInner;
  }

  @override
  void update(void Function(RolesPermissionResponseInnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RolesPermissionResponseInner build() => _build();

  _$RolesPermissionResponseInner _build() {
    final _$result = _$v ??
        new _$RolesPermissionResponseInner._(
            id: id, key: key, name: name, description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
