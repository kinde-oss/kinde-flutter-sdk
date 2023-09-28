//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
// ignore_for_file: unused_element
import 'package:kinde_flutter_sdk/src/model/api_applications_inner.dart';

part 'api.g.dart';

/// Api
///
/// Properties:
/// * [id] - The API's unique identifier.
/// * [code] - Response code.
/// * [name] - The API's name.
/// * [message] - Response message.
/// * [audience] - The API's audience.
/// * [applications]
@BuiltValue()
abstract class Api implements Built<Api, ApiBuilder> {
  /// The API's unique identifier.
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Response code.
  @BuiltValueField(wireName: r'code')
  String? get code;

  /// The API's name.
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// Response message.
  @BuiltValueField(wireName: r'message')
  String? get message;

  /// The API's audience.
  @BuiltValueField(wireName: r'audience')
  String? get audience;

  @BuiltValueField(wireName: r'applications')
  BuiltList<ApiApplicationsInner>? get applications;

  Api._();

  factory Api([void Function(ApiBuilder b) updates]) = _$Api;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Api> get serializer => _$ApiSerializer();
}

class _$ApiSerializer implements PrimitiveSerializer<Api> {
  @override
  final Iterable<Type> types = const [Api, _$Api];

  @override
  final String wireName = r'Api';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Api object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
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
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
    if (object.audience != null) {
      yield r'audience';
      yield serializers.serialize(
        object.audience,
        specifiedType: const FullType(String),
      );
    }
    if (object.applications != null) {
      yield r'applications';
      yield serializers.serialize(
        object.applications,
        specifiedType: const FullType(BuiltList, [FullType(ApiApplicationsInner)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Api object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApiBuilder result,
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
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'audience':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.audience = valueDes;
          break;
        case r'applications':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ApiApplicationsInner)]),
          ) as BuiltList<ApiApplicationsInner>;
          result.applications.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Api deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiBuilder();
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

