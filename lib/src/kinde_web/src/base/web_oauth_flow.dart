import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:kinde_flutter_sdk/src/utils/kinde_debug_print.dart';
import 'package:kinde_flutter_sdk/src/utils/kinde_secure_storage.dart';
import 'package:oauth2/oauth2.dart';

import '../utils/cross_platform_support.dart';

const int _httpDefaultPort = 80;
const int _httpsDefaultPort = 443;

abstract class WebOAuthFlow {
  static Future<void> login(
    AuthorizationRequest configuration, {
    required String codeVerifier,
  }) async {
    final String authState = generateAuthState();
    try {
      await KindeSecureStorage.instance.saveAuthRequestState(authState);
    } catch (e, st) {
      throw KindeError(
          code: KindeErrorCode.unknown, message: e.toString(), stackTrace: st);
    }
    final initialUri = _getInitialUrl(
        configuration: configuration,
        codeVerifier: codeVerifier,
        authState: authState);
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
      final Uri responseUri = Uri.parse(_sanitizeRedirect(responseUrl));

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

  ///ignoring query parameters
  static bool _urisMatch(Uri a, Uri b) {
    return a.scheme == b.scheme &&
        a.host == b.host &&
        (a.port == b.port ||
            (a.port == 0 && _defaultPort(a.scheme) == b.port) ||
            (b.port == 0 && _defaultPort(b.scheme) == a.port)) &&
        a.path == b.path;
  }

  static int _defaultPort(String scheme) {
    return scheme == 'https'
        ? _httpsDefaultPort
        : (scheme == 'http' ? _httpDefaultPort : 0);
  }

  /// Removes URL fragments (`#` and anything after)
  static String _sanitizeRedirect(String url) {
    url = url.trim();
    final int index = url.indexOf('#');
    return index > -1 ? url.substring(0, index) : url;
  }

  static Uri _getInitialUrl({
    required AuthorizationRequest configuration,
    required String codeVerifier,
    required String authState,
  }) {
    final redirectUrl = configuration.redirectUrl;

    final authorizationCodeGrant = AuthorizationCodeGrant(
      configuration.clientId,
      Uri.parse(configuration.serviceConfiguration!.authorizationEndpoint),
      Uri.parse(configuration.serviceConfiguration!.tokenEndpoint),
      codeVerifier: codeVerifier,
      basicAuth: true,
    );

    Uri initialUri = authorizationCodeGrant.getAuthorizationUrl(
      Uri.parse(redirectUrl),
      scopes: configuration.scopes,
    );
    final queryParameters = {
      'state': authState,
      if (configuration.promptValues?.isNotEmpty ?? false)
        'prompt': configuration.promptValues!.join(' '),
    };
    for (var queryParam in initialUri.queryParameters.entries) {
      queryParameters.putIfAbsent(queryParam.key, () => queryParam.value);
    }
    initialUri = initialUri.replace(
        queryParameters: Map.from(initialUri.queryParameters)
          ..addAll(queryParameters)
          ..addAll(configuration.additionalParameters ?? {}));
    return initialUri;
  }
}
