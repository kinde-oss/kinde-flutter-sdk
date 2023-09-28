//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:kinde_flutter_sdk/src/api_util.dart';
import 'package:kinde_flutter_sdk/src/model/success_response.dart';

class BusinessApi {

  final Dio _dio;

  final Serializers _serializers;

  const BusinessApi(this._dio, this._serializers);

  /// List business details
  /// Get your business details.
  ///
  /// Parameters:
  /// * [code] - Business code.
  /// * [name] - Business name.
  /// * [email] - Email associated with business.
  /// * [phone] - Phone number associated with business.
  /// * [industry] - The industry your business is in.
  /// * [timezone] - The timezone your business is in.
  /// * [privacyUrl] - Your Privacy policy URL.
  /// * [termsUrl] - Your Terms and Conditions URL.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [SuccessResponse] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<SuccessResponse>> getBusiness({
    required String code,
    required String name,
    required String email,
    String? phone,
    String? industry,
    String? timezone,
    String? privacyUrl,
    String? termsUrl,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const path = r'/api/v1/business';
    final options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'kindeBearerAuth',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final queryParameters = <String, dynamic>{
      r'code': encodeQueryParameter(_serializers, code, const FullType(String)),
      r'name': encodeQueryParameter(_serializers, name, const FullType(String)),
      r'email': encodeQueryParameter(_serializers, email, const FullType(String)),
      r'phone': encodeQueryParameter(_serializers, phone, const FullType(String)),
      if (industry != null) r'industry': encodeQueryParameter(_serializers, industry, const FullType(String)),
      if (timezone != null) r'timezone': encodeQueryParameter(_serializers, timezone, const FullType(String)),
      r'privacy_url': encodeQueryParameter(_serializers, privacyUrl, const FullType(String)),
      r'terms_url': encodeQueryParameter(_serializers, termsUrl, const FullType(String)),
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
      responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(SuccessResponse),
      ) as SuccessResponse;

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

  /// Update business details
  /// Update business details.
  ///
  /// Parameters:
  /// * [businessName] - Business name.
  /// * [primaryEmail] - Email associated with business.
  /// * [primaryPhone] - Phone number associated with business.
  /// * [industryKey] - The key of the industry your business is in.
  /// * [timezoneId] - The ID of the timezone your business is in.
  /// * [privacyUrl] - Your Privacy policy URL.
  /// * [termsUrl] - Your Terms and Conditions URL.
  /// * [isShowKindeBranding] - Display \"Powered by Kinde\" on your sign up, sign in, and subscription pages.
  /// * [isClickWrap] - Show a policy acceptance checkbox on sign up.
  /// * [partnerCode] - Your Kinde Perk code.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [SuccessResponse] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<SuccessResponse>> updateBusiness({
    required String businessName,
    required String primaryEmail,
    String? primaryPhone,
    String? industryKey,
    String? timezoneId,
    String? privacyUrl,
    String? termsUrl,
    String? isShowKindeBranding,
    bool? isClickWrap,
    String? partnerCode,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const path = r'/api/v1/business';
    final options = Options(
      method: r'PATCH',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'kindeBearerAuth',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final queryParameters = <String, dynamic>{
      r'business_name': encodeQueryParameter(_serializers, businessName, const FullType(String)),
      r'primary_email': encodeQueryParameter(_serializers, primaryEmail, const FullType(String)),
      r'primary_phone': encodeQueryParameter(_serializers, primaryPhone, const FullType(String)),
      if (industryKey != null) r'industry_key': encodeQueryParameter(_serializers, industryKey, const FullType(String)),
      if (timezoneId != null) r'timezone_id': encodeQueryParameter(_serializers, timezoneId, const FullType(String)),
      r'privacy_url': encodeQueryParameter(_serializers, privacyUrl, const FullType(String)),
      r'terms_url': encodeQueryParameter(_serializers, termsUrl, const FullType(String)),
      r'is_show_kinde_branding': encodeQueryParameter(_serializers, isShowKindeBranding, const FullType(String)),
      r'is_click_wrap': encodeQueryParameter(_serializers, isClickWrap, const FullType(bool)),
      r'partner_code': encodeQueryParameter(_serializers, partnerCode, const FullType(String)),
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
      responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(SuccessResponse),
      ) as SuccessResponse;

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
