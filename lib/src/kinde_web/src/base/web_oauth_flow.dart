import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:kinde_flutter_sdk/src/additional_params.dart';
import 'package:kinde_flutter_sdk/src/utils/kinde_debug_print.dart';
import 'package:oauth2/oauth2.dart';

import '../utils/cross_platform_support.dart';

const int _httpDefaultPort = 80;
const int _httpsDefaultPort = 443;

abstract class WebOAuthFlow {
  static Future<void> login(AuthorizationRequest configuration,
      InternalAdditionalParameters additionalParameters) async {
    final initialUri = _getInitialUrl(
        configuration: configuration,
        additionalParameters: additionalParameters);
    WebUtils.replacePage(initialUri.toString());
  }

  static Future<Credentials?> finishLogin({
    required AuthorizationCodeGrant authorizationCodeGrant,
    required String redirectUrl,
    required String responseUrl,
    required String authRequestState,
    required List<String> scopes,
  }) async {
    try {
      final Uri responseUri = Uri.parse(responseUrl);

      ///preparing for handling authorization response
      authorizationCodeGrant.getAuthorizationUrl(Uri.parse(redirectUrl),
          scopes: scopes, state: authRequestState);

      ///throws KindeError with code=not-redirect-url
      _compareActualRedirectUriWithExpected(
          actual: responseUri, expected: redirectUrl);

      ///Get client credentials
      final client = await authorizationCodeGrant
          .handleAuthorizationResponse(responseUri.queryParameters);
      return client.credentials;
    } catch (e, st) {
      throw KindeError.fromError(e, st);
    }
  }

  /// Ensures the responseRedirect matches a known valid redirect URL,
  /// throws KindeError with code=not=redirect-url
  static void _compareActualRedirectUriWithExpected(
      {required Uri actual, required String expected}) {
    final Uri validUri = Uri.parse(expected);

    if (_urisMatch(actual, validUri)) {
      return;
    }

    final comparingSummary = '''
    Expected: $validUri,
    Actual: ${actual.toString()}
  ''';

    kindeDebugPrint(methodName: "isValidRedirect", message: comparingSummary);
    throw KindeError(
        code: KindeErrorCode.notRedirect, message: comparingSummary);
  }

  /// Ignoring query parameters.
  /// Returns the default port for a given URL scheme.
  /// Falls back to 0 for unknown schemes, effectively treating the port as unknown,
  /// which may skip port-based matching in comparisons.
  static bool _urisMatch(Uri a, Uri b) {
    final int aPort = a.hasPort ? a.port : _defaultPort(a.scheme);
    final int bPort = b.hasPort ? b.port : _defaultPort(b.scheme);

    return a.scheme == b.scheme &&
        a.host == b.host &&
        aPort == bPort &&
        a.path == b.path;
  }

  static int _defaultPort(String scheme) {
    if (scheme == 'https') return _httpsDefaultPort;
    if (scheme == 'http') return _httpDefaultPort;

    throw KindeError(
      code: KindeErrorCode.unsupportedScheme,
      message:
          'Unsupported URI scheme: "$scheme". Only "https" and "http" are allowed.',
    );
  }

  static Uri _getInitialUrl({
    required AuthorizationRequest configuration,
    required InternalAdditionalParameters additionalParameters,
  }) {
    final redirectUrl = configuration.redirectUrl;

    final authorizationCodeGrant = AuthorizationCodeGrant(
      configuration.clientId,
      Uri.parse(configuration.serviceConfiguration!.authorizationEndpoint),
      Uri.parse(configuration.serviceConfiguration!.tokenEndpoint),
      codeVerifier: additionalParameters.codeVerifier,
      basicAuth: true,
    );

    Uri initialUri = authorizationCodeGrant.getAuthorizationUrl(
      Uri.parse(redirectUrl),
    );

    final Map<String, String> queryParameters =
        Map.from(initialUri.queryParameters);

    for (final param in additionalParameters.toWebParams().entries) {
      queryParameters.putIfAbsent(param.key, () => param.value);
    }

    initialUri = initialUri.replace(queryParameters: queryParameters);
    return initialUri;
  }
}
