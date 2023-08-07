import 'package:test/test.dart';
import 'package:kinde_api/kinde_api.dart';


/// tests for TimezonesApi
void main() {
  final instance = KindeApi().getTimezonesApi();

  group(TimezonesApi, () {
    // List timezones and timezone IDs.
    //
    // Get a list of timezones and associated timezone keys.
    //
    //Future<SuccessResponse> getTimezones({ String timezoneKey, String name }) async
    test('test getTimezones', () async {
      // TODO
    });

  });
}
