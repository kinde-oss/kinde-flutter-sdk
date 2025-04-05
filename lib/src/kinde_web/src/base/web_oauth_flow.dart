import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:kinde_flutter_sdk/src/utils/kinde_debug_print.dart';
import 'package:kinde_flutter_sdk/src/utils/kinde_secure_storage.dart';
import 'package:oauth2/oauth2.dart';

import '../utils/cross_platform_support.dart';

const int _httpDefaultPort = 4;
const int _httpsDefaultPort = 443;

abstract class WebOAuthFlow {
  static Future<Credentials?> _getClientCredentials({
    required List<String> scopes,
    required String redirectUrl,
    required AuthorizationCodeGrant authorizationCodeGrant,
    required Uri responseUri,
  }) async {
    try {
      final parameters = responseUri.queryParameters;

      if (parameters.isEmpty) {
        kindeDebugPrint(
            methodName: "getClientCredentials",
            message: "parameters are empty");
        return null;
      }

      authorizationCodeGrant.getAuthorizationUrl(
        Uri.parse(redirectUrl),
        scopes: scopes,
      );

      final client =
          await authorizationCodeGrant.handleAuthorizationResponse(parameters);
      return client.credentials;
    } catch (e, st) {
      _handleError(e, st);
      return null;
    }
  }

  static void _handleError(Object error, StackTrace st) {
    {
      if (error is AuthorizationException) {
        throw AuthorizationKindeError.fromOauth2Exception(error);
      }

      throw KindeError(
          code: KindeErrorCode.unknown,
          message: error.toString(),
          stackTrace: st);
    }
  }

  static void login(
    AuthorizationRequest configuration, {
    required String codeVerifier,
  }) {
    final String authState = generateAuthState();
    KindeSecureStorage.instance.saveAuthRequestState(authState).then((_) {
      final initialUri = _getInitialUrl(
          configuration: configuration,
          codeVerifier: codeVerifier,
          authState: authState);
      WebUtils.replacePage(initialUri.toString());
    });
  }

  static Future<Credentials?> finishLogin({
    required AuthorizationCodeGrant authorizationCodeGrant,
    required String redirectUrl,
    required String responseUrl,
    required String authRequestState,
    required List<String> scopes,
  }) async {
    final Uri responseUri = Uri.parse(_sanitizeRedirect(responseUrl));
    if (responseUri.queryParameters['state'] != authRequestState) {
      throw const KindeError(
          code: KindeErrorCode.authStateNotMatch,
          message: "Stored state is not equal state in response.");
    }

    if (!_isValidRedirect(responseUri, redirectUrl)) {
      return null;
    }
    try {
      final credentials = await _getClientCredentials(
          scopes: scopes,
          authorizationCodeGrant: authorizationCodeGrant,
          responseUri: responseUri,
          redirectUrl: redirectUrl);

      return credentials;
    } catch (e, st) {
      throw KindeError.fromError(e, st);
    }
  }

  /// Ensures the responseRedirect matches a known valid redirect URL
  static bool _isValidRedirect(
      Uri actualRedirectUri, String expectedRedirectUrl) {
    final Uri validUri = Uri.parse(expectedRedirectUrl);

    if (_urisMatch(actualRedirectUri, validUri)) {
      return true;
    }

    kindeDebugPrint(methodName: "isValidRedirect", message: '''
    Expected: $validUri,
    Actual: ${actualRedirectUri.toString()}
  ''');

    return false;
  }

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
    Uri initialUri = Uri();

    final redirectUrl = configuration.redirectUrl;

    final authorizationCodeGrant = AuthorizationCodeGrant(
      configuration.clientId,
      Uri.parse(configuration.serviceConfiguration!.authorizationEndpoint),
      Uri.parse(configuration.serviceConfiguration!.tokenEndpoint),
      codeVerifier: codeVerifier,
      basicAuth: true,
    );
    initialUri = authorizationCodeGrant.getAuthorizationUrl(
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
