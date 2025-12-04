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
    test('test generatePortalUrl', () async {
      final responseData = await getInstance().generatePortalUrl();
      expect(responseData, isNotNull);
    });

    test('test generatePortalUrl with subnav', () async {
      final responseData = await getInstance().generatePortalUrl(subnav: 'subnav');
      expect(responseData, isNotNull);
    });

    test('test generatePortalUrl with returnUrl', () async {
      final responseData =
          await getInstance().generatePortalUrl(returnUrl: 'returnUrl');
      expect(responseData, isNotNull);
    });

    test('test generatePortalUrl with subnav and returnUrl', () async {
      final responseData = await getInstance()
          .generatePortalUrl(subnav: 'subnav', returnUrl: 'returnUrl');
      expect(responseData, isNotNull);
    });

    test('test generatePortalUrl in success case returns PortalLink', () async {
      final responseData = await getInstance().generatePortalUrl();
      expect(responseData.data, isA<PortalLink>());
    });

    test('test generatePortalUrl in error case throws DioException', () async {
      expect(
          () async => await getInstance(dioInstance: dioError).generatePortalUrl(),
          throwsA(isA<DioException>()));
    });
  });
}
