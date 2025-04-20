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
  const KindeError({
    String? message,
    String? code,
    this.stackTrace,
  })  : this.code = code ?? KindeErrorCode.unknown,
        this.message = message ?? "";

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

  factory KindeError.fromError(Object error, StackTrace stackTrace) {
    if (error is KindeError) {
      return error;
    }
    if (error is PlatformException) {
      return _flutterAppAuthExceptionMapper(error);
    }
    if (error is AuthorizationException) {
      return AuthorizationKindeError.fromOauth2Exception(error);
    }
    if (error is FormatException) {
      if(error.message.contains("parameter \"state\" expected")) {
          return KindeError(
              code: KindeErrorCode.authStateNotMatch,
              message: error.message);
      }
      final jsonMatch = RegExp(r'\{.*\}').firstMatch(error.message);
      if (jsonMatch != null) {
        final jsonString = jsonMatch.group(0);

        try {
          final jsonData = jsonDecode(jsonString!);

          final error = jsonData['error'];
          final errorDescription = jsonData['error_description'];

          return KindeError(code: error, message: errorDescription);
        } catch (e) {
          return KindeError(
              code: KindeErrorCode.unknown, message: e.toString());
        }
      }
    }
    if (error is Exception) {
      return _handleError(error);
    }
    return KindeError(message: error.toString(), stackTrace: stackTrace);
  }
}

KindeError _handleError(Exception error) {
  if (error is KindeError) {
    return error;
  }
  KindeError? resultError;
  if (error is DioException) {
    DioException dioError = error;
    switch (dioError.type) {
      case DioExceptionType.cancel:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        if (dioError.error is KindeError) {
          resultError = dioError.error as KindeError;
        }
        break;
      case DioExceptionType.badResponse:
        if (dioError.requestOptions.path == "/oauth2/token") {
          resultError = KindeError(
              code: KindeErrorCode.refreshTokenExpired,
              message: dioError.message);
        }
        break;
    }
  }
  return resultError ?? KindeError(message: error.toString());
}

KindeError _flutterAppAuthExceptionMapper(PlatformException platformException) {
  if (platformException is FlutterAppAuthUserCancelledException) {
    return const KindeError(code: KindeErrorCode.userCanceled);
  }
  return KindeError(
      code: platformException.code, message: platformException.message);
}
