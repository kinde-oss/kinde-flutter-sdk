// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ApiResult extends ApiResult {
  @override
  final String? result;

  factory _$ApiResult([void Function(ApiResultBuilder)? updates]) =>
      (new ApiResultBuilder()..update(updates))._build();

  _$ApiResult._({this.result}) : super._();

  @override
  ApiResult rebuild(void Function(ApiResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResultBuilder toBuilder() => new ApiResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResult && result == other.result;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, result.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ApiResult')..add('result', result))
        .toString();
  }
}

class ApiResultBuilder implements Builder<ApiResult, ApiResultBuilder> {
  _$ApiResult? _$v;

  String? _result;
  String? get result => _$this._result;
  set result(String? result) => _$this._result = result;

  ApiResultBuilder() {
    ApiResult._defaults(this);
  }

  ApiResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _result = $v.result;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiResult;
  }

  @override
  void update(void Function(ApiResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiResult build() => _build();

  _$ApiResult _build() {
    final _$result = _$v ?? new _$ApiResult._(result: result);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
