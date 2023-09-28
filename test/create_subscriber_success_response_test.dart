import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for CreateSubscriberSuccessResponse
void main() {
  final instance = CreateSubscriberSuccessResponseBuilder();
  // TODO add properties to the builder and call build()

  group(CreateSubscriberSuccessResponse, () {
    // CreateSubscriberSuccessResponseSubscriber subscriber
    test('to test the property `subscriber`', () async {
      // TODO
      final subscriber = instance.subscriber;
      expect(
          subscriber, isA<CreateSubscriberSuccessResponseSubscriberBuilder>());
      CreateSubscriberSuccessResponseSubscriberBuilder subscriberBuilder =
          CreateSubscriberSuccessResponseSubscriberBuilder();
      subscriberBuilder.subscriberId = "subscriberId";
      instance.subscriber = subscriberBuilder;
      final result = instance.build();
      expect(result, isA<CreateSubscriberSuccessResponse>());
      expect(result.subscriber?.subscriberId, isA<String?>());
      expect(result.subscriber, isNotNull);
      expect(result.subscriber?.subscriberId, equals('subscriberId'));
    });
  });
}
