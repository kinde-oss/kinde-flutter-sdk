// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_application_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateApplicationRequest extends UpdateApplicationRequest {
  @override
  final String? name;
  @override
  final String? languageKey;
  @override
  final BuiltList<String>? logoutUris;
  @override
  final BuiltList<String>? redirectUris;

  factory _$UpdateApplicationRequest(
          [void Function(UpdateApplicationRequestBuilder)? updates]) =>
      (new UpdateApplicationRequestBuilder()..update(updates))._build();

  _$UpdateApplicationRequest._(
      {this.name, this.languageKey, this.logoutUris, this.redirectUris})
      : super._();

  @override
  UpdateApplicationRequest rebuild(
          void Function(UpdateApplicationRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateApplicationRequestBuilder toBuilder() =>
      new UpdateApplicationRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateApplicationRequest &&
        name == other.name &&
        languageKey == other.languageKey &&
        logoutUris == other.logoutUris &&
        redirectUris == other.redirectUris;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, languageKey.hashCode);
    _$hash = $jc(_$hash, logoutUris.hashCode);
    _$hash = $jc(_$hash, redirectUris.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateApplicationRequest')
          ..add('name', name)
          ..add('languageKey', languageKey)
          ..add('logoutUris', logoutUris)
          ..add('redirectUris', redirectUris))
        .toString();
  }
}

class UpdateApplicationRequestBuilder
    implements
        Builder<UpdateApplicationRequest, UpdateApplicationRequestBuilder> {
  _$UpdateApplicationRequest? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _languageKey;
  String? get languageKey => _$this._languageKey;
  set languageKey(String? languageKey) => _$this._languageKey = languageKey;

  ListBuilder<String>? _logoutUris;
  ListBuilder<String> get logoutUris =>
      _$this._logoutUris ??= new ListBuilder<String>();
  set logoutUris(ListBuilder<String>? logoutUris) =>
      _$this._logoutUris = logoutUris;

  ListBuilder<String>? _redirectUris;
  ListBuilder<String> get redirectUris =>
      _$this._redirectUris ??= new ListBuilder<String>();
  set redirectUris(ListBuilder<String>? redirectUris) =>
      _$this._redirectUris = redirectUris;

  UpdateApplicationRequestBuilder() {
    UpdateApplicationRequest._defaults(this);
  }

  UpdateApplicationRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _languageKey = $v.languageKey;
      _logoutUris = $v.logoutUris?.toBuilder();
      _redirectUris = $v.redirectUris?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateApplicationRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateApplicationRequest;
  }

  @override
  void update(void Function(UpdateApplicationRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateApplicationRequest build() => _build();

  _$UpdateApplicationRequest _build() {
    _$UpdateApplicationRequest _$result;
    try {
      _$result = _$v ??
          new _$UpdateApplicationRequest._(
              name: name,
              languageKey: languageKey,
              logoutUris: _logoutUris?.build(),
              redirectUris: _redirectUris?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'logoutUris';
        _logoutUris?.build();
        _$failedField = 'redirectUris';
        _redirectUris?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateApplicationRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
