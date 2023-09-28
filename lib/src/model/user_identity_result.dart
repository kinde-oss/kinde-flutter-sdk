//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_identity_result.g.dart';

/// The result of the user creation operation.
///
/// Properties:
/// * [created] - True if the user identity was successfully created.
@BuiltValue()
abstract class UserIdentityResult implements Built<UserIdentityResult, UserIdentityResultBuilder> {
  /// True if the user identity was successfully created.
  @BuiltValueField(wireName: r'created')
  bool? get created;

  UserIdentityResult._();

  factory UserIdentityResult([void Function(UserIdentityResultBuilder b) updates]) = _$UserIdentityResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserIdentityResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserIdentityResult> get serializer => _$UserIdentityResultSerializer();
}

class _$UserIdentityResultSerializer implements PrimitiveSerializer<UserIdentityResult> {
  @override
  final Iterable<Type> types = const [UserIdentityResult, _$UserIdentityResult];

  @override
  final String wireName = r'UserIdentityResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserIdentityResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.created != null) {
      yield r'created';
      yield serializers.serialize(
        object.created,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserIdentityResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserIdentityResultBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'created':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.created = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserIdentityResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserIdentityResultBuilder();
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

