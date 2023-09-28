//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
// ignore_for_file: unused_element
import 'package:kinde_flutter_sdk/src/model/user_identity_result.dart';

part 'user_identity.g.dart';

/// UserIdentity
///
/// Properties:
/// * [type] - The type of identity object created.
/// * [result]
@BuiltValue()
abstract class UserIdentity implements Built<UserIdentity, UserIdentityBuilder> {
  /// The type of identity object created.
  @BuiltValueField(wireName: r'type')
  String? get type;

  @BuiltValueField(wireName: r'result')
  UserIdentityResult? get result;

  UserIdentity._();

  factory UserIdentity([void Function(UserIdentityBuilder b) updates]) = _$UserIdentity;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserIdentityBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserIdentity> get serializer => _$UserIdentitySerializer();
}

class _$UserIdentitySerializer implements PrimitiveSerializer<UserIdentity> {
  @override
  final Iterable<Type> types = const [UserIdentity, _$UserIdentity];

  @override
  final String wireName = r'UserIdentity';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserIdentity object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(String),
      );
    }
    if (object.result != null) {
      yield r'result';
      yield serializers.serialize(
        object.result,
        specifiedType: const FullType(UserIdentityResult),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserIdentity object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserIdentityBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        case r'result':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserIdentityResult),
          ) as UserIdentityResult;
          result.result.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserIdentity deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserIdentityBuilder();
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

