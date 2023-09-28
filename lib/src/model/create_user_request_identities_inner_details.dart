//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_user_request_identities_inner_details.g.dart';

/// Additional details required to create the user.
///
/// Properties:
/// * [email] - The email address of the user.
@BuiltValue()
abstract class CreateUserRequestIdentitiesInnerDetails implements Built<CreateUserRequestIdentitiesInnerDetails, CreateUserRequestIdentitiesInnerDetailsBuilder> {
  /// The email address of the user.
  @BuiltValueField(wireName: r'email')
  String? get email;

  CreateUserRequestIdentitiesInnerDetails._();

  factory CreateUserRequestIdentitiesInnerDetails([void Function(CreateUserRequestIdentitiesInnerDetailsBuilder b) updates]) = _$CreateUserRequestIdentitiesInnerDetails;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateUserRequestIdentitiesInnerDetailsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateUserRequestIdentitiesInnerDetails> get serializer => _$CreateUserRequestIdentitiesInnerDetailsSerializer();
}

class _$CreateUserRequestIdentitiesInnerDetailsSerializer implements PrimitiveSerializer<CreateUserRequestIdentitiesInnerDetails> {
  @override
  final Iterable<Type> types = const [CreateUserRequestIdentitiesInnerDetails, _$CreateUserRequestIdentitiesInnerDetails];

  @override
  final String wireName = r'CreateUserRequestIdentitiesInnerDetails';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateUserRequestIdentitiesInnerDetails object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateUserRequestIdentitiesInnerDetails object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateUserRequestIdentitiesInnerDetailsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateUserRequestIdentitiesInnerDetails deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateUserRequestIdentitiesInnerDetailsBuilder();
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

