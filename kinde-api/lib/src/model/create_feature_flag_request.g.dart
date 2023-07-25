// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_feature_flag_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CreateFeatureFlagRequestTypeEnum _$createFeatureFlagRequestTypeEnum_str =
    const CreateFeatureFlagRequestTypeEnum._('str');
const CreateFeatureFlagRequestTypeEnum _$createFeatureFlagRequestTypeEnum_int_ =
    const CreateFeatureFlagRequestTypeEnum._('int_');
const CreateFeatureFlagRequestTypeEnum
    _$createFeatureFlagRequestTypeEnum_bool_ =
    const CreateFeatureFlagRequestTypeEnum._('bool_');

CreateFeatureFlagRequestTypeEnum _$createFeatureFlagRequestTypeEnumValueOf(
    String name) {
  switch (name) {
    case 'str':
      return _$createFeatureFlagRequestTypeEnum_str;
    case 'int_':
      return _$createFeatureFlagRequestTypeEnum_int_;
    case 'bool_':
      return _$createFeatureFlagRequestTypeEnum_bool_;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CreateFeatureFlagRequestTypeEnum>
    _$createFeatureFlagRequestTypeEnumValues = new BuiltSet<
        CreateFeatureFlagRequestTypeEnum>(const <CreateFeatureFlagRequestTypeEnum>[
  _$createFeatureFlagRequestTypeEnum_str,
  _$createFeatureFlagRequestTypeEnum_int_,
  _$createFeatureFlagRequestTypeEnum_bool_,
]);

const CreateFeatureFlagRequestAllowOverrideLevelEnum
    _$createFeatureFlagRequestAllowOverrideLevelEnum_env =
    const CreateFeatureFlagRequestAllowOverrideLevelEnum._('env');
const CreateFeatureFlagRequestAllowOverrideLevelEnum
    _$createFeatureFlagRequestAllowOverrideLevelEnum_org =
    const CreateFeatureFlagRequestAllowOverrideLevelEnum._('org');

CreateFeatureFlagRequestAllowOverrideLevelEnum
    _$createFeatureFlagRequestAllowOverrideLevelEnumValueOf(String name) {
  switch (name) {
    case 'env':
      return _$createFeatureFlagRequestAllowOverrideLevelEnum_env;
    case 'org':
      return _$createFeatureFlagRequestAllowOverrideLevelEnum_org;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CreateFeatureFlagRequestAllowOverrideLevelEnum>
    _$createFeatureFlagRequestAllowOverrideLevelEnumValues = new BuiltSet<
        CreateFeatureFlagRequestAllowOverrideLevelEnum>(const <CreateFeatureFlagRequestAllowOverrideLevelEnum>[
  _$createFeatureFlagRequestAllowOverrideLevelEnum_env,
  _$createFeatureFlagRequestAllowOverrideLevelEnum_org,
]);

Serializer<CreateFeatureFlagRequestTypeEnum>
    _$createFeatureFlagRequestTypeEnumSerializer =
    new _$CreateFeatureFlagRequestTypeEnumSerializer();
Serializer<CreateFeatureFlagRequestAllowOverrideLevelEnum>
    _$createFeatureFlagRequestAllowOverrideLevelEnumSerializer =
    new _$CreateFeatureFlagRequestAllowOverrideLevelEnumSerializer();

class _$CreateFeatureFlagRequestTypeEnumSerializer
    implements PrimitiveSerializer<CreateFeatureFlagRequestTypeEnum> {
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
  final Iterable<Type> types = const <Type>[CreateFeatureFlagRequestTypeEnum];
  @override
  final String wireName = 'CreateFeatureFlagRequestTypeEnum';

  @override
  Object serialize(
          Serializers serializers, CreateFeatureFlagRequestTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CreateFeatureFlagRequestTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CreateFeatureFlagRequestTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$CreateFeatureFlagRequestAllowOverrideLevelEnumSerializer
    implements
        PrimitiveSerializer<CreateFeatureFlagRequestAllowOverrideLevelEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'env': 'env',
    'org': 'org',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'env': 'env',
    'org': 'org',
  };

  @override
  final Iterable<Type> types = const <Type>[
    CreateFeatureFlagRequestAllowOverrideLevelEnum
  ];
  @override
  final String wireName = 'CreateFeatureFlagRequestAllowOverrideLevelEnum';

  @override
  Object serialize(Serializers serializers,
          CreateFeatureFlagRequestAllowOverrideLevelEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CreateFeatureFlagRequestAllowOverrideLevelEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CreateFeatureFlagRequestAllowOverrideLevelEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$CreateFeatureFlagRequest extends CreateFeatureFlagRequest {
  @override
  final String name;
  @override
  final String? description;
  @override
  final String key;
  @override
  final CreateFeatureFlagRequestTypeEnum type;
  @override
  final CreateFeatureFlagRequestAllowOverrideLevelEnum? allowOverrideLevel;
  @override
  final String defaultValue;

  factory _$CreateFeatureFlagRequest(
          [void Function(CreateFeatureFlagRequestBuilder)? updates]) =>
      (new CreateFeatureFlagRequestBuilder()..update(updates))._build();

  _$CreateFeatureFlagRequest._(
      {required this.name,
      this.description,
      required this.key,
      required this.type,
      this.allowOverrideLevel,
      required this.defaultValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, r'CreateFeatureFlagRequest', 'name');
    BuiltValueNullFieldError.checkNotNull(
        key, r'CreateFeatureFlagRequest', 'key');
    BuiltValueNullFieldError.checkNotNull(
        type, r'CreateFeatureFlagRequest', 'type');
    BuiltValueNullFieldError.checkNotNull(
        defaultValue, r'CreateFeatureFlagRequest', 'defaultValue');
  }

  @override
  CreateFeatureFlagRequest rebuild(
          void Function(CreateFeatureFlagRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateFeatureFlagRequestBuilder toBuilder() =>
      new CreateFeatureFlagRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateFeatureFlagRequest &&
        name == other.name &&
        description == other.description &&
        key == other.key &&
        type == other.type &&
        allowOverrideLevel == other.allowOverrideLevel &&
        defaultValue == other.defaultValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, allowOverrideLevel.hashCode);
    _$hash = $jc(_$hash, defaultValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateFeatureFlagRequest')
          ..add('name', name)
          ..add('description', description)
          ..add('key', key)
          ..add('type', type)
          ..add('allowOverrideLevel', allowOverrideLevel)
          ..add('defaultValue', defaultValue))
        .toString();
  }
}

class CreateFeatureFlagRequestBuilder
    implements
        Builder<CreateFeatureFlagRequest, CreateFeatureFlagRequestBuilder> {
  _$CreateFeatureFlagRequest? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  CreateFeatureFlagRequestTypeEnum? _type;
  CreateFeatureFlagRequestTypeEnum? get type => _$this._type;
  set type(CreateFeatureFlagRequestTypeEnum? type) => _$this._type = type;

  CreateFeatureFlagRequestAllowOverrideLevelEnum? _allowOverrideLevel;
  CreateFeatureFlagRequestAllowOverrideLevelEnum? get allowOverrideLevel =>
      _$this._allowOverrideLevel;
  set allowOverrideLevel(
          CreateFeatureFlagRequestAllowOverrideLevelEnum? allowOverrideLevel) =>
      _$this._allowOverrideLevel = allowOverrideLevel;

  String? _defaultValue;
  String? get defaultValue => _$this._defaultValue;
  set defaultValue(String? defaultValue) => _$this._defaultValue = defaultValue;

  CreateFeatureFlagRequestBuilder() {
    CreateFeatureFlagRequest._defaults(this);
  }

  CreateFeatureFlagRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _key = $v.key;
      _type = $v.type;
      _allowOverrideLevel = $v.allowOverrideLevel;
      _defaultValue = $v.defaultValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateFeatureFlagRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateFeatureFlagRequest;
  }

  @override
  void update(void Function(CreateFeatureFlagRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateFeatureFlagRequest build() => _build();

  _$CreateFeatureFlagRequest _build() {
    final _$result = _$v ??
        new _$CreateFeatureFlagRequest._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'CreateFeatureFlagRequest', 'name'),
            description: description,
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'CreateFeatureFlagRequest', 'key'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'CreateFeatureFlagRequest', 'type'),
            allowOverrideLevel: allowOverrideLevel,
            defaultValue: BuiltValueNullFieldError.checkNotNull(
                defaultValue, r'CreateFeatureFlagRequest', 'defaultValue'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
