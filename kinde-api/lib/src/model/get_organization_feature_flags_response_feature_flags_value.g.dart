// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_organization_feature_flags_response_feature_flags_value.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum
    _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum_str =
    const GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum._('str');
const GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum
    _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum_int_ =
    const GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum._(
        'int_');
const GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum
    _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum_bool_ =
    const GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum._(
        'bool_');

GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum
    _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnumValueOf(
        String name) {
  switch (name) {
    case 'str':
      return _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum_str;
    case 'int_':
      return _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum_int_;
    case 'bool_':
      return _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum_bool_;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum>
    _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnumValues =
    new BuiltSet<
        GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum>(const <GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum>[
  _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum_str,
  _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum_int_,
  _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum_bool_,
]);

Serializer<GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum>
    _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnumSerializer =
    new _$GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnumSerializer();

class _$GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnumSerializer
    implements
        PrimitiveSerializer<
            GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum> {
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
    GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum
  ];
  @override
  final String wireName =
      'GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum';

  @override
  Object serialize(Serializers serializers,
          GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$GetOrganizationFeatureFlagsResponseFeatureFlagsValue
    extends GetOrganizationFeatureFlagsResponseFeatureFlagsValue {
  @override
  final GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum? type;
  @override
  final String? value;

  factory _$GetOrganizationFeatureFlagsResponseFeatureFlagsValue(
          [void Function(
                  GetOrganizationFeatureFlagsResponseFeatureFlagsValueBuilder)?
              updates]) =>
      (new GetOrganizationFeatureFlagsResponseFeatureFlagsValueBuilder()
            ..update(updates))
          ._build();

  _$GetOrganizationFeatureFlagsResponseFeatureFlagsValue._(
      {this.type, this.value})
      : super._();

  @override
  GetOrganizationFeatureFlagsResponseFeatureFlagsValue rebuild(
          void Function(
                  GetOrganizationFeatureFlagsResponseFeatureFlagsValueBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetOrganizationFeatureFlagsResponseFeatureFlagsValueBuilder toBuilder() =>
      new GetOrganizationFeatureFlagsResponseFeatureFlagsValueBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetOrganizationFeatureFlagsResponseFeatureFlagsValue &&
        type == other.type &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GetOrganizationFeatureFlagsResponseFeatureFlagsValue')
          ..add('type', type)
          ..add('value', value))
        .toString();
  }
}

class GetOrganizationFeatureFlagsResponseFeatureFlagsValueBuilder
    implements
        Builder<GetOrganizationFeatureFlagsResponseFeatureFlagsValue,
            GetOrganizationFeatureFlagsResponseFeatureFlagsValueBuilder> {
  _$GetOrganizationFeatureFlagsResponseFeatureFlagsValue? _$v;

  GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum? _type;
  GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum? get type =>
      _$this._type;
  set type(
          GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum? type) =>
      _$this._type = type;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GetOrganizationFeatureFlagsResponseFeatureFlagsValueBuilder() {
    GetOrganizationFeatureFlagsResponseFeatureFlagsValue._defaults(this);
  }

  GetOrganizationFeatureFlagsResponseFeatureFlagsValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetOrganizationFeatureFlagsResponseFeatureFlagsValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetOrganizationFeatureFlagsResponseFeatureFlagsValue;
  }

  @override
  void update(
      void Function(
              GetOrganizationFeatureFlagsResponseFeatureFlagsValueBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GetOrganizationFeatureFlagsResponseFeatureFlagsValue build() => _build();

  _$GetOrganizationFeatureFlagsResponseFeatureFlagsValue _build() {
    final _$result = _$v ??
        new _$GetOrganizationFeatureFlagsResponseFeatureFlagsValue._(
            type: type, value: value);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
