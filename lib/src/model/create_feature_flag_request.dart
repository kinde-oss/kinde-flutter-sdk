//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_feature_flag_request.g.dart';

/// CreateFeatureFlagRequest
///
/// Properties:
/// * [name] - The name of the flag.
/// * [description] - Description of the flag purpose.
/// * [key] - The flag identifier to use in code.
/// * [type] - The variable type.
/// * [allowOverrideLevel] - Allow the flag to be overridden at a different level.
/// * [defaultValue] - Default value for the flag used by environments and organizations.
@BuiltValue()
abstract class CreateFeatureFlagRequest implements Built<CreateFeatureFlagRequest, CreateFeatureFlagRequestBuilder> {
  /// The name of the flag.
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Description of the flag purpose.
  @BuiltValueField(wireName: r'description')
  String? get description;

  /// The flag identifier to use in code.
  @BuiltValueField(wireName: r'key')
  String get key;

  /// The variable type.
  @BuiltValueField(wireName: r'type')
  CreateFeatureFlagRequestTypeEnum get type;
  // enum typeEnum {  str,  int,  bool,  };

  /// Allow the flag to be overridden at a different level.
  @BuiltValueField(wireName: r'allow_override_level')
  CreateFeatureFlagRequestAllowOverrideLevelEnum? get allowOverrideLevel;
  // enum allowOverrideLevelEnum {  env,  org,  };

  /// Default value for the flag used by environments and organizations.
  @BuiltValueField(wireName: r'default_value')
  String get defaultValue;

  CreateFeatureFlagRequest._();

  factory CreateFeatureFlagRequest([void Function(CreateFeatureFlagRequestBuilder b) updates]) = _$CreateFeatureFlagRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateFeatureFlagRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateFeatureFlagRequest> get serializer => _$CreateFeatureFlagRequestSerializer();
}

class _$CreateFeatureFlagRequestSerializer implements PrimitiveSerializer<CreateFeatureFlagRequest> {
  @override
  final Iterable<Type> types = const [CreateFeatureFlagRequest, _$CreateFeatureFlagRequest];

  @override
  final String wireName = r'CreateFeatureFlagRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateFeatureFlagRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(CreateFeatureFlagRequestTypeEnum),
    );
    if (object.allowOverrideLevel != null) {
      yield r'allow_override_level';
      yield serializers.serialize(
        object.allowOverrideLevel,
        specifiedType: const FullType(CreateFeatureFlagRequestAllowOverrideLevelEnum),
      );
    }
    yield r'default_value';
    yield serializers.serialize(
      object.defaultValue,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateFeatureFlagRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateFeatureFlagRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CreateFeatureFlagRequestTypeEnum),
          ) as CreateFeatureFlagRequestTypeEnum;
          result.type = valueDes;
          break;
        case r'allow_override_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CreateFeatureFlagRequestAllowOverrideLevelEnum),
          ) as CreateFeatureFlagRequestAllowOverrideLevelEnum;
          result.allowOverrideLevel = valueDes;
          break;
        case r'default_value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.defaultValue = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateFeatureFlagRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateFeatureFlagRequestBuilder();
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

class CreateFeatureFlagRequestTypeEnum extends EnumClass {

  /// The variable type.
  @BuiltValueEnumConst(wireName: r'str')
  static const CreateFeatureFlagRequestTypeEnum str = _$createFeatureFlagRequestTypeEnum_str;
  /// The variable type.
  @BuiltValueEnumConst(wireName: r'int')
  static const CreateFeatureFlagRequestTypeEnum int_ = _$createFeatureFlagRequestTypeEnum_int_;
  /// The variable type.
  @BuiltValueEnumConst(wireName: r'bool')
  static const CreateFeatureFlagRequestTypeEnum bool_ = _$createFeatureFlagRequestTypeEnum_bool_;

  static Serializer<CreateFeatureFlagRequestTypeEnum> get serializer => _$createFeatureFlagRequestTypeEnumSerializer;

  const CreateFeatureFlagRequestTypeEnum._(String name): super(name);

  static BuiltSet<CreateFeatureFlagRequestTypeEnum> get values => _$createFeatureFlagRequestTypeEnumValues;
  static CreateFeatureFlagRequestTypeEnum valueOf(String name) => _$createFeatureFlagRequestTypeEnumValueOf(name);
}

class CreateFeatureFlagRequestAllowOverrideLevelEnum extends EnumClass {

  /// Allow the flag to be overridden at a different level.
  @BuiltValueEnumConst(wireName: r'env')
  static const CreateFeatureFlagRequestAllowOverrideLevelEnum env = _$createFeatureFlagRequestAllowOverrideLevelEnum_env;
  /// Allow the flag to be overridden at a different level.
  @BuiltValueEnumConst(wireName: r'org')
  static const CreateFeatureFlagRequestAllowOverrideLevelEnum org = _$createFeatureFlagRequestAllowOverrideLevelEnum_org;

  static Serializer<CreateFeatureFlagRequestAllowOverrideLevelEnum> get serializer => _$createFeatureFlagRequestAllowOverrideLevelEnumSerializer;

  const CreateFeatureFlagRequestAllowOverrideLevelEnum._(String name): super(name);

  static BuiltSet<CreateFeatureFlagRequestAllowOverrideLevelEnum> get values => _$createFeatureFlagRequestAllowOverrideLevelEnumValues;
  static CreateFeatureFlagRequestAllowOverrideLevelEnum valueOf(String name) => _$createFeatureFlagRequestAllowOverrideLevelEnumValueOf(name);
}

