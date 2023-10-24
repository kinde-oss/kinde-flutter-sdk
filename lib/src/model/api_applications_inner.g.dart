// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_applications_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiApplicationsInner extends ApiApplicationsInner {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? type;
  @override
  final bool? isActive;

  factory _$ApiApplicationsInner(
          [void Function(ApiApplicationsInnerBuilder)? updates]) =>
      (new ApiApplicationsInnerBuilder()..update(updates))._build();

  _$ApiApplicationsInner._({this.id, this.name, this.type, this.isActive})
      : super._();

  @override
  ApiApplicationsInner rebuild(
          void Function(ApiApplicationsInnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiApplicationsInnerBuilder toBuilder() =>
      new ApiApplicationsInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiApplicationsInner &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        isActive == other.isActive;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiApplicationsInner')
          ..add('id', id)
          ..add('name', name)
          ..add('type', type)
          ..add('isActive', isActive))
        .toString();
  }
}

class ApiApplicationsInnerBuilder
    implements Builder<ApiApplicationsInner, ApiApplicationsInnerBuilder> {
  _$ApiApplicationsInner? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  ApiApplicationsInnerBuilder() {
    ApiApplicationsInner._defaults(this);
  }

  ApiApplicationsInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _isActive = $v.isActive;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiApplicationsInner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiApplicationsInner;
  }

  @override
  void update(void Function(ApiApplicationsInnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiApplicationsInner build() => _build();

  _$ApiApplicationsInner _build() {
    final _$result = _$v ??
        new _$ApiApplicationsInner._(
            id: id, name: name, type: type, isActive: isActive);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
