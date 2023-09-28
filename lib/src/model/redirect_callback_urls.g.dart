// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redirect_callback_urls.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RedirectCallbackUrls extends RedirectCallbackUrls {
  @override
  final BuiltList<String>? redirectUrls;

  factory _$RedirectCallbackUrls(
          [void Function(RedirectCallbackUrlsBuilder)? updates]) =>
      (new RedirectCallbackUrlsBuilder()..update(updates))._build();

  _$RedirectCallbackUrls._({this.redirectUrls}) : super._();

  @override
  RedirectCallbackUrls rebuild(
          void Function(RedirectCallbackUrlsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RedirectCallbackUrlsBuilder toBuilder() =>
      new RedirectCallbackUrlsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RedirectCallbackUrls && redirectUrls == other.redirectUrls;
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
    return (newBuiltValueToStringHelper(r'RedirectCallbackUrls')
          ..add('redirectUrls', redirectUrls))
        .toString();
  }
}

class RedirectCallbackUrlsBuilder
    implements Builder<RedirectCallbackUrls, RedirectCallbackUrlsBuilder> {
  _$RedirectCallbackUrls? _$v;

  ListBuilder<String>? _redirectUrls;
  ListBuilder<String> get redirectUrls =>
      _$this._redirectUrls ??= new ListBuilder<String>();
  set redirectUrls(ListBuilder<String>? redirectUrls) =>
      _$this._redirectUrls = redirectUrls;

  RedirectCallbackUrlsBuilder() {
    RedirectCallbackUrls._defaults(this);
  }

  RedirectCallbackUrlsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _redirectUrls = $v.redirectUrls?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RedirectCallbackUrls other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RedirectCallbackUrls;
  }

  @override
  void update(void Function(RedirectCallbackUrlsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RedirectCallbackUrls build() => _build();

  _$RedirectCallbackUrls _build() {
    _$RedirectCallbackUrls _$result;
    try {
      _$result = _$v ??
          new _$RedirectCallbackUrls._(redirectUrls: _redirectUrls?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'redirectUrls';
        _redirectUrls?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RedirectCallbackUrls', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
