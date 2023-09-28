//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:kinde_flutter_sdk/src/model/update_api_applications_request_applications_inner.dart';

part 'update_api_applications_request.g.dart';

/// UpdateAPIApplicationsRequest
///
/// Properties:
/// * [applications]
@BuiltValue()
abstract class UpdateAPIApplicationsRequest implements Built<UpdateAPIApplicationsRequest, UpdateAPIApplicationsRequestBuilder> {
  @BuiltValueField(wireName: r'applications')
  BuiltList<UpdateAPIApplicationsRequestApplicationsInner> get applications;

  UpdateAPIApplicationsRequest._();

  factory UpdateAPIApplicationsRequest([void Function(UpdateAPIApplicationsRequestBuilder b) updates]) = _$UpdateAPIApplicationsRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateAPIApplicationsRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateAPIApplicationsRequest> get serializer => _$UpdateAPIApplicationsRequestSerializer();
}

class _$UpdateAPIApplicationsRequestSerializer implements PrimitiveSerializer<UpdateAPIApplicationsRequest> {
  @override
  final Iterable<Type> types = const [UpdateAPIApplicationsRequest, _$UpdateAPIApplicationsRequest];

  @override
  final String wireName = r'UpdateAPIApplicationsRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateAPIApplicationsRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'applications';
    yield serializers.serialize(
      object.applications,
      specifiedType: const FullType(BuiltList, [FullType(UpdateAPIApplicationsRequestApplicationsInner)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateAPIApplicationsRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateAPIApplicationsRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'applications':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UpdateAPIApplicationsRequestApplicationsInner)]),
          ) as BuiltList<UpdateAPIApplicationsRequestApplicationsInner>;
          result.applications.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateAPIApplicationsRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateAPIApplicationsRequestBuilder();
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

