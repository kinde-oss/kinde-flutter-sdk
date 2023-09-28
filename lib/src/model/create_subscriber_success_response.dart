//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
// ignore_for_file: unused_element
import 'package:kinde_flutter_sdk/src/model/create_subscriber_success_response_subscriber.dart';

part 'create_subscriber_success_response.g.dart';

/// CreateSubscriberSuccessResponse
///
/// Properties:
/// * [subscriber]
@BuiltValue()
abstract class CreateSubscriberSuccessResponse implements Built<CreateSubscriberSuccessResponse, CreateSubscriberSuccessResponseBuilder> {
  @BuiltValueField(wireName: r'subscriber')
  CreateSubscriberSuccessResponseSubscriber? get subscriber;

  CreateSubscriberSuccessResponse._();

  factory CreateSubscriberSuccessResponse([void Function(CreateSubscriberSuccessResponseBuilder b) updates]) = _$CreateSubscriberSuccessResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateSubscriberSuccessResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateSubscriberSuccessResponse> get serializer => _$CreateSubscriberSuccessResponseSerializer();
}

class _$CreateSubscriberSuccessResponseSerializer implements PrimitiveSerializer<CreateSubscriberSuccessResponse> {
  @override
  final Iterable<Type> types = const [CreateSubscriberSuccessResponse, _$CreateSubscriberSuccessResponse];

  @override
  final String wireName = r'CreateSubscriberSuccessResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateSubscriberSuccessResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.subscriber != null) {
      yield r'subscriber';
      yield serializers.serialize(
        object.subscriber,
        specifiedType: const FullType(CreateSubscriberSuccessResponseSubscriber),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateSubscriberSuccessResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateSubscriberSuccessResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'subscriber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CreateSubscriberSuccessResponseSubscriber),
          ) as CreateSubscriberSuccessResponseSubscriber;
          result.subscriber.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateSubscriberSuccessResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateSubscriberSuccessResponseBuilder();
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

