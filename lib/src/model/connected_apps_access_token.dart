//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'connected_apps_access_token.g.dart';

/// ConnectedAppsAccessToken
///
/// Properties:
/// * [accessToken] - The access token to access a third-party provider.
/// * [accessTokenExpiry] - The date and time that the access token expires.
@BuiltValue()
abstract class ConnectedAppsAccessToken implements Built<ConnectedAppsAccessToken, ConnectedAppsAccessTokenBuilder> {
  /// The access token to access a third-party provider.
  @BuiltValueField(wireName: r'access_token')
  String? get accessToken;

  /// The date and time that the access token expires.
  @BuiltValueField(wireName: r'access_token_expiry')
  String? get accessTokenExpiry;

  ConnectedAppsAccessToken._();

  factory ConnectedAppsAccessToken([void Function(ConnectedAppsAccessTokenBuilder b) updates]) = _$ConnectedAppsAccessToken;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConnectedAppsAccessTokenBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConnectedAppsAccessToken> get serializer => _$ConnectedAppsAccessTokenSerializer();
}

class _$ConnectedAppsAccessTokenSerializer implements PrimitiveSerializer<ConnectedAppsAccessToken> {
  @override
  final Iterable<Type> types = const [ConnectedAppsAccessToken, _$ConnectedAppsAccessToken];

  @override
  final String wireName = r'ConnectedAppsAccessToken';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConnectedAppsAccessToken object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.accessToken != null) {
      yield r'access_token';
      yield serializers.serialize(
        object.accessToken,
        specifiedType: const FullType(String),
      );
    }
    if (object.accessTokenExpiry != null) {
      yield r'access_token_expiry';
      yield serializers.serialize(
        object.accessTokenExpiry,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConnectedAppsAccessToken object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConnectedAppsAccessTokenBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'access_token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.accessToken = valueDes;
          break;
        case r'access_token_expiry':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.accessTokenExpiry = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConnectedAppsAccessToken deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConnectedAppsAccessTokenBuilder();
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

