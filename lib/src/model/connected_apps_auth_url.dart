//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connected_apps_auth_url.g.dart';

/// ConnectedAppsAuthUrl
///
/// Properties:
/// * [url] - A URL that is used to authenticate an end-user against a connected app.
/// * [sessionId] - A unique identifier for the login session.
@BuiltValue()
abstract class ConnectedAppsAuthUrl implements Built<ConnectedAppsAuthUrl, ConnectedAppsAuthUrlBuilder> {
  /// A URL that is used to authenticate an end-user against a connected app.
  @BuiltValueField(wireName: r'url')
  String? get url;

  /// A unique identifier for the login session.
  @BuiltValueField(wireName: r'session_id')
  String? get sessionId;

  ConnectedAppsAuthUrl._();

  factory ConnectedAppsAuthUrl([void Function(ConnectedAppsAuthUrlBuilder b) updates]) = _$ConnectedAppsAuthUrl;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectedAppsAuthUrlBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectedAppsAuthUrl> get serializer => _$ConnectedAppsAuthUrlSerializer();
}

class _$ConnectedAppsAuthUrlSerializer implements PrimitiveSerializer<ConnectedAppsAuthUrl> {
  @override
  final Iterable<Type> types = const [ConnectedAppsAuthUrl, _$ConnectedAppsAuthUrl];

  @override
  final String wireName = r'ConnectedAppsAuthUrl';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectedAppsAuthUrl object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.url != null) {
      yield r'url';
      yield serializers.serialize(
        object.url,
        specifiedType: const FullType(String),
      );
    }
    if (object.sessionId != null) {
      yield r'session_id';
      yield serializers.serialize(
        object.sessionId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectedAppsAuthUrl object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConnectedAppsAuthUrlBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.url = valueDes;
          break;
        case r'session_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sessionId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectedAppsAuthUrl deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectedAppsAuthUrlBuilder();
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

