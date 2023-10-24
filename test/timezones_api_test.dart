import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:dio/dio.dart';
import '../test/test_helpers/dio_mock.dart';

/// tests for TimezonesApi
void main() {
  // final instance = KindeApi().getTimezonesApi();
  Dio dio = DioAdapterMock();
  final instance = KindeApi(dio: dio).getTimezonesApi();
  group(TimezonesApi, () {
    // List timezones and timezone IDs.
    //
    // Get a list of timezones and associated timezone keys.
    //
    //Future<SuccessResponse> getTimezones({ String timezoneKey, String name }) async
    test('test getTimezones', () async {
      // TODO
      final responseData = await instance.getTimezones();
      expect(responseData, isNotNull);
    });
  });
}
