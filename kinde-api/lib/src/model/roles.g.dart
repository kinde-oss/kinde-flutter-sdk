// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Roles extends Roles {
  @override
  final String? key;
  @override
  final String? name;
  @override
  final String? description;

  factory _$Roles([void Function(RolesBuilder)? updates]) =>
      (new RolesBuilder()..update(updates))._build();

  _$Roles._({this.key, this.name, this.description}) : super._();

  @override
  Roles rebuild(void Function(RolesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RolesBuilder toBuilder() => new RolesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Roles &&
        key == other.key &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Roles')
          ..add('key', key)
          ..add('name', name)
          ..add('description', description))
        .toString();
  }
}

class RolesBuilder implements Builder<Roles, RolesBuilder> {
  _$Roles? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  RolesBuilder() {
    Roles._defaults(this);
  }

  RolesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _name = $v.name;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Roles other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Roles;
  }

  @override
  void update(void Function(RolesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Roles build() => _build();

  _$Roles _build() {
    final _$result =
        _$v ?? new _$Roles._(key: key, name: name, description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
