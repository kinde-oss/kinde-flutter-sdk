import 'package:dio/dio.dart';
import 'package:kinde_flutter_sdk/src/kinde_error.dart';

mixin HandleNetworkMixin {
  Exception handleError(Exception error) {
    if (error is KindeError) {
      return error;
    }
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
            return dioError.error as KindeError;
          }
          return KindeError(dioError.message ?? "");
        case DioExceptionType.badResponse:
          if (dioError.requestOptions.path == "/oauth2/token") {
            return KindeError("Refresh token Expired");
          }
          return KindeError(dioError.message ?? "");
      }
    } else {
      return error;
    }
  }
}
