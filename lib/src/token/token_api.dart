import 'package:dio/dio.dart';

class TokenApi {
  final Dio dio;

  TokenApi(this.dio);

  Future<Map> retrieveToken(
      String version,
      Map<String, String> params,
      ) async {
    final response = await dio.post(
      '/oauth2/token',
      data: params,
      options: Options(contentType: Headers.formUrlEncodedContentType, headers: {
        'Kinde-SDK': version
      }),
    );
    return response.data;
  }
}
