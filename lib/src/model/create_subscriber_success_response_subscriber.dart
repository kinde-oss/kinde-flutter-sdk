//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_subscriber_success_response_subscriber.g.dart';

/// CreateSubscriberSuccessResponseSubscriber
///
/// Properties:
/// * [subscriberId] - A unique identifier for the subscriber.
@BuiltValue()
abstract class CreateSubscriberSuccessResponseSubscriber implements Built<CreateSubscriberSuccessResponseSubscriber, CreateSubscriberSuccessResponseSubscriberBuilder> {
  /// A unique identifier for the subscriber.
  @BuiltValueField(wireName: r'subscriber_id')
  String? get subscriberId;

  CreateSubscriberSuccessResponseSubscriber._();

  factory CreateSubscriberSuccessResponseSubscriber([void Function(CreateSubscriberSuccessResponseSubscriberBuilder b) updates]) = _$CreateSubscriberSuccessResponseSubscriber;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateSubscriberSuccessResponseSubscriberBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateSubscriberSuccessResponseSubscriber> get serializer => _$CreateSubscriberSuccessResponseSubscriberSerializer();
}

class _$CreateSubscriberSuccessResponseSubscriberSerializer implements PrimitiveSerializer<CreateSubscriberSuccessResponseSubscriber> {
  @override
  final Iterable<Type> types = const [CreateSubscriberSuccessResponseSubscriber, _$CreateSubscriberSuccessResponseSubscriber];

  @override
  final String wireName = r'CreateSubscriberSuccessResponseSubscriber';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateSubscriberSuccessResponseSubscriber object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.subscriberId != null) {
      yield r'subscriber_id';
      yield serializers.serialize(
        object.subscriberId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateSubscriberSuccessResponseSubscriber object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateSubscriberSuccessResponseSubscriberBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'subscriber_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.subscriberId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateSubscriberSuccessResponseSubscriber deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateSubscriberSuccessResponseSubscriberBuilder();
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

