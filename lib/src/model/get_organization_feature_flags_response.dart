//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
// ignore_for_file: unused_element
import 'package:kinde_flutter_sdk/src/model/get_organization_feature_flags_response_feature_flags_value.dart';

part 'get_organization_feature_flags_response.g.dart';

/// GetOrganizationFeatureFlagsResponse
///
/// Properties:
/// * [code] - Response code.
/// * [message] - Response message.
/// * [featureFlags] - The environment's feature flag settings.
@BuiltValue()
abstract class GetOrganizationFeatureFlagsResponse implements Built<GetOrganizationFeatureFlagsResponse, GetOrganizationFeatureFlagsResponseBuilder> {
  /// Response code.
  @BuiltValueField(wireName: r'code')
  String? get code;

  /// Response message.
  @BuiltValueField(wireName: r'message')
  String? get message;

  /// The environment's feature flag settings.
  @BuiltValueField(wireName: r'feature_flags')
  BuiltMap<String, GetOrganizationFeatureFlagsResponseFeatureFlagsValue>? get featureFlags;

  GetOrganizationFeatureFlagsResponse._();

  factory GetOrganizationFeatureFlagsResponse([void Function(GetOrganizationFeatureFlagsResponseBuilder b) updates]) = _$GetOrganizationFeatureFlagsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetOrganizationFeatureFlagsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetOrganizationFeatureFlagsResponse> get serializer => _$GetOrganizationFeatureFlagsResponseSerializer();
}

class _$GetOrganizationFeatureFlagsResponseSerializer implements PrimitiveSerializer<GetOrganizationFeatureFlagsResponse> {
  @override
  final Iterable<Type> types = const [GetOrganizationFeatureFlagsResponse, _$GetOrganizationFeatureFlagsResponse];

  @override
  final String wireName = r'GetOrganizationFeatureFlagsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetOrganizationFeatureFlagsResponse object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    GetOrganizationFeatureFlagsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetOrganizationFeatureFlagsResponseBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetOrganizationFeatureFlagsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetOrganizationFeatureFlagsResponseBuilder();
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

