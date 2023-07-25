// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Application extends Application {
  @override
  final String? appId;
  @override
  final String? name;

  factory _$Application([void Function(ApplicationBuilder)? updates]) =>
      (new ApplicationBuilder()..update(updates))._build();

  _$Application._({this.appId, this.name}) : super._();

  @override
  Application rebuild(void Function(ApplicationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApplicationBuilder toBuilder() => new ApplicationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Application && appId == other.appId && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, appId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Application')
          ..add('appId', appId)
          ..add('name', name))
        .toString();
  }
}

class ApplicationBuilder implements Builder<Application, ApplicationBuilder> {
  _$Application? _$v;

  String? _appId;
  String? get appId => _$this._appId;
  set appId(String? appId) => _$this._appId = appId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ApplicationBuilder() {
    Application._defaults(this);
  }

  ApplicationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appId = $v.appId;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Application other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Application;
  }

  @override
  void update(void Function(ApplicationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Application build() => _build();

  _$Application _build() {
    final _$result = _$v ?? new _$Application._(appId: appId, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
