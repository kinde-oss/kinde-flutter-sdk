import 'dart:io';

import 'package:dio/dio.dart';

class RefreshTokenInterceptor<T> extends InterceptorsWrapper {
  final Dio dio;
  final Future Function() refreshToken;

  RefreshTokenInterceptor({required this.dio, required this.refreshToken});

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == HttpStatus.forbidden) {
      try {
        // If a 403 response is received, refresh the access token
        var newToken = await refreshToken();

        // Repeat the request with the updated header
        return handler.resolve(await dio.fetch(err.requestOptions));
      } on DioException catch (error) {
        return handler.next(error);
      }
    }
    return handler.next(err);
  }
}
