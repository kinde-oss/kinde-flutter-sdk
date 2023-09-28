import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:dio/dio.dart';
import '../test/test_helpers/dio_mock.dart';

/// tests for SubscribersApi
void main() {
  //final instance = KindeApi().getSubscribersApi();
  Dio dio = DioAdapterMock();
  final instance = KindeApi(dio: dio).getSubscribersApi();

  group(SubscribersApi, () {
    // Create Subscriber
    //
    // Create subscriber.
    //
    //Future<CreateSubscriberSuccessResponse> createSubscriber(String firstName, String lastName, String email) async
    test('test createSubscriber', () async {
      // TODO
      final responseData = await instance.createSubscriber(
        firstName: 'test_firstName',
        lastName: 'test_lastName',
        email: 'test_email',
      );
      expect(responseData, isNotNull);
    });

    // Get Subscriber
    //
    // Retrieve a subscriber record.
    //
    //Future<GetSubscriberResponse> getSubscriber(String subscriberId) async
    test('test getSubscriber', () async {
      // TODO
      final responseData = await instance.getSubscriber(
        subscriberId: 'test_subscriberId',
      );
      expect(responseData, isNotNull);
    });

    // List Subscribers
    //
    // The returned list can be sorted by full name or email address in ascending or descending order. The number of records to return at a time can also be controlled using the `page_size` query string parameter.
    //
    //Future<GetSubscribersResponse> getSubscribers({ String sort, int pageSize, String nextToken }) async
    test('test getSubscribers', () async {
      // TODO
      final responseData = await instance.getSubscribers();
      expect(responseData, isNotNull);
    });
  });
}
