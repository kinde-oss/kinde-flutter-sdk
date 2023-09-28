// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applications.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Applications extends Applications {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? type;

  factory _$Applications([void Function(ApplicationsBuilder)? updates]) =>
      (new ApplicationsBuilder()..update(updates))._build();

  _$Applications._({this.id, this.name, this.type}) : super._();

  @override
  Applications rebuild(void Function(ApplicationsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApplicationsBuilder toBuilder() => new ApplicationsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Applications &&
        id == other.id &&
        name == other.name &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Applications')
          ..add('id', id)
          ..add('name', name)
          ..add('type', type))
        .toString();
  }
}

class ApplicationsBuilder
    implements Builder<Applications, ApplicationsBuilder> {
  _$Applications? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  ApplicationsBuilder() {
    Applications._defaults(this);
  }

  ApplicationsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Applications other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Applications;
  }

  @override
  void update(void Function(ApplicationsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Applications build() => _build();

  _$Applications _build() {
    final _$result =
        _$v ?? new _$Applications._(id: id, name: name, type: type);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
