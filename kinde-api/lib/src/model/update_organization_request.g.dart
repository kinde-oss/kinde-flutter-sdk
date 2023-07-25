// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_organization_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateOrganizationRequest extends UpdateOrganizationRequest {
  @override
  final String? name;
  @override
  final String? externalId;
  @override
  final String? backgroundColor;
  @override
  final String? buttonColor;
  @override
  final String? buttonTextColor;
  @override
  final String? linkColor;

  factory _$UpdateOrganizationRequest(
          [void Function(UpdateOrganizationRequestBuilder)? updates]) =>
      (new UpdateOrganizationRequestBuilder()..update(updates))._build();

  _$UpdateOrganizationRequest._(
      {this.name,
      this.externalId,
      this.backgroundColor,
      this.buttonColor,
      this.buttonTextColor,
      this.linkColor})
      : super._();

  @override
  UpdateOrganizationRequest rebuild(
          void Function(UpdateOrganizationRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateOrganizationRequestBuilder toBuilder() =>
      new UpdateOrganizationRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateOrganizationRequest &&
        name == other.name &&
        externalId == other.externalId &&
        backgroundColor == other.backgroundColor &&
        buttonColor == other.buttonColor &&
        buttonTextColor == other.buttonTextColor &&
        linkColor == other.linkColor;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, externalId.hashCode);
    _$hash = $jc(_$hash, backgroundColor.hashCode);
    _$hash = $jc(_$hash, buttonColor.hashCode);
    _$hash = $jc(_$hash, buttonTextColor.hashCode);
    _$hash = $jc(_$hash, linkColor.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateOrganizationRequest')
          ..add('name', name)
          ..add('externalId', externalId)
          ..add('backgroundColor', backgroundColor)
          ..add('buttonColor', buttonColor)
          ..add('buttonTextColor', buttonTextColor)
          ..add('linkColor', linkColor))
        .toString();
  }
}

class UpdateOrganizationRequestBuilder
    implements
        Builder<UpdateOrganizationRequest, UpdateOrganizationRequestBuilder> {
  _$UpdateOrganizationRequest? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _externalId;
  String? get externalId => _$this._externalId;
  set externalId(String? externalId) => _$this._externalId = externalId;

  String? _backgroundColor;
  String? get backgroundColor => _$this._backgroundColor;
  set backgroundColor(String? backgroundColor) =>
      _$this._backgroundColor = backgroundColor;

  String? _buttonColor;
  String? get buttonColor => _$this._buttonColor;
  set buttonColor(String? buttonColor) => _$this._buttonColor = buttonColor;

  String? _buttonTextColor;
  String? get buttonTextColor => _$this._buttonTextColor;
  set buttonTextColor(String? buttonTextColor) =>
      _$this._buttonTextColor = buttonTextColor;

  String? _linkColor;
  String? get linkColor => _$this._linkColor;
  set linkColor(String? linkColor) => _$this._linkColor = linkColor;

  UpdateOrganizationRequestBuilder() {
    UpdateOrganizationRequest._defaults(this);
  }

  UpdateOrganizationRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _externalId = $v.externalId;
      _backgroundColor = $v.backgroundColor;
      _buttonColor = $v.buttonColor;
      _buttonTextColor = $v.buttonTextColor;
      _linkColor = $v.linkColor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateOrganizationRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateOrganizationRequest;
  }

  @override
  void update(void Function(UpdateOrganizationRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateOrganizationRequest build() => _build();

  _$UpdateOrganizationRequest _build() {
    final _$result = _$v ??
        new _$UpdateOrganizationRequest._(
            name: name,
            externalId: externalId,
            backgroundColor: backgroundColor,
            buttonColor: buttonColor,
            buttonTextColor: buttonTextColor,
            linkColor: linkColor);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
