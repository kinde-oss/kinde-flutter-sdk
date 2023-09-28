//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_application_response_application.g.dart';

/// GetApplicationResponseApplication
///
/// Properties:
/// * [id] - The application's identifier.
/// * [name] - The application's name.
/// * [type] - The application's type.
/// * [clientId] - The application's client id.
/// * [clientSecret] - The application's client secret.
@BuiltValue()
abstract class GetApplicationResponseApplication implements Built<GetApplicationResponseApplication, GetApplicationResponseApplicationBuilder> {
  /// The application's identifier.
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// The application's name.
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// The application's type.
  @BuiltValueField(wireName: r'type')
  String? get type;

  /// The application's client id.
  @BuiltValueField(wireName: r'client_id')
  String? get clientId;

  /// The application's client secret.
  @BuiltValueField(wireName: r'client_secret')
  String? get clientSecret;

  GetApplicationResponseApplication._();

  factory GetApplicationResponseApplication([void Function(GetApplicationResponseApplicationBuilder b) updates]) = _$GetApplicationResponseApplication;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetApplicationResponseApplicationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetApplicationResponseApplication> get serializer => _$GetApplicationResponseApplicationSerializer();
}

class _$GetApplicationResponseApplicationSerializer implements PrimitiveSerializer<GetApplicationResponseApplication> {
  @override
  final Iterable<Type> types = const [GetApplicationResponseApplication, _$GetApplicationResponseApplication];

  @override
  final String wireName = r'GetApplicationResponseApplication';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetApplicationResponseApplication object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
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
    GetApplicationResponseApplication object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetApplicationResponseApplicationBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
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
  GetApplicationResponseApplication deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetApplicationResponseApplicationBuilder();
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

