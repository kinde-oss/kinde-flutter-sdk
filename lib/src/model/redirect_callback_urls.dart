//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'redirect_callback_urls.g.dart';

/// RedirectCallbackUrls
///
/// Properties:
/// * [redirectUrls] - An application's redirect URLs.
@BuiltValue()
abstract class RedirectCallbackUrls implements Built<RedirectCallbackUrls, RedirectCallbackUrlsBuilder> {
  /// An application's redirect URLs.
  @BuiltValueField(wireName: r'redirect_urls')
  BuiltList<String>? get redirectUrls;

  RedirectCallbackUrls._();

  factory RedirectCallbackUrls([void Function(RedirectCallbackUrlsBuilder b) updates]) = _$RedirectCallbackUrls;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RedirectCallbackUrlsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RedirectCallbackUrls> get serializer => _$RedirectCallbackUrlsSerializer();
}

class _$RedirectCallbackUrlsSerializer implements PrimitiveSerializer<RedirectCallbackUrls> {
  @override
  final Iterable<Type> types = const [RedirectCallbackUrls, _$RedirectCallbackUrls];

  @override
  final String wireName = r'RedirectCallbackUrls';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RedirectCallbackUrls object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.redirectUrls != null) {
      yield r'redirect_urls';
      yield serializers.serialize(
        object.redirectUrls,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RedirectCallbackUrls object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RedirectCallbackUrlsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'redirect_urls':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.redirectUrls.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RedirectCallbackUrls deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RedirectCallbackUrlsBuilder();
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

