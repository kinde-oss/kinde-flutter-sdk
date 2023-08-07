//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_organization_feature_flags_response_feature_flags_value.g.dart';

/// GetOrganizationFeatureFlagsResponseFeatureFlagsValue
///
/// Properties:
/// * [type] 
/// * [value] 
@BuiltValue()
abstract class GetOrganizationFeatureFlagsResponseFeatureFlagsValue implements Built<GetOrganizationFeatureFlagsResponseFeatureFlagsValue, GetOrganizationFeatureFlagsResponseFeatureFlagsValueBuilder> {
  @BuiltValueField(wireName: r'type')
  GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum? get type;
  // enum typeEnum {  str,  int,  bool,  };

  @BuiltValueField(wireName: r'value')
  String? get value;

  GetOrganizationFeatureFlagsResponseFeatureFlagsValue._();

  factory GetOrganizationFeatureFlagsResponseFeatureFlagsValue([void updates(GetOrganizationFeatureFlagsResponseFeatureFlagsValueBuilder b)]) = _$GetOrganizationFeatureFlagsResponseFeatureFlagsValue;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetOrganizationFeatureFlagsResponseFeatureFlagsValueBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetOrganizationFeatureFlagsResponseFeatureFlagsValue> get serializer => _$GetOrganizationFeatureFlagsResponseFeatureFlagsValueSerializer();
}

class _$GetOrganizationFeatureFlagsResponseFeatureFlagsValueSerializer implements PrimitiveSerializer<GetOrganizationFeatureFlagsResponseFeatureFlagsValue> {
  @override
  final Iterable<Type> types = const [GetOrganizationFeatureFlagsResponseFeatureFlagsValue, _$GetOrganizationFeatureFlagsResponseFeatureFlagsValue];

  @override
  final String wireName = r'GetOrganizationFeatureFlagsResponseFeatureFlagsValue';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetOrganizationFeatureFlagsResponseFeatureFlagsValue object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum),
      );
    }
    if (object.value != null) {
      yield r'value';
      yield serializers.serialize(
        object.value,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetOrganizationFeatureFlagsResponseFeatureFlagsValue object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetOrganizationFeatureFlagsResponseFeatureFlagsValueBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum),
          ) as GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum;
          result.type = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.value = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetOrganizationFeatureFlagsResponseFeatureFlagsValue deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetOrganizationFeatureFlagsResponseFeatureFlagsValueBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

class GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'str')
  static const GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum str = _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum_str;
  @BuiltValueEnumConst(wireName: r'int')
  static const GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum int_ = _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum_int_;
  @BuiltValueEnumConst(wireName: r'bool')
  static const GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum bool_ = _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum_bool_;

  static Serializer<GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum> get serializer => _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnumSerializer;

  const GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum._(String name): super(name);

  static BuiltSet<GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum> get values => _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnumValues;
  static GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum valueOf(String name) => _$getOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnumValueOf(name);
}

