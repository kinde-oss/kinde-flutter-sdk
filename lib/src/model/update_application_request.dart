//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_application_request.g.dart';

/// UpdateApplicationRequest
///
/// Properties:
/// * [name] - The application's name.
/// * [languageKey] - The application's language key.
/// * [logoutUris] - The application's logout uris.
/// * [redirectUris] - The application's redirect uris.
@BuiltValue()
abstract class UpdateApplicationRequest implements Built<UpdateApplicationRequest, UpdateApplicationRequestBuilder> {
  /// The application's name.
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// The application's language key.
  @BuiltValueField(wireName: r'language_key')
  String? get languageKey;

  /// The application's logout uris.
  @BuiltValueField(wireName: r'logout_uris')
  BuiltList<String>? get logoutUris;

  /// The application's redirect uris.
  @BuiltValueField(wireName: r'redirect_uris')
  BuiltList<String>? get redirectUris;

  UpdateApplicationRequest._();

  factory UpdateApplicationRequest([void Function(UpdateApplicationRequestBuilder b) updates]) = _$UpdateApplicationRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateApplicationRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateApplicationRequest> get serializer => _$UpdateApplicationRequestSerializer();
}

class _$UpdateApplicationRequestSerializer implements PrimitiveSerializer<UpdateApplicationRequest> {
  @override
  final Iterable<Type> types = const [UpdateApplicationRequest, _$UpdateApplicationRequest];

  @override
  final String wireName = r'UpdateApplicationRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateApplicationRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.languageKey != null) {
      yield r'language_key';
      yield serializers.serialize(
        object.languageKey,
        specifiedType: const FullType(String),
      );
    }
    if (object.logoutUris != null) {
      yield r'logout_uris';
      yield serializers.serialize(
        object.logoutUris,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.redirectUris != null) {
      yield r'redirect_uris';
      yield serializers.serialize(
        object.redirectUris,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateApplicationRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateApplicationRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'language_key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.languageKey = valueDes;
          break;
        case r'logout_uris':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.logoutUris.replace(valueDes);
          break;
        case r'redirect_uris':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.redirectUris.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateApplicationRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateApplicationRequestBuilder();
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

