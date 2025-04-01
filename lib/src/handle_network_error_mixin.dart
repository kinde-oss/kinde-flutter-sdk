import 'package:dio/dio.dart';
import 'package:kinde_flutter_sdk/src/kinde_error.dart';

mixin HandleNetworkMixin {
  Exception handleError(Exception error) {
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
}
