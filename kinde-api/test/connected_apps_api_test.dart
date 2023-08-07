import 'package:test/test.dart';
import 'package:kinde_api/kinde_api.dart';


/// tests for ConnectedAppsApi
void main() {
  final instance = KindeApi().getConnectedAppsApi();

  group(ConnectedAppsApi, () {
    // Get Connected App URL
    //
    // Get a URL that authenticates and authorizes a user to a third-party connected app.
    //
    //Future<ConnectedAppsAuthUrl> getConnectedAppAuthUrl(String keyCodeRef, String userId) async
    test('test getConnectedAppAuthUrl', () async {
      // TODO
    });

    // Get Connected App Token
    //
    // Get an access token that can be used to call the third-party provider linked to the connected app.
    //
    //Future<ConnectedAppsAccessToken> getConnectedAppToken(String sessionId) async
    test('test getConnectedAppToken', () async {
      // TODO
    });

    // Revoke Connected App Token
    //
    // Revoke the tokens linked to the connected app session.
    //
    //Future<SuccessResponse> revokeConnectedAppToken(String sessionId) async
    test('test revokeConnectedAppToken', () async {
      // TODO
    });

  });
}
