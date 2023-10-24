//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'token_error_response.g.dart';

/// TokenErrorResponse
///
/// Properties:
/// * [error] - Error.
/// * [errorDescription] - The error description.
@BuiltValue()
abstract class TokenErrorResponse implements Built<TokenErrorResponse, TokenErrorResponseBuilder> {
  /// Error.
  @BuiltValueField(wireName: r'error')
  String? get error;

  /// The error description.
  @BuiltValueField(wireName: r'error_description')
  String? get errorDescription;

  TokenErrorResponse._();

  factory TokenErrorResponse([void Function(TokenErrorResponseBuilder b) updates]) = _$TokenErrorResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TokenErrorResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TokenErrorResponse> get serializer => _$TokenErrorResponseSerializer();
}

class _$TokenErrorResponseSerializer implements PrimitiveSerializer<TokenErrorResponse> {
  @override
  final Iterable<Type> types = const [TokenErrorResponse, _$TokenErrorResponse];

  @override
  final String wireName = r'TokenErrorResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TokenErrorResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.error != null) {
      yield r'error';
      yield serializers.serialize(
        object.error,
        specifiedType: const FullType(String),
      );
    }
    if (object.errorDescription != null) {
      yield r'error_description';
      yield serializers.serialize(
        object.errorDescription,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TokenErrorResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TokenErrorResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'error':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.error = valueDes;
          break;
        case r'error_description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.errorDescription = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TokenErrorResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TokenErrorResponseBuilder();
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

