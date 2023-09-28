//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:kinde_flutter_sdk/src/model/subscriber.dart';

part 'get_subscriber_response.g.dart';

/// GetSubscriberResponse
///
/// Properties:
/// * [code] - Response code.
/// * [message] - Response message.
/// * [subscribers]
@BuiltValue()
abstract class GetSubscriberResponse implements Built<GetSubscriberResponse, GetSubscriberResponseBuilder> {
  /// Response code.
  @BuiltValueField(wireName: r'code')
  String? get code;

  /// Response message.
  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'subscribers')
  BuiltList<Subscriber>? get subscribers;

  GetSubscriberResponse._();

  factory GetSubscriberResponse([void Function(GetSubscriberResponseBuilder b) updates]) = _$GetSubscriberResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetSubscriberResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetSubscriberResponse> get serializer => _$GetSubscriberResponseSerializer();
}

class _$GetSubscriberResponseSerializer implements PrimitiveSerializer<GetSubscriberResponse> {
  @override
  final Iterable<Type> types = const [GetSubscriberResponse, _$GetSubscriberResponse];

  @override
  final String wireName = r'GetSubscriberResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetSubscriberResponse object, {
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
        specifiedType: const FullType(BuiltList, [FullType(Subscriber)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetSubscriberResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetSubscriberResponseBuilder result,
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
            specifiedType: const FullType(BuiltList, [FullType(Subscriber)]),
          ) as BuiltList<Subscriber>;
          result.subscribers.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetSubscriberResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetSubscriberResponseBuilder();
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

