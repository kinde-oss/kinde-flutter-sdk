//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
// ignore_for_file: unused_element
import 'package:kinde_flutter_sdk/src/model/create_user_request_identities_inner_details.dart';

part 'create_user_request_identities_inner.g.dart';

/// The result of the user creation operation.
///
/// Properties:
/// * [type] - The type of identity to create, for e.g. email.
/// * [details]
@BuiltValue()
abstract class CreateUserRequestIdentitiesInner implements Built<CreateUserRequestIdentitiesInner, CreateUserRequestIdentitiesInnerBuilder> {
  /// The type of identity to create, for e.g. email.
  @BuiltValueField(wireName: r'type')
  CreateUserRequestIdentitiesInnerTypeEnum? get type;
  // enum typeEnum {  email,  };

  @BuiltValueField(wireName: r'details')
  CreateUserRequestIdentitiesInnerDetails? get details;

  CreateUserRequestIdentitiesInner._();

  factory CreateUserRequestIdentitiesInner([void Function(CreateUserRequestIdentitiesInnerBuilder b) updates]) = _$CreateUserRequestIdentitiesInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateUserRequestIdentitiesInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateUserRequestIdentitiesInner> get serializer => _$CreateUserRequestIdentitiesInnerSerializer();
}

class _$CreateUserRequestIdentitiesInnerSerializer implements PrimitiveSerializer<CreateUserRequestIdentitiesInner> {
  @override
  final Iterable<Type> types = const [CreateUserRequestIdentitiesInner, _$CreateUserRequestIdentitiesInner];

  @override
  final String wireName = r'CreateUserRequestIdentitiesInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateUserRequestIdentitiesInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(CreateUserRequestIdentitiesInnerTypeEnum),
      );
    }
    if (object.details != null) {
      yield r'details';
      yield serializers.serialize(
        object.details,
        specifiedType: const FullType(CreateUserRequestIdentitiesInnerDetails),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateUserRequestIdentitiesInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateUserRequestIdentitiesInnerBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CreateUserRequestIdentitiesInnerTypeEnum),
          ) as CreateUserRequestIdentitiesInnerTypeEnum;
          result.type = valueDes;
          break;
        case r'details':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CreateUserRequestIdentitiesInnerDetails),
          ) as CreateUserRequestIdentitiesInnerDetails;
          result.details.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateUserRequestIdentitiesInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateUserRequestIdentitiesInnerBuilder();
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

class CreateUserRequestIdentitiesInnerTypeEnum extends EnumClass {

  /// The type of identity to create, for e.g. email.
  @BuiltValueEnumConst(wireName: r'email')
  static const CreateUserRequestIdentitiesInnerTypeEnum email = _$createUserRequestIdentitiesInnerTypeEnum_email;

  static Serializer<CreateUserRequestIdentitiesInnerTypeEnum> get serializer => _$createUserRequestIdentitiesInnerTypeEnumSerializer;

  const CreateUserRequestIdentitiesInnerTypeEnum._(String name): super(name);

  static BuiltSet<CreateUserRequestIdentitiesInnerTypeEnum> get values => _$createUserRequestIdentitiesInnerTypeEnumValues;
  static CreateUserRequestIdentitiesInnerTypeEnum valueOf(String name) => _$createUserRequestIdentitiesInnerTypeEnumValueOf(name);
}

