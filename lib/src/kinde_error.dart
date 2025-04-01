import 'package:flutter/material.dart';

part 'kinde_error_code.dart';

@immutable
class KindeError implements Exception {
   const KindeError({
    String? message,
    String? code,
    this.stackTrace,
  }) : this.code = code ?? KindeErrorCode.unknown, this.message = message ?? "";

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
          hashCode == other.hashCode;


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
}
