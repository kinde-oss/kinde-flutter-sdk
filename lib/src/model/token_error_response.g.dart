// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_error_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TokenErrorResponse extends TokenErrorResponse {
  @override
  final String? error;
  @override
  final String? errorDescription;

  factory _$TokenErrorResponse(
          [void Function(TokenErrorResponseBuilder)? updates]) =>
      (new TokenErrorResponseBuilder()..update(updates))._build();

  _$TokenErrorResponse._({this.error, this.errorDescription}) : super._();

  @override
  TokenErrorResponse rebuild(
          void Function(TokenErrorResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TokenErrorResponseBuilder toBuilder() =>
      new TokenErrorResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TokenErrorResponse &&
        error == other.error &&
        errorDescription == other.errorDescription;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, errorDescription.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TokenErrorResponse')
          ..add('error', error)
          ..add('errorDescription', errorDescription))
        .toString();
  }
}

class TokenErrorResponseBuilder
    implements Builder<TokenErrorResponse, TokenErrorResponseBuilder> {
  _$TokenErrorResponse? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  String? _errorDescription;
  String? get errorDescription => _$this._errorDescription;
  set errorDescription(String? errorDescription) =>
      _$this._errorDescription = errorDescription;

  TokenErrorResponseBuilder() {
    TokenErrorResponse._defaults(this);
  }

  TokenErrorResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _errorDescription = $v.errorDescription;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TokenErrorResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TokenErrorResponse;
  }

  @override
  void update(void Function(TokenErrorResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TokenErrorResponse build() => _build();

  _$TokenErrorResponse _build() {
    final _$result = _$v ??
        new _$TokenErrorResponse._(
            error: error, errorDescription: errorDescription);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
