import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

class DioAdapterMock extends Mock implements Dio {
  @override
  Future<Response<T>> request<T>(String url,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    return Future.value(Response(
      data: {"message": "success", "code": "200"} as T,
      requestOptions: RequestOptions(path: 'url'),
    ));
  }

  @override
  Interceptors get interceptors => Interceptors();
}
