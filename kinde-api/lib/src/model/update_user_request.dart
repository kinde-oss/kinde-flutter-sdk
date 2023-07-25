//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_user_request.g.dart';

/// UpdateUserRequest
///
/// Properties:
/// * [givenName] - User's first name.
/// * [familyName] - User's last name.
/// * [isSuspended] - Whether the user is currently suspended or not.
/// * [isPasswordResetRequested] - Prompt the user to change their password on next sign in.
@BuiltValue()
abstract class UpdateUserRequest implements Built<UpdateUserRequest, UpdateUserRequestBuilder> {
  /// User's first name.
  @BuiltValueField(wireName: r'given_name')
  String? get givenName;

  /// User's last name.
  @BuiltValueField(wireName: r'family_name')
  String? get familyName;

  /// Whether the user is currently suspended or not.
  @BuiltValueField(wireName: r'is_suspended')
  bool? get isSuspended;

  /// Prompt the user to change their password on next sign in.
  @BuiltValueField(wireName: r'is_password_reset_requested')
  bool? get isPasswordResetRequested;

  UpdateUserRequest._();

  factory UpdateUserRequest([void updates(UpdateUserRequestBuilder b)]) = _$UpdateUserRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateUserRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateUserRequest> get serializer => _$UpdateUserRequestSerializer();
}

class _$UpdateUserRequestSerializer implements PrimitiveSerializer<UpdateUserRequest> {
  @override
  final Iterable<Type> types = const [UpdateUserRequest, _$UpdateUserRequest];

  @override
  final String wireName = r'UpdateUserRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateUserRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateUserRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateUserRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateUserRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateUserRequestBuilder();
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

