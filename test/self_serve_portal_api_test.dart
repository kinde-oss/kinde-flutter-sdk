import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';

import 'test_helpers/dio_mock.dart';

/// tests for SelfServePortalApi
void main() {
  Dio dioSuccess = DioAdapterMock();
  final dioError = DioAdapterMockError();

  SelfServePortalApi getInstance({
    Dio? dioInstance,
  }) {
    return KindeApi(dio: dioInstance ?? dioSuccess).getSelfServePortalApi();
  }

  group(SelfServePortalApi, () {
    test('test getPortalLink', () async {
      final responseData = await getInstance().getPortalLink();
      expect(responseData, isNotNull);
    });

    test('test getPortalLink with subnav', () async {
      final responseData = await getInstance().getPortalLink(subnav: 'subnav');
      expect(responseData, isNotNull);
    });

    test('test getPortalLink with returnUrl', () async {
      final responseData =
          await getInstance().getPortalLink(returnUrl: 'returnUrl');
      expect(responseData, isNotNull);
    });

    test('test getPortalLink with subnav and returnUrl', () async {
      final responseData = await getInstance()
          .getPortalLink(subnav: 'subnav', returnUrl: 'returnUrl');
      expect(responseData, isNotNull);
    });

    test('test getPortalLink in success case returns PortalLink', () async {
      final responseData = await getInstance().getPortalLink();
      expect(responseData.data, isA<PortalLink>());
    });

    test('test getPortalLink in error case throws DioException', () async {
      expect(
          () async => await getInstance(dioInstance: dioError).getPortalLink(),
          throwsA(isA<DioException>()));
    });
  });
}
