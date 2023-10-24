// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replace_logout_redirect_urls_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReplaceLogoutRedirectURLsRequest
    extends ReplaceLogoutRedirectURLsRequest {
  @override
  final BuiltList<String>? urls;

  factory _$ReplaceLogoutRedirectURLsRequest(
          [void Function(ReplaceLogoutRedirectURLsRequestBuilder)? updates]) =>
      (new ReplaceLogoutRedirectURLsRequestBuilder()..update(updates))._build();

  _$ReplaceLogoutRedirectURLsRequest._({this.urls}) : super._();

  @override
  ReplaceLogoutRedirectURLsRequest rebuild(
          void Function(ReplaceLogoutRedirectURLsRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReplaceLogoutRedirectURLsRequestBuilder toBuilder() =>
      new ReplaceLogoutRedirectURLsRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReplaceLogoutRedirectURLsRequest && urls == other.urls;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, urls.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReplaceLogoutRedirectURLsRequest')
          ..add('urls', urls))
        .toString();
  }
}

class ReplaceLogoutRedirectURLsRequestBuilder
    implements
        Builder<ReplaceLogoutRedirectURLsRequest,
            ReplaceLogoutRedirectURLsRequestBuilder> {
  _$ReplaceLogoutRedirectURLsRequest? _$v;

  ListBuilder<String>? _urls;
  ListBuilder<String> get urls => _$this._urls ??= new ListBuilder<String>();
  set urls(ListBuilder<String>? urls) => _$this._urls = urls;

  ReplaceLogoutRedirectURLsRequestBuilder() {
    ReplaceLogoutRedirectURLsRequest._defaults(this);
  }

  ReplaceLogoutRedirectURLsRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _urls = $v.urls?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReplaceLogoutRedirectURLsRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReplaceLogoutRedirectURLsRequest;
  }

  @override
  void update(void Function(ReplaceLogoutRedirectURLsRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReplaceLogoutRedirectURLsRequest build() => _build();

  _$ReplaceLogoutRedirectURLsRequest _build() {
    _$ReplaceLogoutRedirectURLsRequest _$result;
    try {
      _$result =
          _$v ?? new _$ReplaceLogoutRedirectURLsRequest._(urls: _urls?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'urls';
        _urls?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ReplaceLogoutRedirectURLsRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
