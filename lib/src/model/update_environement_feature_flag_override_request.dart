//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_environement_feature_flag_override_request.g.dart';

/// UpdateEnvironementFeatureFlagOverrideRequest
///
/// Properties:
/// * [value] - The flag override value.
@BuiltValue()
abstract class UpdateEnvironementFeatureFlagOverrideRequest implements Built<UpdateEnvironementFeatureFlagOverrideRequest, UpdateEnvironementFeatureFlagOverrideRequestBuilder> {
  /// The flag override value.
  @BuiltValueField(wireName: r'value')
  String get value;

  UpdateEnvironementFeatureFlagOverrideRequest._();

  factory UpdateEnvironementFeatureFlagOverrideRequest([void Function(UpdateEnvironementFeatureFlagOverrideRequestBuilder b) updates]) = _$UpdateEnvironementFeatureFlagOverrideRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateEnvironementFeatureFlagOverrideRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateEnvironementFeatureFlagOverrideRequest> get serializer => _$UpdateEnvironementFeatureFlagOverrideRequestSerializer();
}

class _$UpdateEnvironementFeatureFlagOverrideRequestSerializer implements PrimitiveSerializer<UpdateEnvironementFeatureFlagOverrideRequest> {
  @override
  final Iterable<Type> types = const [UpdateEnvironementFeatureFlagOverrideRequest, _$UpdateEnvironementFeatureFlagOverrideRequest];

  @override
  final String wireName = r'UpdateEnvironementFeatureFlagOverrideRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateEnvironementFeatureFlagOverrideRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'value';
    yield serializers.serialize(
      object.value,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateEnvironementFeatureFlagOverrideRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateEnvironementFeatureFlagOverrideRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.value = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateEnvironementFeatureFlagOverrideRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateEnvironementFeatureFlagOverrideRequestBuilder();
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

