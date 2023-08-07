import 'package:test/test.dart';
import 'package:kinde_api/kinde_api.dart';


/// tests for SubscribersApi
void main() {
  final instance = KindeApi().getSubscribersApi();

  group(SubscribersApi, () {
    // Create Subscriber
    //
    // Create subscriber.
    //
    //Future<CreateSubscriberSuccessResponse> createSubscriber(String firstName, String lastName, String email) async
    test('test createSubscriber', () async {
      // TODO
    });

    // Get Subscriber
    //
    // Retrieve a subscriber record. 
    //
    //Future<GetSubscriberResponse> getSubscriber(String subscriberId) async
    test('test getSubscriber', () async {
      // TODO
    });

    // List Subscribers
    //
    // The returned list can be sorted by full name or email address in ascending or descending order. The number of records to return at a time can also be controlled using the `page_size` query string parameter. 
    //
    //Future<GetSubscribersResponse> getSubscribers({ String sort, int pageSize, String nextToken }) async
    test('test getSubscribers', () async {
      // TODO
    });

  });
}
