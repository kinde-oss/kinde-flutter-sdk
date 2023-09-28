//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:kinde_flutter_sdk/src/model/user_identity.dart';

part 'create_user_response.g.dart';

/// CreateUserResponse
///
/// Properties:
/// * [id] - Unique id of the user in Kinde.
/// * [created] - True if the user was successfully created.
/// * [identities]
@BuiltValue()
abstract class CreateUserResponse implements Built<CreateUserResponse, CreateUserResponseBuilder> {
  /// Unique id of the user in Kinde.
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// True if the user was successfully created.
  @BuiltValueField(wireName: r'created')
  bool? get created;

  @BuiltValueField(wireName: r'identities')
  BuiltList<UserIdentity>? get identities;

  CreateUserResponse._();

  factory CreateUserResponse([void Function(CreateUserResponseBuilder b) updates]) = _$CreateUserResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateUserResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateUserResponse> get serializer => _$CreateUserResponseSerializer();
}

class _$CreateUserResponseSerializer implements PrimitiveSerializer<CreateUserResponse> {
  @override
  final Iterable<Type> types = const [CreateUserResponse, _$CreateUserResponse];

  @override
  final String wireName = r'CreateUserResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateUserResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.created != null) {
      yield r'created';
      yield serializers.serialize(
        object.created,
        specifiedType: const FullType(bool),
      );
    }
    if (object.identities != null) {
      yield r'identities';
      yield serializers.serialize(
        object.identities,
        specifiedType: const FullType(BuiltList, [FullType(UserIdentity)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateUserResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateUserResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'created':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.created = valueDes;
          break;
        case r'identities':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UserIdentity)]),
          ) as BuiltList<UserIdentity>;
          result.identities.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateUserResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateUserResponseBuilder();
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

