//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
// ignore_for_file: unused_element
import 'package:kinde_flutter_sdk/src/model/get_application_response_application.dart';

part 'get_application_response.g.dart';

/// GetApplicationResponse
///
/// Properties:
/// * [code] - Response code.
/// * [message] - Response message.
/// * [application]
@BuiltValue()
abstract class GetApplicationResponse implements Built<GetApplicationResponse, GetApplicationResponseBuilder> {
  /// Response code.
  @BuiltValueField(wireName: r'code')
  String? get code;

  /// Response message.
  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'application')
  GetApplicationResponseApplication? get application;

  GetApplicationResponse._();

  factory GetApplicationResponse([void Function(GetApplicationResponseBuilder b) updates]) = _$GetApplicationResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetApplicationResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetApplicationResponse> get serializer => _$GetApplicationResponseSerializer();
}

class _$GetApplicationResponseSerializer implements PrimitiveSerializer<GetApplicationResponse> {
  @override
  final Iterable<Type> types = const [GetApplicationResponse, _$GetApplicationResponse];

  @override
  final String wireName = r'GetApplicationResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetApplicationResponse object, {
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
    if (object.application != null) {
      yield r'application';
      yield serializers.serialize(
        object.application,
        specifiedType: const FullType(GetApplicationResponseApplication),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetApplicationResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetApplicationResponseBuilder result,
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
        case r'application':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(GetApplicationResponseApplication),
          ) as GetApplicationResponseApplication;
          result.application.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetApplicationResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetApplicationResponseBuilder();
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

