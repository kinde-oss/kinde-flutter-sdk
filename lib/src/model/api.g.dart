// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Api extends Api {
  @override
  final String? id;
  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? message;
  @override
  final String? audience;
  @override
  final BuiltList<ApiApplicationsInner>? applications;

  factory _$Api([void Function(ApiBuilder)? updates]) =>
      (new ApiBuilder()..update(updates))._build();

  _$Api._(
      {this.id,
      this.code,
      this.name,
      this.message,
      this.audience,
      this.applications})
      : super._();

  @override
  Api rebuild(void Function(ApiBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiBuilder toBuilder() => new ApiBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Api &&
        id == other.id &&
        code == other.code &&
        name == other.name &&
        message == other.message &&
        audience == other.audience &&
        applications == other.applications;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, audience.hashCode);
    _$hash = $jc(_$hash, applications.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Api')
          ..add('id', id)
          ..add('code', code)
          ..add('name', name)
          ..add('message', message)
          ..add('audience', audience)
          ..add('applications', applications))
        .toString();
  }
}

class ApiBuilder implements Builder<Api, ApiBuilder> {
  _$Api? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _audience;
  String? get audience => _$this._audience;
  set audience(String? audience) => _$this._audience = audience;

  ListBuilder<ApiApplicationsInner>? _applications;
  ListBuilder<ApiApplicationsInner> get applications =>
      _$this._applications ??= new ListBuilder<ApiApplicationsInner>();
  set applications(ListBuilder<ApiApplicationsInner>? applications) =>
      _$this._applications = applications;

  ApiBuilder() {
    Api._defaults(this);
  }

  ApiBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _code = $v.code;
      _name = $v.name;
      _message = $v.message;
      _audience = $v.audience;
      _applications = $v.applications?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Api other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Api;
  }

  @override
  void update(void Function(ApiBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Api build() => _build();

  _$Api _build() {
    _$Api _$result;
    try {
      _$result = _$v ??
          new _$Api._(
              id: id,
              code: code,
              name: name,
              message: message,
              audience: audience,
              applications: _applications?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'applications';
        _applications?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Api', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
