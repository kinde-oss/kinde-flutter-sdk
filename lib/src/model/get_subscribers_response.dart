//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:kinde_flutter_sdk/src/model/subscribers_subscriber.dart';

part 'get_subscribers_response.g.dart';

/// GetSubscribersResponse
///
/// Properties:
/// * [code] - Response code.
/// * [message] - Response message.
/// * [subscribers]
/// * [nextToken] - Pagination token.
@BuiltValue()
abstract class GetSubscribersResponse implements Built<GetSubscribersResponse, GetSubscribersResponseBuilder> {
  /// Response code.
  @BuiltValueField(wireName: r'code')
  String? get code;

  /// Response message.
  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'subscribers')
  BuiltList<SubscribersSubscriber>? get subscribers;

  /// Pagination token.
  @BuiltValueField(wireName: r'next_token')
  String? get nextToken;

  GetSubscribersResponse._();

  factory GetSubscribersResponse([void Function(GetSubscribersResponseBuilder b) updates]) = _$GetSubscribersResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetSubscribersResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetSubscribersResponse> get serializer => _$GetSubscribersResponseSerializer();
}

class _$GetSubscribersResponseSerializer implements PrimitiveSerializer<GetSubscribersResponse> {
  @override
  final Iterable<Type> types = const [GetSubscribersResponse, _$GetSubscribersResponse];

  @override
  final String wireName = r'GetSubscribersResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetSubscribersResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(String),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
    if (object.subscribers != null) {
      yield r'subscribers';
      yield serializers.serialize(
        object.subscribers,
        specifiedType: const FullType(BuiltList, [FullType(SubscribersSubscriber)]),
      );
    }
    if (object.nextToken != null) {
      yield r'next_token';
      yield serializers.serialize(
        object.nextToken,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetSubscribersResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetSubscribersResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'subscribers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(SubscribersSubscriber)]),
          ) as BuiltList<SubscribersSubscriber>;
          result.subscribers.replace(valueDes);
          break;
        case r'next_token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nextToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetSubscribersResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetSubscribersResponseBuilder();
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

