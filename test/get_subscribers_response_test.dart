import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for GetSubscribersResponse
void main() {
  final instance = GetSubscribersResponseBuilder();
  // TODO add properties to the builder and call build()

  group(GetSubscribersResponse, () {
    // Response code.
    // String code
    test('to test the property `code`', () async {
      // TODO
      final code = instance.code;
      expect(code, isNull);
      instance.code = 'code';
      final result = instance.build();
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
      instance.message = 'message';
      final result = instance.build();
      expect(result.message, isA<String>());
      expect(result.message, isNotNull);
      expect(result.message, equals('message'));
    });

    // BuiltList<SubscribersSubscriber> subscribers
    test('to test the property `subscribers`', () async {
      // TODO
      final subscribers = instance.subscribers;
      expect(subscribers.length, isZero);
      SubscribersSubscriber subscriberSubscriber = SubscribersSubscriber();
      instance.subscribers.add(subscriberSubscriber);
      final result = instance.build();
      expect(result, isA<GetSubscribersResponse>());
      expect(result.subscribers, isA<BuiltList<SubscribersSubscriber>?>());
      expect(result.subscribers?.length, isNonZero);
    });

    // Pagination token.
    // String nextToken
    test('to test the property `nextToken`', () async {
      // TODO
      final nextToken = instance.nextToken;
      expect(nextToken, isNull);
      instance.nextToken = 'nextToken';
      final result = instance.build();
      expect(result, isA<GetSubscribersResponse>());
      expect(result.nextToken, isA<String>());
      expect(result.nextToken, isNotNull);
      expect(result.nextToken, equals('nextToken'));
    });
  });
}
