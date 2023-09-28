// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_redirect_urls.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LogoutRedirectUrls extends LogoutRedirectUrls {
  @override
  final BuiltList<String>? redirectUrls;

  factory _$LogoutRedirectUrls(
          [void Function(LogoutRedirectUrlsBuilder)? updates]) =>
      (new LogoutRedirectUrlsBuilder()..update(updates))._build();

  _$LogoutRedirectUrls._({this.redirectUrls}) : super._();

  @override
  LogoutRedirectUrls rebuild(
          void Function(LogoutRedirectUrlsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogoutRedirectUrlsBuilder toBuilder() =>
      new LogoutRedirectUrlsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogoutRedirectUrls && redirectUrls == other.redirectUrls;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, redirectUrls.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LogoutRedirectUrls')
          ..add('redirectUrls', redirectUrls))
        .toString();
  }
}

class LogoutRedirectUrlsBuilder
    implements Builder<LogoutRedirectUrls, LogoutRedirectUrlsBuilder> {
  _$LogoutRedirectUrls? _$v;

  ListBuilder<String>? _redirectUrls;
  ListBuilder<String> get redirectUrls =>
      _$this._redirectUrls ??= new ListBuilder<String>();
  set redirectUrls(ListBuilder<String>? redirectUrls) =>
      _$this._redirectUrls = redirectUrls;

  LogoutRedirectUrlsBuilder() {
    LogoutRedirectUrls._defaults(this);
  }

  LogoutRedirectUrlsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _redirectUrls = $v.redirectUrls?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LogoutRedirectUrls other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogoutRedirectUrls;
  }

  @override
  void update(void Function(LogoutRedirectUrlsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogoutRedirectUrls build() => _build();

  _$LogoutRedirectUrls _build() {
    _$LogoutRedirectUrls _$result;
    try {
      _$result = _$v ??
          new _$LogoutRedirectUrls._(redirectUrls: _redirectUrls?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'redirectUrls';
        _redirectUrls?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LogoutRedirectUrls', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
