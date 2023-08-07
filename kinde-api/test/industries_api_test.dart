import 'package:test/test.dart';
import 'package:kinde_api/kinde_api.dart';


/// tests for IndustriesApi
void main() {
  final instance = KindeApi().getIndustriesApi();

  group(IndustriesApi, () {
    // List industries and industry keys.
    //
    // Get a list of industries and associated industry keys.
    //
    //Future<SuccessResponse> getIndustries({ String industryKey, String name }) async
    test('test getIndustries', () async {
      // TODO
    });

  });
}
