//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_application_request.g.dart';

/// CreateApplicationRequest
///
/// Properties:
/// * [name] - The application's name.
/// * [type] - The application's type.
@BuiltValue()
abstract class CreateApplicationRequest implements Built<CreateApplicationRequest, CreateApplicationRequestBuilder> {
  /// The application's name.
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// The application's type.
  @BuiltValueField(wireName: r'type')
  CreateApplicationRequestTypeEnum? get type;
  // enum typeEnum {  reg,  spa,  m2m,  };

  CreateApplicationRequest._();

  factory CreateApplicationRequest([void Function(CreateApplicationRequestBuilder b) updates]) = _$CreateApplicationRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateApplicationRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateApplicationRequest> get serializer => _$CreateApplicationRequestSerializer();
}

class _$CreateApplicationRequestSerializer implements PrimitiveSerializer<CreateApplicationRequest> {
  @override
  final Iterable<Type> types = const [CreateApplicationRequest, _$CreateApplicationRequest];

  @override
  final String wireName = r'CreateApplicationRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateApplicationRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(CreateApplicationRequestTypeEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateApplicationRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateApplicationRequestBuilder result,
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
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CreateApplicationRequestTypeEnum),
          ) as CreateApplicationRequestTypeEnum;
          result.type = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateApplicationRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateApplicationRequestBuilder();
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

class CreateApplicationRequestTypeEnum extends EnumClass {

  /// The application's type.
  @BuiltValueEnumConst(wireName: r'reg')
  static const CreateApplicationRequestTypeEnum reg = _$createApplicationRequestTypeEnum_reg;
  /// The application's type.
  @BuiltValueEnumConst(wireName: r'spa')
  static const CreateApplicationRequestTypeEnum spa = _$createApplicationRequestTypeEnum_spa;
  /// The application's type.
  @BuiltValueEnumConst(wireName: r'm2m')
  static const CreateApplicationRequestTypeEnum m2m = _$createApplicationRequestTypeEnum_m2m;

  static Serializer<CreateApplicationRequestTypeEnum> get serializer => _$createApplicationRequestTypeEnumSerializer;

  const CreateApplicationRequestTypeEnum._(String name): super(name);

  static BuiltSet<CreateApplicationRequestTypeEnum> get values => _$createApplicationRequestTypeEnumValues;
  static CreateApplicationRequestTypeEnum valueOf(String name) => _$createApplicationRequestTypeEnumValueOf(name);
}

