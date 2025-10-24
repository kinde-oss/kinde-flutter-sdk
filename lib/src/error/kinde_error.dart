import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

import 'package:oauth2/oauth2.dart';

part 'kinde_error_code.dart';
part 'authorization_kinde_error.dart';

@immutable
class KindeError implements Exception {
  KindeError({
    String? message,
    String? code,
    this.stackTrace,
  })  : code = code ?? KindeErrorCode.unknown.code,
        message = message ?? "";

  /// The long form message of the exception.
  final String message;

  /// Allows users to identify the exception from a short code-name
  final String code;

  /// The stack trace which provides information to the user about the call
  /// sequence that triggered an exception
  final StackTrace? stackTrace;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KindeError &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          message == other.message;

  @override
  int get hashCode => Object.hash(code, message);

  @override
  String toString() {
    String output = '[$code] $message';

    if (stackTrace != null) {
      output += '\n\n$stackTrace';
    }

    return output;
  }

  /// Factory constructor that converts any [Object] error to a [KindeError].
  ///
  /// Uses pattern matching with switch expressions for type-safe error handling.
  /// Delegates specific error types to appropriate handler functions.
  factory KindeError.fromError(Object error, StackTrace stackTrace) => switch (error) {
    KindeError e => e,
    PlatformException e => _flutterAppAuthExceptionMapper(e),
    AuthorizationException e => AuthorizationKindeError.fromOauth2Exception(e),
    FormatException e => _handleFormatException(e),
    Exception e => _handleError(e),
    _ => KindeError(message: error.toString(), stackTrace: stackTrace),
  };
}

/// Handles [Exception] types and converts them to [KindeError].
///
/// Uses pattern matching for type-safe exception handling.
/// Delegates [DioException] handling to [_handleDioException].
KindeError _handleError(Exception error) => switch (error) {
  KindeError e => e,
  DioException e => _handleDioException(e),
  _ => KindeError(message: error.toString()),
};

/// Handles [DioException] types with exhaustive pattern matching.
///
/// Uses switch expressions to handle different [DioExceptionType] cases:
/// - For network errors, checks if the underlying error is already a [KindeError]
/// - For bad responses on token endpoint, creates a refresh token expired error
/// - Falls back to generic error for other cases
KindeError _handleDioException(DioException dioError) => switch (dioError.type) {
  DioExceptionType.cancel ||
  DioExceptionType.connectionTimeout ||
  DioExceptionType.receiveTimeout ||
  DioExceptionType.sendTimeout ||
  DioExceptionType.connectionError ||
  DioExceptionType.badCertificate ||
  DioExceptionType.unknown when dioError.error is KindeError =>
    dioError.error as KindeError,
  DioExceptionType.badResponse when dioError.requestOptions.path == "/oauth2/token" =>
    KindeError(
      code: KindeErrorCode.refreshTokenExpired.code,
      message: dioError.message,
    ),
  _ => KindeError(message: dioError.toString()),
};

/// Handles [FormatException] types with pattern-based logic.
///
/// Attempts to extract error information from JSON embedded in format exception messages.
/// Special handling for OAuth state parameter mismatches.
KindeError _handleFormatException(FormatException error) {
  // Check for OAuth state parameter mismatch
  if (error.message.contains("parameter \"state\" expected")) {
    return KindeError(
      code: KindeErrorCode.authStateNotMatch.code,
      message: error.message,
    );
  }

  // Attempt to extract JSON error from message
  final jsonMatch = RegExp(r'\{.*\}').firstMatch(error.message);
  if (jsonMatch != null) {
    final jsonString = jsonMatch.group(0);

    try {
      final jsonData = jsonDecode(jsonString!);
      final errorCode = jsonData['error'] as String?;
      final errorDescription = jsonData['error_description'] as String?;

      return KindeError(
        code: errorCode ?? KindeErrorCode.unknown.code,
        message: errorDescription ?? 'Unknown error',
      );
    } catch (e) {
      return KindeError(
        code: KindeErrorCode.unknown.code,
        message: e.toString(),
      );
    }
  }

  // Fallback for format exceptions without extractable JSON
  return KindeError(
    code: KindeErrorCode.unknown.code,
    message: error.message,
  );
}

KindeError _flutterAppAuthExceptionMapper(PlatformException platformException) {
  if (platformException is FlutterAppAuthUserCancelledException) {
    return KindeError(code: KindeErrorCode.userCanceled.code, message: null);
  }
  return KindeError(
      code: platformException.code, message: platformException.message);
}
