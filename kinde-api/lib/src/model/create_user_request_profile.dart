//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_user_request_profile.g.dart';

/// Basic information required to create a user.
///
/// Properties:
/// * [givenName] - User's first name.
/// * [familyName] - User's last name.
@BuiltValue()
abstract class CreateUserRequestProfile implements Built<CreateUserRequestProfile, CreateUserRequestProfileBuilder> {
  /// User's first name.
  @BuiltValueField(wireName: r'given_name')
  String? get givenName;

  /// User's last name.
  @BuiltValueField(wireName: r'family_name')
  String? get familyName;

  CreateUserRequestProfile._();

  factory CreateUserRequestProfile([void updates(CreateUserRequestProfileBuilder b)]) = _$CreateUserRequestProfile;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateUserRequestProfileBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateUserRequestProfile> get serializer => _$CreateUserRequestProfileSerializer();
}

class _$CreateUserRequestProfileSerializer implements PrimitiveSerializer<CreateUserRequestProfile> {
  @override
  final Iterable<Type> types = const [CreateUserRequestProfile, _$CreateUserRequestProfile];

  @override
  final String wireName = r'CreateUserRequestProfile';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateUserRequestProfile object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.givenName != null) {
      yield r'given_name';
      yield serializers.serialize(
        object.givenName,
        specifiedType: const FullType(String),
      );
    }
    if (object.familyName != null) {
      yield r'family_name';
      yield serializers.serialize(
        object.familyName,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateUserRequestProfile object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateUserRequestProfileBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'given_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.givenName = valueDes;
          break;
        case r'family_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.familyName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateUserRequestProfile deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateUserRequestProfileBuilder();
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

