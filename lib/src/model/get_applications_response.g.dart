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
  final BuiltList<Applications>? applications;
  @override
  final String? nextToken;

  factory _$GetApplicationsResponse(
          [void Function(GetApplicationsResponseBuilder)? updates]) =>
      (new GetApplicationsResponseBuilder()..update(updates))._build();

  _$GetApplicationsResponse._(
      {this.code, this.message, this.applications, this.nextToken})
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
        applications == other.applications &&
        nextToken == other.nextToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, applications.hashCode);
    _$hash = $jc(_$hash, nextToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetApplicationsResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('applications', applications)
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

  ListBuilder<Applications>? _applications;
  ListBuilder<Applications> get applications =>
      _$this._applications ??= new ListBuilder<Applications>();
  set applications(ListBuilder<Applications>? applications) =>
      _$this._applications = applications;

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
      _applications = $v.applications?.toBuilder();
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
              applications: _applications?.build(),
              nextToken: nextToken);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'applications';
        _applications?.build();
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
