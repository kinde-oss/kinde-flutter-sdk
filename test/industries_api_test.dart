import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import '../test/test_helpers/dio_mock.dart';
import 'package:dio/dio.dart';

/// tests for IndustriesApi
void main() {
  //final instance = KindeApi().getIndustriesApi();
  Dio dio = DioAdapterMock();
  final instance = KindeApi(dio: dio).getIndustriesApi();

  group(IndustriesApi, () {
    // List industries and industry keys.
    //
    // Get a list of industries and associated industry keys.
    //
    //Future<SuccessResponse> getIndustries({ String industryKey, String name }) async
    test('test getIndustries', () async {
      // TODO
      final responseData = await instance.getIndustries();
      expect(responseData, isNotNull);
    });
  });
}
