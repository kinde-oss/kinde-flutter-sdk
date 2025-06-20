//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_organization_users_request_users_inner.g.dart';

/// UpdateOrganizationUsersRequestUsersInner
///
/// Properties:
/// * [id] - The users id.
/// * [operation] - Optional operation, set to 'delete' to remove the user from the organization.
/// * [roles] - Role keys to assign to the user.
/// * [permissions] - Permission keys to assign to the user.
@BuiltValue()
abstract class UpdateOrganizationUsersRequestUsersInner
    implements
        Built<
          UpdateOrganizationUsersRequestUsersInner,
          UpdateOrganizationUsersRequestUsersInnerBuilder
        > {
  /// The users id.
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Optional operation, set to 'delete' to remove the user from the organization.
  @BuiltValueField(wireName: r'operation')
  String? get operation;

  /// Role keys to assign to the user.
  @BuiltValueField(wireName: r'roles')
  BuiltList<String>? get roles;

  /// Permission keys to assign to the user.
  @BuiltValueField(wireName: r'permissions')
  BuiltList<String>? get permissions;

  UpdateOrganizationUsersRequestUsersInner._();

  factory UpdateOrganizationUsersRequestUsersInner([
    void Function(UpdateOrganizationUsersRequestUsersInnerBuilder b) updates,
  ]) = _$UpdateOrganizationUsersRequestUsersInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateOrganizationUsersRequestUsersInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateOrganizationUsersRequestUsersInner> get serializer =>
      _$UpdateOrganizationUsersRequestUsersInnerSerializer();
}

class _$UpdateOrganizationUsersRequestUsersInnerSerializer
    implements PrimitiveSerializer<UpdateOrganizationUsersRequestUsersInner> {
  @override
  final Iterable<Type> types = const [
    UpdateOrganizationUsersRequestUsersInner,
    _$UpdateOrganizationUsersRequestUsersInner,
  ];

  @override
  final String wireName = r'UpdateOrganizationUsersRequestUsersInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateOrganizationUsersRequestUsersInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.operation != null) {
      yield r'operation';
      yield serializers.serialize(
        object.operation,
        specifiedType: const FullType(String),
      );
    }
    if (object.roles != null) {
      yield r'roles';
      yield serializers.serialize(
        object.roles,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.permissions != null) {
      yield r'permissions';
      yield serializers.serialize(
        object.permissions,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateOrganizationUsersRequestUsersInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(
      serializers,
      object,
      specifiedType: specifiedType,
    ).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateOrganizationUsersRequestUsersInnerBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.id = valueDes;
          break;
        case r'operation':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.operation = valueDes;
          break;
        case r'roles':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(String),
                    ]),
                  )
                  as BuiltList<String>;
          result.roles.replace(valueDes);
          break;
        case r'permissions':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(String),
                    ]),
                  )
                  as BuiltList<String>;
          result.permissions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateOrganizationUsersRequestUsersInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateOrganizationUsersRequestUsersInnerBuilder();
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
