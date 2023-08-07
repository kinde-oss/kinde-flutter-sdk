// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_applications_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetApplicationsResponse extends GetApplicationsResponse {
  @override
  final String? code;
  @override
  final String? message;
  @override
  final BuiltList<Application>? organizations;
  @override
  final String? nextToken;

  factory _$GetApplicationsResponse(
          [void Function(GetApplicationsResponseBuilder)? updates]) =>
      (new GetApplicationsResponseBuilder()..update(updates))._build();

  _$GetApplicationsResponse._(
      {this.code, this.message, this.organizations, this.nextToken})
      : super._();

  @override
  GetApplicationsResponse rebuild(
          void Function(GetApplicationsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetApplicationsResponseBuilder toBuilder() =>
      new GetApplicationsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetApplicationsResponse &&
        code == other.code &&
        message == other.message &&
        organizations == other.organizations &&
        nextToken == other.nextToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, organizations.hashCode);
    _$hash = $jc(_$hash, nextToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetApplicationsResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('organizations', organizations)
          ..add('nextToken', nextToken))
        .toString();
  }
}

class GetApplicationsResponseBuilder
    implements
        Builder<GetApplicationsResponse, GetApplicationsResponseBuilder> {
  _$GetApplicationsResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<Application>? _organizations;
  ListBuilder<Application> get organizations =>
      _$this._organizations ??= new ListBuilder<Application>();
  set organizations(ListBuilder<Application>? organizations) =>
      _$this._organizations = organizations;

  String? _nextToken;
  String? get nextToken => _$this._nextToken;
  set nextToken(String? nextToken) => _$this._nextToken = nextToken;

  GetApplicationsResponseBuilder() {
    GetApplicationsResponse._defaults(this);
  }

  GetApplicationsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _organizations = $v.organizations?.toBuilder();
      _nextToken = $v.nextToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetApplicationsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetApplicationsResponse;
  }

  @override
  void update(void Function(GetApplicationsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetApplicationsResponse build() => _build();

  _$GetApplicationsResponse _build() {
    _$GetApplicationsResponse _$result;
    try {
      _$result = _$v ??
          new _$GetApplicationsResponse._(
              code: code,
              message: message,
              organizations: _organizations?.build(),
              nextToken: nextToken);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'organizations';
        _organizations?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetApplicationsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
