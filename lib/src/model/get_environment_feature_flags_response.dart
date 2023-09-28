//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
// ignore_for_file: unused_element
import 'package:kinde_flutter_sdk/src/model/get_organization_feature_flags_response_feature_flags_value.dart';

part 'get_environment_feature_flags_response.g.dart';

/// GetEnvironmentFeatureFlagsResponse
///
/// Properties:
/// * [code] - Response code.
/// * [message] - Response message.
/// * [featureFlags] - The environment's feature flag settings.
/// * [nextToken] - Pagination token.
@BuiltValue()
abstract class GetEnvironmentFeatureFlagsResponse implements Built<GetEnvironmentFeatureFlagsResponse, GetEnvironmentFeatureFlagsResponseBuilder> {
  /// Response code.
  @BuiltValueField(wireName: r'code')
  String? get code;

  /// Response message.
  @BuiltValueField(wireName: r'message')
  String? get message;

  /// The environment's feature flag settings.
  @BuiltValueField(wireName: r'feature_flags')
  BuiltMap<String, GetOrganizationFeatureFlagsResponseFeatureFlagsValue>? get featureFlags;

  /// Pagination token.
  @BuiltValueField(wireName: r'next_token')
  String? get nextToken;

  GetEnvironmentFeatureFlagsResponse._();

  factory GetEnvironmentFeatureFlagsResponse([void Function(GetEnvironmentFeatureFlagsResponseBuilder b) updates]) = _$GetEnvironmentFeatureFlagsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetEnvironmentFeatureFlagsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetEnvironmentFeatureFlagsResponse> get serializer => _$GetEnvironmentFeatureFlagsResponseSerializer();
}

class _$GetEnvironmentFeatureFlagsResponseSerializer implements PrimitiveSerializer<GetEnvironmentFeatureFlagsResponse> {
  @override
  final Iterable<Type> types = const [GetEnvironmentFeatureFlagsResponse, _$GetEnvironmentFeatureFlagsResponse];

  @override
  final String wireName = r'GetEnvironmentFeatureFlagsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetEnvironmentFeatureFlagsResponse object, {
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
    if (object.featureFlags != null) {
      yield r'feature_flags';
      yield serializers.serialize(
        object.featureFlags,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(GetOrganizationFeatureFlagsResponseFeatureFlagsValue)]),
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
    GetEnvironmentFeatureFlagsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetEnvironmentFeatureFlagsResponseBuilder result,
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
        case r'feature_flags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(GetOrganizationFeatureFlagsResponseFeatureFlagsValue)]),
          ) as BuiltMap<String, GetOrganizationFeatureFlagsResponseFeatureFlagsValue>;
          result.featureFlags.replace(valueDes);
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
  GetEnvironmentFeatureFlagsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetEnvironmentFeatureFlagsResponseBuilder();
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

