//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_application_response_application.g.dart';

/// CreateApplicationResponseApplication
///
/// Properties:
/// * [id] - The application's identifier.
/// * [clientId] - The application's client id.
/// * [clientSecret] - The application's client secret.
@BuiltValue()
abstract class CreateApplicationResponseApplication implements Built<CreateApplicationResponseApplication, CreateApplicationResponseApplicationBuilder> {
  /// The application's identifier.
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// The application's client id.
  @BuiltValueField(wireName: r'client_id')
  String? get clientId;

  /// The application's client secret.
  @BuiltValueField(wireName: r'client_secret')
  String? get clientSecret;

  CreateApplicationResponseApplication._();

  factory CreateApplicationResponseApplication([void Function(CreateApplicationResponseApplicationBuilder b) updates]) = _$CreateApplicationResponseApplication;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateApplicationResponseApplicationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateApplicationResponseApplication> get serializer => _$CreateApplicationResponseApplicationSerializer();
}

class _$CreateApplicationResponseApplicationSerializer implements PrimitiveSerializer<CreateApplicationResponseApplication> {
  @override
  final Iterable<Type> types = const [CreateApplicationResponseApplication, _$CreateApplicationResponseApplication];

  @override
  final String wireName = r'CreateApplicationResponseApplication';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateApplicationResponseApplication object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.clientId != null) {
      yield r'client_id';
      yield serializers.serialize(
        object.clientId,
        specifiedType: const FullType(String),
      );
    }
    if (object.clientSecret != null) {
      yield r'client_secret';
      yield serializers.serialize(
        object.clientSecret,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateApplicationResponseApplication object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateApplicationResponseApplicationBuilder result,
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
        case r'client_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.clientId = valueDes;
          break;
        case r'client_secret':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.clientSecret = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateApplicationResponseApplication deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateApplicationResponseApplicationBuilder();
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

