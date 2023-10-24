// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_organization_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CreateOrganizationRequestFeatureFlagsEnum
    _$createOrganizationRequestFeatureFlagsEnum_str =
    const CreateOrganizationRequestFeatureFlagsEnum._('str');
const CreateOrganizationRequestFeatureFlagsEnum
    _$createOrganizationRequestFeatureFlagsEnum_int_ =
    const CreateOrganizationRequestFeatureFlagsEnum._('int_');
const CreateOrganizationRequestFeatureFlagsEnum
    _$createOrganizationRequestFeatureFlagsEnum_bool_ =
    const CreateOrganizationRequestFeatureFlagsEnum._('bool_');

CreateOrganizationRequestFeatureFlagsEnum
    _$createOrganizationRequestFeatureFlagsEnumValueOf(String name) {
  switch (name) {
    case 'str':
      return _$createOrganizationRequestFeatureFlagsEnum_str;
    case 'int_':
      return _$createOrganizationRequestFeatureFlagsEnum_int_;
    case 'bool_':
      return _$createOrganizationRequestFeatureFlagsEnum_bool_;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CreateOrganizationRequestFeatureFlagsEnum>
    _$createOrganizationRequestFeatureFlagsEnumValues = new BuiltSet<
        CreateOrganizationRequestFeatureFlagsEnum>(const <CreateOrganizationRequestFeatureFlagsEnum>[
  _$createOrganizationRequestFeatureFlagsEnum_str,
  _$createOrganizationRequestFeatureFlagsEnum_int_,
  _$createOrganizationRequestFeatureFlagsEnum_bool_,
]);

Serializer<CreateOrganizationRequestFeatureFlagsEnum>
    _$createOrganizationRequestFeatureFlagsEnumSerializer =
    new _$CreateOrganizationRequestFeatureFlagsEnumSerializer();

class _$CreateOrganizationRequestFeatureFlagsEnumSerializer
    implements PrimitiveSerializer<CreateOrganizationRequestFeatureFlagsEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'str': 'str',
    'int_': 'int',
    'bool_': 'bool',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'str': 'str',
    'int': 'int_',
    'bool': 'bool_',
  };

  @override
  final Iterable<Type> types = const <Type>[
    CreateOrganizationRequestFeatureFlagsEnum
  ];
  @override
  final String wireName = 'CreateOrganizationRequestFeatureFlagsEnum';

  @override
  Object serialize(Serializers serializers,
          CreateOrganizationRequestFeatureFlagsEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CreateOrganizationRequestFeatureFlagsEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CreateOrganizationRequestFeatureFlagsEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$CreateOrganizationRequest extends CreateOrganizationRequest {
  @override
  final String? name;
  @override
  final BuiltMap<String, CreateOrganizationRequestFeatureFlagsEnum>?
      featureFlags;
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

  factory _$CreateOrganizationRequest(
          [void Function(CreateOrganizationRequestBuilder)? updates]) =>
      (new CreateOrganizationRequestBuilder()..update(updates))._build();

  _$CreateOrganizationRequest._(
      {this.name,
      this.featureFlags,
      this.externalId,
      this.backgroundColor,
      this.buttonColor,
      this.buttonTextColor,
      this.linkColor})
      : super._();

  @override
  CreateOrganizationRequest rebuild(
          void Function(CreateOrganizationRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateOrganizationRequestBuilder toBuilder() =>
      new CreateOrganizationRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateOrganizationRequest &&
        name == other.name &&
        featureFlags == other.featureFlags &&
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
    _$hash = $jc(_$hash, featureFlags.hashCode);
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
    return (newBuiltValueToStringHelper(r'CreateOrganizationRequest')
          ..add('name', name)
          ..add('featureFlags', featureFlags)
          ..add('externalId', externalId)
          ..add('backgroundColor', backgroundColor)
          ..add('buttonColor', buttonColor)
          ..add('buttonTextColor', buttonTextColor)
          ..add('linkColor', linkColor))
        .toString();
  }
}

class CreateOrganizationRequestBuilder
    implements
        Builder<CreateOrganizationRequest, CreateOrganizationRequestBuilder> {
  _$CreateOrganizationRequest? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  MapBuilder<String, CreateOrganizationRequestFeatureFlagsEnum>? _featureFlags;
  MapBuilder<String, CreateOrganizationRequestFeatureFlagsEnum>
      get featureFlags => _$this._featureFlags ??=
          new MapBuilder<String, CreateOrganizationRequestFeatureFlagsEnum>();
  set featureFlags(
          MapBuilder<String, CreateOrganizationRequestFeatureFlagsEnum>?
              featureFlags) =>
      _$this._featureFlags = featureFlags;

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

  CreateOrganizationRequestBuilder() {
    CreateOrganizationRequest._defaults(this);
  }

  CreateOrganizationRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _featureFlags = $v.featureFlags?.toBuilder();
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
  void replace(CreateOrganizationRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateOrganizationRequest;
  }

  @override
  void update(void Function(CreateOrganizationRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateOrganizationRequest build() => _build();

  _$CreateOrganizationRequest _build() {
    _$CreateOrganizationRequest _$result;
    try {
      _$result = _$v ??
          new _$CreateOrganizationRequest._(
              name: name,
              featureFlags: _featureFlags?.build(),
              externalId: externalId,
              backgroundColor: backgroundColor,
              buttonColor: buttonColor,
              buttonTextColor: buttonTextColor,
              linkColor: linkColor);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'featureFlags';
        _featureFlags?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreateOrganizationRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
