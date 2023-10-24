//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_identities_inner.g.dart';

/// UserIdentitiesInner
///
/// Properties:
/// * [type] 
/// * [identity] 
@BuiltValue()
abstract class UserIdentitiesInner implements Built<UserIdentitiesInner, UserIdentitiesInnerBuilder> {
  @BuiltValueField(wireName: r'type')
  String? get type;

  @BuiltValueField(wireName: r'identity')
  String? get identity;

  UserIdentitiesInner._();

  factory UserIdentitiesInner([void Function(UserIdentitiesInnerBuilder b) updates]) = _$UserIdentitiesInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserIdentitiesInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserIdentitiesInner> get serializer => _$UserIdentitiesInnerSerializer();
}

class _$UserIdentitiesInnerSerializer implements PrimitiveSerializer<UserIdentitiesInner> {
  @override
  final Iterable<Type> types = const [UserIdentitiesInner, _$UserIdentitiesInner];

  @override
  final String wireName = r'UserIdentitiesInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserIdentitiesInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(String),
      );
    }
    if (object.identity != null) {
      yield r'identity';
      yield serializers.serialize(
        object.identity,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserIdentitiesInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserIdentitiesInnerBuilder result,
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
        case r'identity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.identity = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserIdentitiesInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserIdentitiesInnerBuilder();
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

