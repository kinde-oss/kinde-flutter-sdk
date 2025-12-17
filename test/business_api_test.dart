import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

/// Enterprise-grade tests for BusinessApi
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late BusinessApi businessApi;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://test.kinde.com',
      contentType: 'application/json',
    ));
    dioAdapter = DioAdapter(dio: dio);
    businessApi = KindeApi(dio: dio).getBusinessApi();
  });

  tearDown(() {
    dioAdapter.reset();
  });

  group('getBusiness', () {
    const testPath = '/api/v1/business';

    group('success scenarios', () {
      test('retrieves business details with required fields', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Business details retrieved successfully',
          'code': 'OK',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {
            'code': 'ACME',
            'name': 'Acme Corp',
            'email': 'contact@acme.com',
          },
        );

        // Act
        final response = await businessApi.getBusiness(
          code: 'ACME',
          name: 'Acme Corp',
          email: 'contact@acme.com',
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.message, contains('successfully'));
        expect(response.data!.code, equals('OK'));
      });

      test('retrieves business details with all optional fields', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Business details retrieved',
          'code': 'OK',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {
            'code': 'ACME',
            'name': 'Acme Corp',
            'email': 'contact@acme.com',
            'phone': '+1-555-0123',
            'industry': 'technology',
            'timezone': 'America/New_York',
            'privacy_url': 'https://acme.com/privacy',
            'terms_url': 'https://acme.com/terms',
          },
        );

        // Act
        final response = await businessApi.getBusiness(
          code: 'ACME',
          name: 'Acme Corp',
          email: 'contact@acme.com',
          phone: '+1-555-0123',
          industry: 'technology',
          timezone: 'America/New_York',
          privacyUrl: 'https://acme.com/privacy',
          termsUrl: 'https://acme.com/terms',
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });

      test('retrieves business details without optional phone', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Business retrieved',
          'code': 'OK',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {
            'code': 'STARTUP',
            'name': 'Startup Inc',
            'email': 'hello@startup.io',
          },
        );

        // Act
        final response = await businessApi.getBusiness(
          code: 'STARTUP',
          name: 'Startup Inc',
          email: 'hello@startup.io',
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 business not found', () async {
        // Arrange
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'Business not found',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(404, errorResponse),
          queryParameters: {
            'code': 'NONEXISTENT',
            'name': 'Test',
            'email': 'test@test.com',
          },
        );

        // Act & Assert
        expect(
          () => businessApi.getBusiness(
            code: 'NONEXISTENT',
            name: 'Test',
            email: 'test@test.com',
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(404),
          )),
        );
      });

      test('throws DioException on 401 unauthorized', () async {
        // Arrange
        final errorResponse = {
          'error': 'unauthorized',
          'error_description': 'Invalid or expired token',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(401, errorResponse),
          queryParameters: {
            'code': 'ACME',
            'name': 'Acme',
            'email': 'test@acme.com',
          },
        );

        // Act & Assert
        expect(
          () => businessApi.getBusiness(
            code: 'ACME',
            name: 'Acme',
            email: 'test@acme.com',
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(401),
          )),
        );
      });

      test('throws DioException on 403 forbidden', () async {
        // Arrange
        final errorResponse = {
          'error': 'forbidden',
          'error_description': 'Insufficient permissions',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(403, errorResponse),
          queryParameters: {
            'code': 'ACME',
            'name': 'Acme',
            'email': 'test@acme.com',
          },
        );

        // Act & Assert
        expect(
          () => businessApi.getBusiness(
            code: 'ACME',
            name: 'Acme',
            email: 'test@acme.com',
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(403),
          )),
        );
      });

      test('throws DioException on 500 server error', () async {
        // Arrange
        final errorResponse = {
          'error': 'server_error',
          'error_description': 'Internal server error',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(500, errorResponse),
          queryParameters: {
            'code': 'ACME',
            'name': 'Acme',
            'email': 'test@acme.com',
          },
        );

        // Act & Assert
        expect(
          () => businessApi.getBusiness(
            code: 'ACME',
            name: 'Acme',
            email: 'test@acme.com',
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(500),
          )),
        );
      });
    });

    group('request validation', () {
      test('sends required parameters as query strings', () async {
        // Arrange
        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, {'message': 'Success', 'code': 'OK'}),
          queryParameters: {
            'code': 'TEST',
            'name': 'Test Co',
            'email': 'test@test.com',
          },
        );

        // Act
        final response = await businessApi.getBusiness(
          code: 'TEST',
          name: 'Test Co',
          email: 'test@test.com',
        );

        // Assert
        expect(response.statusCode, equals(200));
      });

      test('includes optional parameters when provided', () async {
        // Arrange
        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, {'message': 'Success', 'code': 'OK'}),
          queryParameters: {
            'code': 'TEST',
            'name': 'Test Co',
            'email': 'test@test.com',
            'industry': 'tech',
            'timezone': 'UTC',
          },
        );

        // Act
        final response = await businessApi.getBusiness(
          code: 'TEST',
          name: 'Test Co',
          email: 'test@test.com',
          industry: 'tech',
          timezone: 'UTC',
        );

        // Assert
        expect(response.statusCode, equals(200));
      });
    });
  });

  group('updateBusiness', () {
    const testPath = '/api/v1/business';

    group('success scenarios', () {
      test('updates business with required fields', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Business updated successfully',
          'code': 'OK',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {
            'business_name': 'Updated Acme Corp',
            'primary_email': 'new@acme.com',
            'primary_phone': '+1-555-9999',
          },
        );

        // Act
        final response = await businessApi.updateBusiness(
          businessName: 'Updated Acme Corp',
          primaryEmail: 'new@acme.com',
          primaryPhone: '+1-555-9999',
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.message, contains('successfully'));
        expect(response.data!.code, equals('OK'));
      });

      test('updates business with all optional fields', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Business updated',
          'code': 'OK',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {
            'business_name': 'Acme Corp',
            'primary_email': 'contact@acme.com',
            'primary_phone': '+1-555-0123',
            'industry_key': 'technology',
            'timezone_id': 'America/Los_Angeles',
            'privacy_url': 'https://acme.com/privacy',
            'terms_url': 'https://acme.com/terms',
            'is_show_kinde_branding': 'false',
            'is_click_wrap': 'true',
            'partner_code': 'PARTNER123',
          },
        );

        // Act
        final response = await businessApi.updateBusiness(
          businessName: 'Acme Corp',
          primaryEmail: 'contact@acme.com',
          primaryPhone: '+1-555-0123',
          industryKey: 'technology',
          timezoneId: 'America/Los_Angeles',
          privacyUrl: 'https://acme.com/privacy',
          termsUrl: 'https://acme.com/terms',
          isShowKindeBranding: 'false',
          isClickWrap: true,
          partnerCode: 'PARTNER123',
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });

      test('updates business with minimal fields', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Business name updated',
          'code': 'OK',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {
            'business_name': 'New Name',
            'primary_email': 'email@test.com',
            'primary_phone': '+1-555-1111',
          },
        );

        // Act
        final response = await businessApi.updateBusiness(
          businessName: 'New Name',
          primaryEmail: 'email@test.com',
          primaryPhone: '+1-555-1111',
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 400 validation error', () async {
        // Arrange
        final errorResponse = {
          'error': 'validation_error',
          'error_description': 'Invalid email format',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(400, errorResponse),
          queryParameters: {
            'business_name': 'Test',
            'primary_email': 'invalid-email',
            'primary_phone': '123',
          },
        );

        // Act & Assert
        expect(
          () => businessApi.updateBusiness(
            businessName: 'Test',
            primaryEmail: 'invalid-email',
            primaryPhone: '123',
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(400),
          )),
        );
      });

      test('throws DioException on 401 unauthorized', () async {
        // Arrange
        final errorResponse = {
          'error': 'unauthorized',
          'error_description': 'Invalid or expired token',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(401, errorResponse),
          queryParameters: {
            'business_name': 'Test',
            'primary_email': 'test@test.com',
            'primary_phone': '123',
          },
        );

        // Act & Assert
        expect(
          () => businessApi.updateBusiness(
            businessName: 'Test',
            primaryEmail: 'test@test.com',
            primaryPhone: '123',
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(401),
          )),
        );
      });

      test('throws DioException on 403 forbidden', () async {
        // Arrange
        final errorResponse = {
          'error': 'forbidden',
          'error_description': 'Insufficient permissions',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(403, errorResponse),
          queryParameters: {
            'business_name': 'Test',
            'primary_email': 'test@test.com',
            'primary_phone': '123',
          },
        );

        // Act & Assert
        expect(
          () => businessApi.updateBusiness(
            businessName: 'Test',
            primaryEmail: 'test@test.com',
            primaryPhone: '123',
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(403),
          )),
        );
      });

      test('throws DioException on 500 server error', () async {
        // Arrange
        final errorResponse = {
          'error': 'server_error',
          'error_description': 'Database connection failed',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(500, errorResponse),
          queryParameters: {
            'business_name': 'Test',
            'primary_email': 'test@test.com',
            'primary_phone': '123',
          },
        );

        // Act & Assert
        expect(
          () => businessApi.updateBusiness(
            businessName: 'Test',
            primaryEmail: 'test@test.com',
            primaryPhone: '123',
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(500),
          )),
        );
      });
    });

    group('request validation', () {
      test('sends parameters as query strings', () async {
        // Arrange
        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, {'message': 'Updated', 'code': 'OK'}),
          queryParameters: {
            'business_name': 'Test Business',
            'primary_email': 'test@example.com',
            'primary_phone': '+1-555-0000',
          },
        );

        // Act
        final response = await businessApi.updateBusiness(
          businessName: 'Test Business',
          primaryEmail: 'test@example.com',
          primaryPhone: '+1-555-0000',
        );

        // Assert
        expect(response.statusCode, equals(200));
      });

      test('includes optional boolean parameters correctly', () async {
        // Arrange
        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, {'message': 'Updated', 'code': 'OK'}),
          queryParameters: {
            'business_name': 'Test',
            'primary_email': 'test@test.com',
            'primary_phone': '123',
            'is_show_kinde_branding': 'true',
            'is_click_wrap': 'false',
          },
        );

        // Act
        final response = await businessApi.updateBusiness(
          businessName: 'Test',
          primaryEmail: 'test@test.com',
          primaryPhone: '123',
          isShowKindeBranding: 'true',
          isClickWrap: false,
        );

        // Assert
        expect(response.statusCode, equals(200));
      });
    });
  });
}
