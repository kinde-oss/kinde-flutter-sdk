import 'package:dio/dio.dart';

/// Portal API for managing Kinde portal operations
/// This is a custom API class separate from auto-generated files
class PortalApi {
  final Dio _dio;

  PortalApi(this._dio);

  /// Get portal link for user access to Kinde portal
  ///
  /// Returns a Response containing the portal URL
  Future<Response> getPortalLink({
    required String returnUrl,
    String? subNav,
  }) async {
    const path = '/account_api/v1/portal_link';

    final Map<String, dynamic> queryParams = {};
    queryParams['return_url'] = returnUrl;
    if (subNav != null) queryParams['subnav'] = subNav;

    return await _dio.get(
      path,
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
      options: Options(
        extra: {
          'secure': [
            {'type': 'http', 'scheme': 'bearer', 'name': 'kindeBearerAuth'},
          ],
        },
      ),
    );
  }
}
