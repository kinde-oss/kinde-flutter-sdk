//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:kinde_flutter_sdk/src/model/applications.dart';

part 'get_applications_response.g.dart';

/// GetApplicationsResponse
///
/// Properties:
/// * [code] - Response code.
/// * [message] - Response message.
/// * [applications]
/// * [nextToken] - Pagination token.
@BuiltValue()
abstract class GetApplicationsResponse implements Built<GetApplicationsResponse, GetApplicationsResponseBuilder> {
  /// Response code.
  @BuiltValueField(wireName: r'code')
  String? get code;

  /// Response message.
  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'applications')
  BuiltList<Applications>? get applications;

  /// Pagination token.
  @BuiltValueField(wireName: r'next_token')
  String? get nextToken;

  GetApplicationsResponse._();

  factory GetApplicationsResponse([void Function(GetApplicationsResponseBuilder b) updates]) = _$GetApplicationsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetApplicationsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetApplicationsResponse> get serializer => _$GetApplicationsResponseSerializer();
}

class _$GetApplicationsResponseSerializer implements PrimitiveSerializer<GetApplicationsResponse> {
  @override
  final Iterable<Type> types = const [GetApplicationsResponse, _$GetApplicationsResponse];

  @override
  final String wireName = r'GetApplicationsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetApplicationsResponse object, {
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
    if (object.applications != null) {
      yield r'applications';
      yield serializers.serialize(
        object.applications,
        specifiedType: const FullType(BuiltList, [FullType(Applications)]),
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
    GetApplicationsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetApplicationsResponseBuilder result,
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
        case r'applications':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Applications)]),
          ) as BuiltList<Applications>;
          result.applications.replace(valueDes);
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
  GetApplicationsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetApplicationsResponseBuilder();
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

