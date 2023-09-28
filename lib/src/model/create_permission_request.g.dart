// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_permission_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreatePermissionRequest extends CreatePermissionRequest {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? key;

  factory _$CreatePermissionRequest(
          [void Function(CreatePermissionRequestBuilder)? updates]) =>
      (new CreatePermissionRequestBuilder()..update(updates))._build();

  _$CreatePermissionRequest._({this.name, this.description, this.key})
      : super._();

  @override
  CreatePermissionRequest rebuild(
          void Function(CreatePermissionRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatePermissionRequestBuilder toBuilder() =>
      new CreatePermissionRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatePermissionRequest &&
        name == other.name &&
        description == other.description &&
        key == other.key;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreatePermissionRequest')
          ..add('name', name)
          ..add('description', description)
          ..add('key', key))
        .toString();
  }
}

class CreatePermissionRequestBuilder
    implements
        Builder<CreatePermissionRequest, CreatePermissionRequestBuilder> {
  _$CreatePermissionRequest? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  CreatePermissionRequestBuilder() {
    CreatePermissionRequest._defaults(this);
  }

  CreatePermissionRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _key = $v.key;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatePermissionRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreatePermissionRequest;
  }

  @override
  void update(void Function(CreatePermissionRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreatePermissionRequest build() => _build();

  _$CreatePermissionRequest _build() {
    final _$result = _$v ??
        new _$CreatePermissionRequest._(
            name: name, description: description, key: key);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
