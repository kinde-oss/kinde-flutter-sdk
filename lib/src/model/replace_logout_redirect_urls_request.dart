//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'replace_logout_redirect_urls_request.g.dart';

/// ReplaceLogoutRedirectURLsRequest
///
/// Properties:
/// * [urls] - Array of logout urls.
@BuiltValue()
abstract class ReplaceLogoutRedirectURLsRequest implements Built<ReplaceLogoutRedirectURLsRequest, ReplaceLogoutRedirectURLsRequestBuilder> {
  /// Array of logout urls.
  @BuiltValueField(wireName: r'urls')
  BuiltList<String>? get urls;

  ReplaceLogoutRedirectURLsRequest._();

  factory ReplaceLogoutRedirectURLsRequest([void Function(ReplaceLogoutRedirectURLsRequestBuilder b) updates]) = _$ReplaceLogoutRedirectURLsRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReplaceLogoutRedirectURLsRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReplaceLogoutRedirectURLsRequest> get serializer => _$ReplaceLogoutRedirectURLsRequestSerializer();
}

class _$ReplaceLogoutRedirectURLsRequestSerializer implements PrimitiveSerializer<ReplaceLogoutRedirectURLsRequest> {
  @override
  final Iterable<Type> types = const [ReplaceLogoutRedirectURLsRequest, _$ReplaceLogoutRedirectURLsRequest];

  @override
  final String wireName = r'ReplaceLogoutRedirectURLsRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReplaceLogoutRedirectURLsRequest object, {
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
    ReplaceLogoutRedirectURLsRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReplaceLogoutRedirectURLsRequestBuilder result,
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
  ReplaceLogoutRedirectURLsRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReplaceLogoutRedirectURLsRequestBuilder();
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

