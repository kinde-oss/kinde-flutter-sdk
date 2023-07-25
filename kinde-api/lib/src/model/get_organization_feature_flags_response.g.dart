// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_organization_feature_flags_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetOrganizationFeatureFlagsResponse
    extends GetOrganizationFeatureFlagsResponse {
  @override
  final String? code;
  @override
  final String? message;
  @override
  final BuiltMap<String, GetOrganizationFeatureFlagsResponseFeatureFlagsValue>?
      featureFlags;

  factory _$GetOrganizationFeatureFlagsResponse(
          [void Function(GetOrganizationFeatureFlagsResponseBuilder)?
              updates]) =>
      (new GetOrganizationFeatureFlagsResponseBuilder()..update(updates))
          ._build();

  _$GetOrganizationFeatureFlagsResponse._(
      {this.code, this.message, this.featureFlags})
      : super._();

  @override
  GetOrganizationFeatureFlagsResponse rebuild(
          void Function(GetOrganizationFeatureFlagsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetOrganizationFeatureFlagsResponseBuilder toBuilder() =>
      new GetOrganizationFeatureFlagsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetOrganizationFeatureFlagsResponse &&
        code == other.code &&
        message == other.message &&
        featureFlags == other.featureFlags;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, featureFlags.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetOrganizationFeatureFlagsResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('featureFlags', featureFlags))
        .toString();
  }
}

class GetOrganizationFeatureFlagsResponseBuilder
    implements
        Builder<GetOrganizationFeatureFlagsResponse,
            GetOrganizationFeatureFlagsResponseBuilder> {
  _$GetOrganizationFeatureFlagsResponse? _$v;

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

  GetOrganizationFeatureFlagsResponseBuilder() {
    GetOrganizationFeatureFlagsResponse._defaults(this);
  }

  GetOrganizationFeatureFlagsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _featureFlags = $v.featureFlags?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetOrganizationFeatureFlagsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetOrganizationFeatureFlagsResponse;
  }

  @override
  void update(
      void Function(GetOrganizationFeatureFlagsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetOrganizationFeatureFlagsResponse build() => _build();

  _$GetOrganizationFeatureFlagsResponse _build() {
    _$GetOrganizationFeatureFlagsResponse _$result;
    try {
      _$result = _$v ??
          new _$GetOrganizationFeatureFlagsResponse._(
              code: code,
              message: message,
              featureFlags: _featureFlags?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'featureFlags';
        _featureFlags?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetOrganizationFeatureFlagsResponse',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
