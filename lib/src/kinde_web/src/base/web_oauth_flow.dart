import 'dart:convert';

import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:kinde_flutter_sdk/src/kinde_error_code..dart';
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
        return null;
      }

      authorizationCodeGrant.getAuthorizationUrl(
        Uri.parse(configuration.redirectUrl),
        scopes: configuration.scopes,
      );

      final client =
          await authorizationCodeGrant.handleAuthorizationResponse(parameters);
      return client.credentials;
    } catch (e) {
      _handleError(e);
    }
  }

  static void _handleError(Object error) {
    {
      if (error is AuthorizationException) {
        throw KindeError(
            code: KindeErrorCode.unknown, message: error.description ?? "");
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

      throw KindeError(code: KindeErrorCode.unknown, message: error.toString());
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
    final redirectUrls = _getRedirectUrls(
        redirectUrl: configuration.redirectUrl, baseUrl: configuration.baseUrl);
    final bool isThisUrlRedirectUrl = redirectUrls.any((redirectUrl) =>
        responseRedirect != redirectUrl &&
        responseRedirect.startsWith(redirectUrl));

    if (!isThisUrlRedirectUrl) return null;

    try {
      responseRedirect = responseRedirect.trim();

      final int ignoreStartIndex = responseRedirect.indexOf('#');
      if (ignoreStartIndex > -1) {
        responseRedirect = responseRedirect.substring(0, ignoreStartIndex);
      }

      final credentials = await _getClientCredentials(
          configuration: configuration,
          responseRedirect: responseRedirect,
          codeVerifier: codeVerifier);

      return credentials;
    } catch (e) {
      if (e is KindeError) {
        rethrow;
      }
      throw KindeError(code: KindeErrorCode.unknown, message: e.toString());
    }
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
