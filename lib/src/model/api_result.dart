//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_result.g.dart';

/// ApiResult
///
/// Properties:
/// * [result] - The result of the api operation.
@BuiltValue()
abstract class ApiResult implements Built<ApiResult, ApiResultBuilder> {
  /// The result of the api operation.
  @BuiltValueField(wireName: r'result')
  String? get result;

  ApiResult._();

  factory ApiResult([void Function(ApiResultBuilder b) updates]) = _$ApiResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiResult> get serializer => _$ApiResultSerializer();
}

class _$ApiResultSerializer implements PrimitiveSerializer<ApiResult> {
  @override
  final Iterable<Type> types = const [ApiResult, _$ApiResult];

  @override
  final String wireName = r'ApiResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.result != null) {
      yield r'result';
      yield serializers.serialize(
        object.result,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApiResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApiResultBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'result':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.result = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApiResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiResultBuilder();
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

