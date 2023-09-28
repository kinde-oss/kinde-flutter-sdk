import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for CreateSubscriberSuccessResponseSubscriber
void main() {
  final instance = CreateSubscriberSuccessResponseSubscriberBuilder();
  // TODO add properties to the builder and call build()

  group(CreateSubscriberSuccessResponseSubscriber, () {
    // A unique identifier for the subscriber.
    // String subscriberId
    test('to test the property `subscriberId`', () async {
      // TODO
      final subscriberId = instance.subscriberId;
      expect(subscriberId, isNull);
      instance.subscriberId = 'subscriberId';
      final result = instance.build();
      expect(result, isA<CreateSubscriberSuccessResponseSubscriber>());
      expect(result.subscriberId, isA<String>());
      expect(result.subscriberId, isNotNull);
      expect(result.subscriberId, equals('subscriberId'));
    });
  });
}
