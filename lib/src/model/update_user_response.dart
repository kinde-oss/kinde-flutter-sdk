//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_user_response.g.dart';

/// UpdateUserResponse
///
/// Properties:
/// * [id] - Unique id of the user in Kinde.
/// * [givenName] - User's first name.
/// * [familyName] - User's last name.
/// * [email] - User's preferred email.
/// * [isSuspended] - Whether the user is currently suspended or not.
/// * [isPasswordResetRequested] - Whether a password reset has been requested.
/// * [picture] - User's profile picture URL.
@BuiltValue()
abstract class UpdateUserResponse implements Built<UpdateUserResponse, UpdateUserResponseBuilder> {
  /// Unique id of the user in Kinde.
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// User's first name.
  @BuiltValueField(wireName: r'given_name')
  String? get givenName;

  /// User's last name.
  @BuiltValueField(wireName: r'family_name')
  String? get familyName;

  /// User's preferred email.
  @BuiltValueField(wireName: r'email')
  String? get email;

  /// Whether the user is currently suspended or not.
  @BuiltValueField(wireName: r'is_suspended')
  bool? get isSuspended;

  /// Whether a password reset has been requested.
  @BuiltValueField(wireName: r'is_password_reset_requested')
  bool? get isPasswordResetRequested;

  /// User's profile picture URL.
  @BuiltValueField(wireName: r'picture')
  String? get picture;

  UpdateUserResponse._();

  factory UpdateUserResponse([void Function(UpdateUserResponseBuilder b) updates]) = _$UpdateUserResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateUserResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateUserResponse> get serializer => _$UpdateUserResponseSerializer();
}

class _$UpdateUserResponseSerializer implements PrimitiveSerializer<UpdateUserResponse> {
  @override
  final Iterable<Type> types = const [UpdateUserResponse, _$UpdateUserResponse];

  @override
  final String wireName = r'UpdateUserResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateUserResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.givenName != null) {
      yield r'given_name';
      yield serializers.serialize(
        object.givenName,
        specifiedType: const FullType(String),
      );
    }
    if (object.familyName != null) {
      yield r'family_name';
      yield serializers.serialize(
        object.familyName,
        specifiedType: const FullType(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
    if (object.isSuspended != null) {
      yield r'is_suspended';
      yield serializers.serialize(
        object.isSuspended,
        specifiedType: const FullType(bool),
      );
    }
    if (object.isPasswordResetRequested != null) {
      yield r'is_password_reset_requested';
      yield serializers.serialize(
        object.isPasswordResetRequested,
        specifiedType: const FullType(bool),
      );
    }
    if (object.picture != null) {
      yield r'picture';
      yield serializers.serialize(
        object.picture,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateUserResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateUserResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'given_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.givenName = valueDes;
          break;
        case r'family_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.familyName = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'is_suspended':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isSuspended = valueDes;
          break;
        case r'is_password_reset_requested':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPasswordResetRequested = valueDes;
          break;
        case r'picture':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.picture = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateUserResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateUserResponseBuilder();
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

