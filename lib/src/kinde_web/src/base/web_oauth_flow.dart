import 'dart:convert';

import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:kinde_flutter_sdk/src/kinde_debug_print.dart';
import 'package:oauth2/oauth2.dart';

import '../utils/cross_platform_support.dart';
import 'model/oauth_configuration.dart';

abstract class WebOAuthFlow {
  static Future<Credentials?> _getClientCredentials(
      {required OAuthConfiguration configuration,
      required String responseRedirect,
      required String codeVerifier}) async {
    try {
      final AuthorizationCodeGrant authorizationCodeGrant =
          AuthorizationCodeGrant(
        configuration.clientId,
        Uri.parse(configuration.authorizationEndpointUrl),
        Uri.parse(configuration.tokenEndpointUrl),
        secret: configuration.clientSecret,
        codeVerifier: codeVerifier,
        delimiter: configuration.delimiter,
        basicAuth: configuration.basicAuth ?? true,
        httpClient: configuration.httpClient,
      );

      final parameters = Uri.parse(responseRedirect).queryParameters;

      if (parameters.isEmpty &&
          (configuration.baseUrl?.isNotEmpty ?? false) &&
          responseRedirect.startsWith(configuration.baseUrl!)) {
        kindeDebugPrint(
            methodName: "getClientCredentials",
            message: "parameters are empty");
        return null;
      }

      authorizationCodeGrant.getAuthorizationUrl(
        Uri.parse(configuration.redirectUrl),
        scopes: configuration.scopes,
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
      if (error is FormatException) {
        final jsonMatch = RegExp(r'\{.*\}').firstMatch(error.message);
        if (jsonMatch != null) {
          final jsonString = jsonMatch.group(0);

          try {
            final jsonData = jsonDecode(jsonString!);

            final error = jsonData['error'];
            final errorDescription = jsonData['error_description'];

            throw KindeError(code: error, message: errorDescription);
          } catch (e) {
            if (e is KindeError) {
              rethrow;
            }
            throw KindeError(
                code: KindeErrorCode.unknown, message: e.toString());
          }
        }
      }

      throw KindeError(
          code: KindeErrorCode.unknown,
          message: error.toString(),
          stackTrace: st);
    }
  }

  static List<String> _getRedirectUrls(
      {required String redirectUrl, required String? baseUrl}) {
    final redirectUrls =
        baseUrl != null ? [redirectUrl, baseUrl] : [redirectUrl];
    return redirectUrls;
  }

  static void login(
    OAuthConfiguration configuration, {
    required String codeVerifier,
  }) {
    final initialUri = _getInitialUrl(
        configuration: configuration, codeVerifier: codeVerifier);
    WebUtils.replacePage(initialUri.toString());
  }

  static Future<Credentials?> finishLogin(
      {required OAuthConfiguration configuration,
      required String responseRedirect,
      required String codeVerifier}) async {
    responseRedirect = _sanitizeRedirect(responseRedirect);

    if (!_isValidRedirect(responseRedirect, configuration)) {
      return null;
    }
    try {
      final credentials = await _getClientCredentials(
          configuration: configuration,
          responseRedirect: responseRedirect,
          codeVerifier: codeVerifier);

      return credentials;
    } catch (e, st) {
      if (e is KindeError) {
        rethrow;
      }
      throw KindeError(
          code: KindeErrorCode.unknown, message: e.toString(), stackTrace: st);
    }
  }

  /// Ensures the responseRedirect matches a known valid redirect URL
  static bool _isValidRedirect(
      String responseRedirect, OAuthConfiguration config) {
    final Uri redirectUri = Uri.parse(responseRedirect);

    final List<Uri> validUris = _getRedirectUrls(
      redirectUrl: config.redirectUrl,
      baseUrl: config.baseUrl,
    ).map(Uri.parse).toList();

    int matches = 0;
    Uri? mostValidUri;

    final isValidUri = validUris.any((validUri) {
      int validUriMatches = 0;
      validUriMatches = validUriMatches + (redirectUri.scheme == validUri.scheme ? 1 : -1);
      validUriMatches = validUriMatches + (redirectUri.host == validUri.host ? 1 : -1);
      validUriMatches = validUriMatches + (redirectUri.port == validUri.port ? 1 : -1);
      validUriMatches = validUriMatches + (redirectUri.path == validUri.path ? 1 : -1);
      if(validUriMatches > matches) {
        matches = validUriMatches;
        mostValidUri = validUri;
      }
      return matches == 4;
    });

    if(!isValidUri) {
      kindeDebugPrint(
          methodName: "isValidRedirect",
          message: '''

          expect: $mostValidUri,
          actual: ${"${redirectUri.scheme}://${redirectUri.host}:${redirectUri.port}${redirectUri.path}"}
          ''');
    }

    return isValidUri;
  }

  /// Removes URL fragments (`#` and anything after)
  static String _sanitizeRedirect(String url) {
    url = url.trim();
    final int index = url.indexOf('#');
    return index > -1 ? url.substring(0, index) : url;
  }

  static Uri _getInitialUrl(
      {required OAuthConfiguration configuration,
      required String codeVerifier}) {
    Uri initialUri = Uri();

    final redirectUrl = configuration.redirectUrl;

    final authorizationCodeGrant = AuthorizationCodeGrant(
      configuration.clientId,
      Uri.parse(configuration.authorizationEndpointUrl),
      Uri.parse(configuration.tokenEndpointUrl),
      secret: configuration.clientSecret,
      codeVerifier: codeVerifier,
      delimiter: configuration.delimiter,
      basicAuth: configuration.basicAuth ?? true,
      httpClient: configuration.httpClient,
    );
    initialUri = authorizationCodeGrant.getAuthorizationUrl(
      Uri.parse(redirectUrl),
      scopes: configuration.scopes,
    );
    initialUri = initialUri.replace(
        queryParameters: Map.from(initialUri.queryParameters)
          ..addAll({
            'state': const Base64Encoder.urlSafe()
                .convert(DateTime.now().toIso8601String().codeUnits),
            'nonce': const Base64Encoder.urlSafe().convert(
                DateTime.now().millisecondsSinceEpoch.toString().codeUnits),
            if (configuration.loginHint != null)
              'login_hint': configuration.loginHint,
            if (configuration.promptValues?.isNotEmpty ?? false)
              'prompt': configuration.promptValues!.join(' '),
          })
          ..addAll(configuration.extraParameter ?? {}));
    return initialUri;
  }
}
