//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'token_introspect.g.dart';

/// TokenIntrospect
///
/// Properties:
/// * [active] - Indicates the status of the token.
/// * [aud] - Array of intended token recipients.
/// * [clientId] - Identifier for the requesting client.
/// * [exp] - Token expiration timestamp.
/// * [iat] - Token issuance timestamp.
@BuiltValue()
abstract class TokenIntrospect implements Built<TokenIntrospect, TokenIntrospectBuilder> {
  /// Indicates the status of the token.
  @BuiltValueField(wireName: r'active')
  bool? get active;

  /// Array of intended token recipients.
  @BuiltValueField(wireName: r'aud')
  BuiltList<String>? get aud;

  /// Identifier for the requesting client.
  @BuiltValueField(wireName: r'client_id')
  String? get clientId;

  /// Token expiration timestamp.
  @BuiltValueField(wireName: r'exp')
  String? get exp;

  /// Token issuance timestamp.
  @BuiltValueField(wireName: r'iat')
  String? get iat;

  TokenIntrospect._();

  factory TokenIntrospect([void Function(TokenIntrospectBuilder b) updates]) = _$TokenIntrospect;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TokenIntrospectBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TokenIntrospect> get serializer => _$TokenIntrospectSerializer();
}

class _$TokenIntrospectSerializer implements PrimitiveSerializer<TokenIntrospect> {
  @override
  final Iterable<Type> types = const [TokenIntrospect, _$TokenIntrospect];

  @override
  final String wireName = r'TokenIntrospect';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TokenIntrospect object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.active != null) {
      yield r'active';
      yield serializers.serialize(
        object.active,
        specifiedType: const FullType(bool),
      );
    }
    if (object.aud != null) {
      yield r'aud';
      yield serializers.serialize(
        object.aud,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.clientId != null) {
      yield r'client_id';
      yield serializers.serialize(
        object.clientId,
        specifiedType: const FullType(String),
      );
    }
    if (object.exp != null) {
      yield r'exp';
      yield serializers.serialize(
        object.exp,
        specifiedType: const FullType(String),
      );
    }
    if (object.iat != null) {
      yield r'iat';
      yield serializers.serialize(
        object.iat,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TokenIntrospect object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TokenIntrospectBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'active':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.active = valueDes;
          break;
        case r'aud':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.aud.replace(valueDes);
          break;
        case r'client_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.clientId = valueDes;
          break;
        case r'exp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.exp = valueDes;
          break;
        case r'iat':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.iat = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TokenIntrospect deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TokenIntrospectBuilder();
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

