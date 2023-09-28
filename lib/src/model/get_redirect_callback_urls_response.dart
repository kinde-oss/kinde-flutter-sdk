//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:kinde_flutter_sdk/src/model/redirect_callback_urls.dart';

part 'get_redirect_callback_urls_response.g.dart';

/// GetRedirectCallbackUrlsResponse
///
/// Properties:
/// * [redirectUrls] - An application's redirect callback URLs.
@BuiltValue()
abstract class GetRedirectCallbackUrlsResponse implements Built<GetRedirectCallbackUrlsResponse, GetRedirectCallbackUrlsResponseBuilder> {
  /// An application's redirect callback URLs.
  @BuiltValueField(wireName: r'redirect_urls')
  BuiltList<RedirectCallbackUrls>? get redirectUrls;

  GetRedirectCallbackUrlsResponse._();

  factory GetRedirectCallbackUrlsResponse([void Function(GetRedirectCallbackUrlsResponseBuilder b) updates]) = _$GetRedirectCallbackUrlsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetRedirectCallbackUrlsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetRedirectCallbackUrlsResponse> get serializer => _$GetRedirectCallbackUrlsResponseSerializer();
}

class _$GetRedirectCallbackUrlsResponseSerializer implements PrimitiveSerializer<GetRedirectCallbackUrlsResponse> {
  @override
  final Iterable<Type> types = const [GetRedirectCallbackUrlsResponse, _$GetRedirectCallbackUrlsResponse];

  @override
  final String wireName = r'GetRedirectCallbackUrlsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetRedirectCallbackUrlsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.redirectUrls != null) {
      yield r'redirect_urls';
      yield serializers.serialize(
        object.redirectUrls,
        specifiedType: const FullType(BuiltList, [FullType(RedirectCallbackUrls)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetRedirectCallbackUrlsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetRedirectCallbackUrlsResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'redirect_urls':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(RedirectCallbackUrls)]),
          ) as BuiltList<RedirectCallbackUrls>;
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
  GetRedirectCallbackUrlsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetRedirectCallbackUrlsResponseBuilder();
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

