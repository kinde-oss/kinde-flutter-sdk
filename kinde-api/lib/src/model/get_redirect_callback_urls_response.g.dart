// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_redirect_callback_urls_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetRedirectCallbackUrlsResponse
    extends GetRedirectCallbackUrlsResponse {
  @override
  final BuiltList<RedirectCallbackUrls>? redirectUrls;

  factory _$GetRedirectCallbackUrlsResponse(
          [void Function(GetRedirectCallbackUrlsResponseBuilder)? updates]) =>
      (new GetRedirectCallbackUrlsResponseBuilder()..update(updates))._build();

  _$GetRedirectCallbackUrlsResponse._({this.redirectUrls}) : super._();

  @override
  GetRedirectCallbackUrlsResponse rebuild(
          void Function(GetRedirectCallbackUrlsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetRedirectCallbackUrlsResponseBuilder toBuilder() =>
      new GetRedirectCallbackUrlsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetRedirectCallbackUrlsResponse &&
        redirectUrls == other.redirectUrls;
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
    return (newBuiltValueToStringHelper(r'GetRedirectCallbackUrlsResponse')
          ..add('redirectUrls', redirectUrls))
        .toString();
  }
}

class GetRedirectCallbackUrlsResponseBuilder
    implements
        Builder<GetRedirectCallbackUrlsResponse,
            GetRedirectCallbackUrlsResponseBuilder> {
  _$GetRedirectCallbackUrlsResponse? _$v;

  ListBuilder<RedirectCallbackUrls>? _redirectUrls;
  ListBuilder<RedirectCallbackUrls> get redirectUrls =>
      _$this._redirectUrls ??= new ListBuilder<RedirectCallbackUrls>();
  set redirectUrls(ListBuilder<RedirectCallbackUrls>? redirectUrls) =>
      _$this._redirectUrls = redirectUrls;

  GetRedirectCallbackUrlsResponseBuilder() {
    GetRedirectCallbackUrlsResponse._defaults(this);
  }

  GetRedirectCallbackUrlsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _redirectUrls = $v.redirectUrls?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetRedirectCallbackUrlsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetRedirectCallbackUrlsResponse;
  }

  @override
  void update(void Function(GetRedirectCallbackUrlsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetRedirectCallbackUrlsResponse build() => _build();

  _$GetRedirectCallbackUrlsResponse _build() {
    _$GetRedirectCallbackUrlsResponse _$result;
    try {
      _$result = _$v ??
          new _$GetRedirectCallbackUrlsResponse._(
              redirectUrls: _redirectUrls?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'redirectUrls';
        _redirectUrls?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetRedirectCallbackUrlsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
