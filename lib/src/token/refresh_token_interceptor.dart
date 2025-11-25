import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kinde_flutter_sdk/src/error/kinde_error.dart';
import 'package:kinde_flutter_sdk/src/utils/kinde_debug_print.dart';

class RefreshTokenInterceptor<T> extends InterceptorsWrapper {
  final Dio dio;
  final Future Function() refreshToken;

  RefreshTokenInterceptor({required this.dio, required this.refreshToken});

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == HttpStatus.forbidden) {
      try {
        kindeDebugPrint(
          methodName: 'RefreshTokenInterceptor',
          message: '403 detected, refreshing token',
          context: {'path': err.requestOptions.path},
        );

        // If a 403 response is received, refresh the access token
        await refreshToken();

        kindeDebugPrint(
          methodName: 'RefreshTokenInterceptor',
          message: 'Retrying request with new token',
        );

        // Repeat the request with the updated header
        return handler.resolve(await dio.fetch(err.requestOptions));
      } on DioException catch (error) {
        kindeDebugPrint(
          methodName: 'RefreshTokenInterceptor',
          message: 'Retry failed',
          context: {'error': error.toString()},
        );
        return handler.next(error);
      } on KindeError catch (error) {
        kindeDebugPrint(
          methodName: 'RefreshTokenInterceptor',
          message: 'Token refresh failed',
          context: {'error': error.toString()},
        );
        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: error,
            message: error.message,
          ),
        );
      }
    }
    return handler.next(err);
  }
}
