//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'replace_redirect_callback_urls_request.g.dart';

/// ReplaceRedirectCallbackURLsRequest
///
/// Properties:
/// * [urls] - Array of callback urls.
@BuiltValue()
abstract class ReplaceRedirectCallbackURLsRequest implements Built<ReplaceRedirectCallbackURLsRequest, ReplaceRedirectCallbackURLsRequestBuilder> {
  /// Array of callback urls.
  @BuiltValueField(wireName: r'urls')
  BuiltList<String>? get urls;

  ReplaceRedirectCallbackURLsRequest._();

  factory ReplaceRedirectCallbackURLsRequest([void updates(ReplaceRedirectCallbackURLsRequestBuilder b)]) = _$ReplaceRedirectCallbackURLsRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReplaceRedirectCallbackURLsRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReplaceRedirectCallbackURLsRequest> get serializer => _$ReplaceRedirectCallbackURLsRequestSerializer();
}

class _$ReplaceRedirectCallbackURLsRequestSerializer implements PrimitiveSerializer<ReplaceRedirectCallbackURLsRequest> {
  @override
  final Iterable<Type> types = const [ReplaceRedirectCallbackURLsRequest, _$ReplaceRedirectCallbackURLsRequest];

  @override
  final String wireName = r'ReplaceRedirectCallbackURLsRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReplaceRedirectCallbackURLsRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.urls != null) {
      yield r'urls';
      yield serializers.serialize(
        object.urls,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReplaceRedirectCallbackURLsRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReplaceRedirectCallbackURLsRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'urls':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.urls.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReplaceRedirectCallbackURLsRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReplaceRedirectCallbackURLsRequestBuilder();
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

