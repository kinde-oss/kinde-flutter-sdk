// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_application_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateApplicationResponse extends CreateApplicationResponse {
  @override
  final String? code;
  @override
  final String? message;
  @override
  final CreateApplicationResponseApplication? application;

  factory _$CreateApplicationResponse(
          [void Function(CreateApplicationResponseBuilder)? updates]) =>
      (new CreateApplicationResponseBuilder()..update(updates))._build();

  _$CreateApplicationResponse._({this.code, this.message, this.application})
      : super._();

  @override
  CreateApplicationResponse rebuild(
          void Function(CreateApplicationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateApplicationResponseBuilder toBuilder() =>
      new CreateApplicationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateApplicationResponse &&
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
    return (newBuiltValueToStringHelper(r'CreateApplicationResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('application', application))
        .toString();
  }
}

class CreateApplicationResponseBuilder
    implements
        Builder<CreateApplicationResponse, CreateApplicationResponseBuilder> {
  _$CreateApplicationResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  CreateApplicationResponseApplicationBuilder? _application;
  CreateApplicationResponseApplicationBuilder get application =>
      _$this._application ??= new CreateApplicationResponseApplicationBuilder();
  set application(CreateApplicationResponseApplicationBuilder? application) =>
      _$this._application = application;

  CreateApplicationResponseBuilder() {
    CreateApplicationResponse._defaults(this);
  }

  CreateApplicationResponseBuilder get _$this {
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
  void replace(CreateApplicationResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateApplicationResponse;
  }

  @override
  void update(void Function(CreateApplicationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateApplicationResponse build() => _build();

  _$CreateApplicationResponse _build() {
    _$CreateApplicationResponse _$result;
    try {
      _$result = _$v ??
          new _$CreateApplicationResponse._(
              code: code, message: message, application: _application?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'application';
        _application?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreateApplicationResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
