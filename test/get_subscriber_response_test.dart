import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for GetSubscriberResponse
void main() {
  final instance = GetSubscriberResponseBuilder();
  // TODO add properties to the builder and call build()

  group(GetSubscriberResponse, () {
    // Response code.
    // String code
    test('to test the property `code`', () async {
      // TODO
      final code = instance.code;
      expect(code, isNull);
      instance.code = 'code';
      final result = instance.build();
      expect(result, isA<GetSubscriberResponse>());
      expect(result.code, isA<String>());
      expect(result.code, isNotNull);
      expect(result.code, equals('code'));
    });

    // Response message.
    // String message
    test('to test the property `message`', () async {
      // TODO
      final message = instance.message;
      expect(message, isNull);
      instance.message = "message";
      final result = instance.build();
      expect(result, isA<GetSubscriberResponse>());
      expect(result.message, isA<String>());
      expect(result.message, isNotNull);
    });

    // BuiltList<Subscriber> subscribers
    test('to test the property `subscribers`', () async {
      // TODO
      final subscribers = instance.subscribers;
      expect(subscribers.length, isZero);
      Subscriber subscriber = Subscriber();
      instance.subscribers.add(subscriber);
      final result = instance.build();
      expect(result, isA<GetSubscriberResponse>());
      expect(result.subscribers, isA<BuiltList<Subscriber>?>());
      expect(result.subscribers?.length, isNonZero);
    });
  });
}
