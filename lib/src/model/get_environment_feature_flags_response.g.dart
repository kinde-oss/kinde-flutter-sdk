// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_environment_feature_flags_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetEnvironmentFeatureFlagsResponse
    extends GetEnvironmentFeatureFlagsResponse {
  @override
  final String? code;
  @override
  final String? message;
  @override
  final BuiltMap<String, GetOrganizationFeatureFlagsResponseFeatureFlagsValue>?
      featureFlags;
  @override
  final String? nextToken;

  factory _$GetEnvironmentFeatureFlagsResponse(
          [void Function(GetEnvironmentFeatureFlagsResponseBuilder)?
              updates]) =>
      (new GetEnvironmentFeatureFlagsResponseBuilder()..update(updates))
          ._build();

  _$GetEnvironmentFeatureFlagsResponse._(
      {this.code, this.message, this.featureFlags, this.nextToken})
      : super._();

  @override
  GetEnvironmentFeatureFlagsResponse rebuild(
          void Function(GetEnvironmentFeatureFlagsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetEnvironmentFeatureFlagsResponseBuilder toBuilder() =>
      new GetEnvironmentFeatureFlagsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetEnvironmentFeatureFlagsResponse &&
        code == other.code &&
        message == other.message &&
        featureFlags == other.featureFlags &&
        nextToken == other.nextToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, featureFlags.hashCode);
    _$hash = $jc(_$hash, nextToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetEnvironmentFeatureFlagsResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('featureFlags', featureFlags)
          ..add('nextToken', nextToken))
        .toString();
  }
}

class GetEnvironmentFeatureFlagsResponseBuilder
    implements
        Builder<GetEnvironmentFeatureFlagsResponse,
            GetEnvironmentFeatureFlagsResponseBuilder> {
  _$GetEnvironmentFeatureFlagsResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  MapBuilder<String, GetOrganizationFeatureFlagsResponseFeatureFlagsValue>?
      _featureFlags;
  MapBuilder<String, GetOrganizationFeatureFlagsResponseFeatureFlagsValue>
      get featureFlags => _$this._featureFlags ??= new MapBuilder<String,
          GetOrganizationFeatureFlagsResponseFeatureFlagsValue>();
  set featureFlags(
          MapBuilder<String,
                  GetOrganizationFeatureFlagsResponseFeatureFlagsValue>?
              featureFlags) =>
      _$this._featureFlags = featureFlags;

  String? _nextToken;
  String? get nextToken => _$this._nextToken;
  set nextToken(String? nextToken) => _$this._nextToken = nextToken;

  GetEnvironmentFeatureFlagsResponseBuilder() {
    GetEnvironmentFeatureFlagsResponse._defaults(this);
  }

  GetEnvironmentFeatureFlagsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _featureFlags = $v.featureFlags?.toBuilder();
      _nextToken = $v.nextToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetEnvironmentFeatureFlagsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetEnvironmentFeatureFlagsResponse;
  }

  @override
  void update(
      void Function(GetEnvironmentFeatureFlagsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetEnvironmentFeatureFlagsResponse build() => _build();

  _$GetEnvironmentFeatureFlagsResponse _build() {
    _$GetEnvironmentFeatureFlagsResponse _$result;
    try {
      _$result = _$v ??
          new _$GetEnvironmentFeatureFlagsResponse._(
              code: code,
              message: message,
              featureFlags: _featureFlags?.build(),
              nextToken: nextToken);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'featureFlags';
        _featureFlags?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetEnvironmentFeatureFlagsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
