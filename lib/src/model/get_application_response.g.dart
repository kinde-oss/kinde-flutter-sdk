// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_application_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetApplicationResponse extends GetApplicationResponse {
  @override
  final String? code;
  @override
  final String? message;
  @override
  final GetApplicationResponseApplication? application;

  factory _$GetApplicationResponse(
          [void Function(GetApplicationResponseBuilder)? updates]) =>
      (new GetApplicationResponseBuilder()..update(updates))._build();

  _$GetApplicationResponse._({this.code, this.message, this.application})
      : super._();

  @override
  GetApplicationResponse rebuild(
          void Function(GetApplicationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetApplicationResponseBuilder toBuilder() =>
      new GetApplicationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetApplicationResponse &&
        code == other.code &&
        message == other.message &&
        application == other.application;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, application.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetApplicationResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('application', application))
        .toString();
  }
}

class GetApplicationResponseBuilder
    implements Builder<GetApplicationResponse, GetApplicationResponseBuilder> {
  _$GetApplicationResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  GetApplicationResponseApplicationBuilder? _application;
  GetApplicationResponseApplicationBuilder get application =>
      _$this._application ??= new GetApplicationResponseApplicationBuilder();
  set application(GetApplicationResponseApplicationBuilder? application) =>
      _$this._application = application;

  GetApplicationResponseBuilder() {
    GetApplicationResponse._defaults(this);
  }

  GetApplicationResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _application = $v.application?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetApplicationResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetApplicationResponse;
  }

  @override
  void update(void Function(GetApplicationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetApplicationResponse build() => _build();

  _$GetApplicationResponse _build() {
    _$GetApplicationResponse _$result;
    try {
      _$result = _$v ??
          new _$GetApplicationResponse._(
              code: code, message: message, application: _application?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'application';
        _application?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetApplicationResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
