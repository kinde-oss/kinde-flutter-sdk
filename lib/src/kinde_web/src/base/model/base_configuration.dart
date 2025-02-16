import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

typedef CertificateValidator = bool Function(X509Certificate certificate);

class BaseConfiguration {
  final String initialUrl;
  final List<String> redirectUrls;

  void _validateUrls() {
      try {
        Uri.parse(initialUrl);
        for (final url in redirectUrls) {
          Uri.parse(url);
        }
      } catch (e) {
        throw ArgumentError('Invalid URL format');
      }
    }

  /// This function will be called when any of the redirectUrls is loaded in web view.
  /// It will pass the url it causes redirect.
  final ValueChanged<String>? onSuccessRedirect;


  BaseConfiguration({
    required this.initialUrl,
    required this.redirectUrls,
    this.onSuccessRedirect
  })  {
    _validateUrls();
  }


  BaseConfiguration copyWith({
    String? initialUrl,
    List<String>? redirectUrls,
    ValueChanged<String>? onSuccessRedirect,
    ValueChanged<dynamic>? onError,
    VoidCallback? onCancel,
    CertificateValidator? onCertificateValidate,
    Map<String, String>? headers,
    Stream<String>? urlStream,
    ThemeData? themeData,
    Map<String, String>? textLocales,
    Locale? contentLocale,
    bool? goBackBtnVisible,
    bool? goForwardBtnVisible,
    bool? refreshBtnVisible,
    bool? clearCacheBtnVisible,
    bool? closeBtnVisible,
  }) =>
      BaseConfiguration(
        initialUrl: initialUrl ?? this.initialUrl,
        redirectUrls: redirectUrls ?? this.redirectUrls,
        onSuccessRedirect: onSuccessRedirect ?? this.onSuccessRedirect,
      );
}
