import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:dio/dio.dart';
import '../test/test_helpers/dio_mock.dart';

/// tests for ConnectedAppsApi
void main() {
  Dio dio = DioAdapterMock();
  ConnectedAppsApi instance = KindeApi(dio: dio).getConnectedAppsApi();
  //final instance = KindeApi().getConnectedAppsApi();

  group(ConnectedAppsApi, () {
    // Get Connected App URL
    //
    // Get a URL that authenticates and authorizes a user to a third-party connected app.
    //
    //Future<ConnectedAppsAuthUrl> getConnectedAppAuthUrl(String keyCodeRef, String userId) async
    test('test getConnectedAppAuthUrl', () async {
      // TODO
      final responseData = await instance.getConnectedAppAuthUrl(
        keyCodeRef: 'test_keyCodeRef',
        userId: 'test_userId',
      );
      expect(responseData, isNotNull);
    });

    // Get Connected App Token
    //
    // Get an access token that can be used to call the third-party provider linked to the connected app.
    //
    //Future<ConnectedAppsAccessToken> getConnectedAppToken(String sessionId) async
    test('test getConnectedAppToken', () async {
      // TODO
      final responseData = await instance.getConnectedAppToken(
        sessionId: 'test_sessionId',
      );
      expect(responseData, isNotNull);
    });

    // Revoke Connected App Token
    //
    // Revoke the tokens linked to the connected app session.
    //
    //Future<SuccessResponse> revokeConnectedAppToken(String sessionId) async
    test('test revokeConnectedAppToken', () async {
      // TODO
      final responseData = await instance.revokeConnectedAppToken(
        sessionId: 'test_sessionId',
      );
      expect(responseData, isNotNull);
    });
  });
}
