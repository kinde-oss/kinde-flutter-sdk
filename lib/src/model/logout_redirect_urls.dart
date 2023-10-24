//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'logout_redirect_urls.g.dart';

/// LogoutRedirectUrls
///
/// Properties:
/// * [redirectUrls] - An application's logout URLs.
@BuiltValue()
abstract class LogoutRedirectUrls implements Built<LogoutRedirectUrls, LogoutRedirectUrlsBuilder> {
  /// An application's logout URLs.
  @BuiltValueField(wireName: r'redirect_urls')
  BuiltList<String>? get redirectUrls;

  LogoutRedirectUrls._();

  factory LogoutRedirectUrls([void Function(LogoutRedirectUrlsBuilder b) updates]) = _$LogoutRedirectUrls;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LogoutRedirectUrlsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LogoutRedirectUrls> get serializer => _$LogoutRedirectUrlsSerializer();
}

class _$LogoutRedirectUrlsSerializer implements PrimitiveSerializer<LogoutRedirectUrls> {
  @override
  final Iterable<Type> types = const [LogoutRedirectUrls, _$LogoutRedirectUrls];

  @override
  final String wireName = r'LogoutRedirectUrls';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LogoutRedirectUrls object, {
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
    LogoutRedirectUrls object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LogoutRedirectUrlsBuilder result,
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
  LogoutRedirectUrls deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LogoutRedirectUrlsBuilder();
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

