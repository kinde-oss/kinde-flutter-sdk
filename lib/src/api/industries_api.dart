//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:kinde_flutter_sdk/src/utils/api_util.dart';
import 'package:kinde_flutter_sdk/src/model/success_response.dart';

class IndustriesApi {
  final Dio _dio;

  final Serializers _serializers;

  const IndustriesApi(this._dio, this._serializers);

  /// List industries and industry keys.
  /// Get a list of industries and associated industry keys.
  ///
  /// Parameters:
  /// * [industryKey] - Industry Key.
  /// * [name] - Industry name.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [SuccessResponse] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<SuccessResponse>> getIndustries({
    String? industryKey,
    String? name,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const path = r'/api/v1/industries';
    final options = Options(
      method: r'GET',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {'type': 'http', 'scheme': 'bearer', 'name': 'kindeBearerAuth'},
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final queryParameters = <String, dynamic>{
      if (industryKey != null)
        r'industry_key': encodeQueryParameter(
          _serializers,
          industryKey,
          const FullType(String),
        ),
      if (name != null)
        r'name': encodeQueryParameter(
          _serializers,
          name,
          const FullType(String),
        ),
    };

    final response = await _dio.request<Object>(
      path,
      options: options,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    SuccessResponse? responseData;

    try {
      final rawResponse = response.data;
      responseData =
          rawResponse == null
              ? null
              : _serializers.deserialize(
                    rawResponse,
                    specifiedType: const FullType(SuccessResponse),
                  )
                  as SuccessResponse;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<SuccessResponse>(
      data: responseData,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }
}
