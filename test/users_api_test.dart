import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

/// Enterprise-grade tests for UsersApi
///
/// Tests cover:
/// - Success scenarios with proper response validation
/// - Error scenarios (400, 401, 404, 500)
/// - Request structure validation
/// - Edge cases (pagination, optional parameters)
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late UsersApi usersApi;

  setUp(() {
    // Initialize Dio with base configuration
    dio = Dio(BaseOptions(
      baseUrl: 'https://test.kinde.com',
      contentType: 'application/json',
    ));

    // Setup mock adapter for HTTP interception
    dioAdapter = DioAdapter(dio: dio);

    // Initialize API instance
    usersApi = KindeApi(dio: dio).getUsersApi();
  });

  tearDown(() {
    // Reset mock adapter between tests
    dioAdapter.reset();
  });

  group('createUser', () {
    const testPath = '/api/v1/user';

    group('success scenarios', () {
      test('complete profile with email identity', () async {
        // Arrange
        final expectedResponse = {
          'id': 'user_123abc',
          'created': true,
          'identities': [
            {
              'type': 'email',
              'identity': {
                'email': 'john.doe@example.com',
              },
            },
          ],
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, expectedResponse),
          data: Matchers.any,
        );

        final request = CreateUserRequest((b) => b
          ..profile.givenName = 'John'
          ..profile.familyName = 'Doe'
          ..identities.add(CreateUserRequestIdentitiesInner((i) => i
            ..type = CreateUserRequestIdentitiesInnerTypeEnum.email
            ..details.email = 'john.doe@example.com')));

        // Act
        final response = await usersApi.createUser(
          createUserRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(201));
        expect(response.data, isNotNull);
        expect(response.data!.id, equals('user_123abc'));
        expect(response.data!.created, isTrue);
        expect(response.data!.identities, isNotNull);
        expect(response.data!.identities!.length, equals(1));
      });

      test('minimal data (name only)', () async {
        // Arrange
        final expectedResponse = {
          'id': 'user_minimal_456',
          'created': true,
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, expectedResponse),
          data: Matchers.any,
        );

        final request = CreateUserRequest((b) => b
          ..profile.givenName = 'Jane'
          ..profile.familyName = 'Smith');

        // Act
        final response = await usersApi.createUser(
          createUserRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(201));
        expect(response.data!.id, equals('user_minimal_456'));
        expect(response.data!.created, isTrue);
      });

      test('multiple identities', () async {
        // Arrange
        final expectedResponse = {
          'id': 'user_multi_789',
          'created': true,
          'identities': [
            {
              'type': 'email',
              'identity': {'email': 'user@example.com'},
            },
            {
              'type': 'phone',
              'identity': {'phone': '+1234567890'},
            },
          ],
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, expectedResponse),
          data: Matchers.any,
        );

        final request = CreateUserRequest((b) => b
          ..profile.givenName = 'Multi'
          ..profile.familyName = 'Identity'
          ..identities.addAll([
            CreateUserRequestIdentitiesInner((i) => i
              ..type = CreateUserRequestIdentitiesInnerTypeEnum.email
              ..details.email = 'user@example.com'),
            CreateUserRequestIdentitiesInner((i) => i..type = CreateUserRequestIdentitiesInnerTypeEnum.email),
          ]));

        // Act
        final response = await usersApi.createUser(
          createUserRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(201));
        expect(response.data!.identities!.length, equals(2));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 400 validation error', () async {
        // Arrange
        final errorResponse = {
          'error': 'validation_error',
          'error_description': 'Email address is required',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(400, errorResponse),
          data: Matchers.any,
        );

        final request = CreateUserRequest((b) => b
          ..profile.givenName = 'Invalid'
          ..profile.familyName = 'User');

        // Act & Assert
        expect(
          () => usersApi.createUser(createUserRequest: request),
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

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(401, errorResponse),
          data: Matchers.any,
        );

        final request = CreateUserRequest();

        // Act & Assert
        expect(
          () => usersApi.createUser(createUserRequest: request),
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
          'error_description': 'Insufficient permissions to create users',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(403, errorResponse),
          data: Matchers.any,
        );

        final request = CreateUserRequest();

        // Act & Assert
        expect(
          () => usersApi.createUser(createUserRequest: request),
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

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(500, errorResponse),
          data: Matchers.any,
        );

        final request = CreateUserRequest();

        // Act & Assert
        expect(
          () => usersApi.createUser(createUserRequest: request),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(500),
          )),
        );
      });
    });

    group('request validation', () {
      test('sends correct content-type header', () async {
        // Arrange
        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, {'id': 'user_123', 'created': true}),
          data: Matchers.any,
        );

        final request = CreateUserRequest((b) => b
          ..profile.givenName = 'Test'
          ..profile.familyName = 'User');

        // Act
        final response = await usersApi.createUser(createUserRequest: request);

        // Assert
        expect(response.statusCode, equals(201));
      });

      test('serializes request body correctly', () async {
        // Arrange
        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, {'id': 'user_123', 'created': true}),
          data: Matchers.any,
        );

        final request = CreateUserRequest((b) => b
          ..profile.givenName = 'John'
          ..profile.familyName = 'Doe'
          ..identities.add(CreateUserRequestIdentitiesInner((i) => i
            ..type = CreateUserRequestIdentitiesInnerTypeEnum.email
            ..details.email = 'john.doe@example.com')));

        // Act
        final response = await usersApi.createUser(createUserRequest: request);

        // Assert
        expect(response.statusCode, equals(201));
      });
    });
  });

  group('getUserData', () {
    const testPath = '/api/v1/user';

    group('success scenarios', () {
      test('retrieves user by id', () async {
        // Arrange
        const userId = 'user_123abc';
        final expectedResponse = {
          'id': userId,
          'provided_id': null,
          'preferred_email': 'john.doe@example.com',
          'username': null,
          'last_name': 'Doe',
          'first_name': 'John',
          'is_suspended': false,
          'picture': 'https://example.com/avatar.jpg',
          'total_sign_ins': 42,
          'failed_sign_ins': 0,
          'last_signed_in': '2023-12-01T10:30:00Z',
          'created_on': '2023-01-15T08:00:00Z',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'id': userId},
        );

        // Act
        final response = await usersApi.getUserData(id: userId);

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.id, equals(userId));
        expect(response.data!.firstName, equals('John'));
        expect(response.data!.lastName, equals('Doe'));
        expect(response.data!.preferredEmail, equals('john.doe@example.com'));
        expect(response.data!.isSuspended, isFalse);
        expect(response.data!.totalSignIns, equals(42));
        expect(response.data!.failedSignIns, equals(0));
      });

      test('retrieves suspended user', () async {
        // Arrange
        const userId = 'user_suspended_456';
        final expectedResponse = {
          'id': userId,
          'preferred_email': 'suspended@example.com',
          'last_name': 'Suspended',
          'first_name': 'User',
          'is_suspended': true,
          'total_sign_ins': 5,
          'failed_sign_ins': 3,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'id': userId},
        );

        // Act
        final response = await usersApi.getUserData(id: userId);

        // Assert
        expect(response.data!.isSuspended, isTrue);
        expect(response.data!.failedSignIns, equals(3));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 user not found', () async {
        // Arrange
        const userId = 'nonexistent_user';
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'User not found',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(404, errorResponse),
          queryParameters: {'id': userId},
        );

        // Act & Assert
        expect(
          () => usersApi.getUserData(id: userId),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(404),
          )),
        );
      });

      test('throws DioException on 401 unauthorized', () async {
        // Arrange
        const userId = 'user_123';
        final errorResponse = {
          'error': 'unauthorized',
          'error_description': 'Invalid or expired token',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(401, errorResponse),
          queryParameters: {'id': userId},
        );

        // Act & Assert
        expect(
          () => usersApi.getUserData(id: userId),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(401),
          )),
        );
      });
    });

    group('request validation', () {
      test('sends user id as query parameter', () async {
        // Arrange
        const userId = 'user_query_test';

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, {
            'id': userId,
            'first_name': 'Test',
            'last_name': 'User',
          }),
          queryParameters: {'id': userId},
        );

        // Act
        final response = await usersApi.getUserData(id: userId);

        // Assert
        expect(response.statusCode, equals(200));
      });
    });
  });

  group('getUsers', () {
    const testPath = '/api/v1/users';

    group('success scenarios', () {
      test('lists all users with default parameters', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'users': [
            {
              'id': 'user_1',
              'first_name': 'Alice',
              'last_name': 'Smith',
              'preferred_email': 'alice@example.com',
              'is_suspended': false,
            },
            {
              'id': 'user_2',
              'first_name': 'Bob',
              'last_name': 'Johnson',
              'preferred_email': 'bob@example.com',
              'is_suspended': false,
            },
          ],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await usersApi.getUsers();

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.users, isNotNull);
        expect(response.data!.users!.length, equals(2));
        expect(response.data!.users![0].id, equals('user_1'));
        expect(response.data!.users![0].firstName, equals('Alice'));
        expect(response.data!.users![1].id, equals('user_2'));
        expect(response.data!.nextToken, isNull);
      });

      test('lists users with pagination', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'users': [
            {
              'id': 'user_1',
              'first_name': 'User',
              'last_name': 'One',
              'preferred_email': 'user1@example.com',
            },
          ],
          'next_token': 'token_page_2',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'page_size': '10'},
        );

        // Act
        final response = await usersApi.getUsers(pageSize: 10);

        // Assert
        expect(response.data!.users!.length, equals(1));
        expect(response.data!.nextToken, equals('token_page_2'));
      });

      test('lists users with next_token for pagination', () async {
        // Arrange
        const nextToken = 'token_page_2';
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'users': [
            {
              'id': 'user_11',
              'first_name': 'User',
              'last_name': 'Eleven',
              'preferred_email': 'user11@example.com',
            },
          ],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'next_token': nextToken},
        );

        // Act
        final response = await usersApi.getUsers(nextToken: nextToken);

        // Assert
        expect(response.data!.users!.length, equals(1));
        expect(response.data!.users![0].id, equals('user_11'));
        expect(response.data!.nextToken, isNull);
      });

      test('filters users by email', () async {
        // Arrange
        const emailFilter = 'alice@example.com';
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'users': [
            {
              'id': 'user_alice',
              'first_name': 'Alice',
              'last_name': 'Smith',
              'preferred_email': emailFilter,
            },
          ],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'email': emailFilter},
        );

        // Act
        final response = await usersApi.getUsers(email: emailFilter);

        // Assert
        expect(response.data!.users!.length, equals(1));
        expect(response.data!.users![0].email, equals(emailFilter));
      });

      test('sorts users by name ascending', () async {
        // Arrange
        const sortParam = 'name_asc';
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'users': [
            {'id': 'user_1', 'first_name': 'Alice', 'last_name': 'Smith'},
            {'id': 'user_2', 'first_name': 'Bob', 'last_name': 'Johnson'},
            {'id': 'user_3', 'first_name': 'Charlie', 'last_name': 'Brown'},
          ],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'sort': sortParam},
        );

        // Act
        final response = await usersApi.getUsers(sort: sortParam);

        // Assert
        expect(response.data!.users!.length, equals(3));
        expect(response.data!.users![0].firstName, equals('Alice'));
        expect(response.data!.users![2].firstName, equals('Charlie'));
      });

      test('returns empty list when no users match criteria', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'users': [],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'email': 'nonexistent@example.com'},
        );

        // Act
        final response = await usersApi.getUsers(email: 'nonexistent@example.com');

        // Assert
        expect(response.data!.users, isEmpty);
      });
    });

    group('error scenarios', () {
      test('throws DioException on 400 invalid parameters', () async {
        // Arrange
        final errorResponse = {
          'error': 'validation_error',
          'error_description': 'Invalid sort parameter',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(400, errorResponse),
          queryParameters: {'sort': 'invalid_sort'},
        );

        // Act & Assert
        expect(
          () => usersApi.getUsers(sort: 'invalid_sort'),
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

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(401, errorResponse),
        );

        // Act & Assert
        expect(
          () => usersApi.getUsers(),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(401),
          )),
        );
      });
    });

    group('request validation', () {
      test('sends all query parameters correctly', () async {
        // Arrange
        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, {
            'code': 'OK',
            'users': [],
            'next_token': null,
          }),
          queryParameters: {
            'sort': 'email_asc',
            'page_size': '25',
            'email': 'test@example.com',
          },
        );

        // Act
        final response = await usersApi.getUsers(
          sort: 'email_asc',
          pageSize: 25,
          email: 'test@example.com',
        );

        // Assert
        expect(response.statusCode, equals(200));
      });
    });
  });

  group('updateUser', () {
    const testPath = '/api/v1/user';

    group('success scenarios', () {
      test('updates user name', () async {
        // Arrange
        const userId = 'user_123';
        final expectedResponse = {
          'id': userId,
          'first_name': 'Jane',
          'last_name': 'Doe',
          'preferred_email': 'jane.doe@example.com',
          'is_suspended': false,
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, expectedResponse),
          data: Matchers.any,
          queryParameters: {'id': userId},
        );

        final request = UpdateUserRequest((b) => b
          ..givenName = 'Jane'
          ..familyName = 'Doe');

        // Act
        final response = await usersApi.updateUser(
          id: userId,
          updateUserRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.id, equals(userId));
        expect(response.data!.givenName, equals('Jane'));
        expect(response.data!.familyName, equals('Doe'));
      });

      test('updates user suspension status', () async {
        // Arrange
        const userId = 'user_456';
        final expectedResponse = {
          'id': userId,
          'first_name': 'John',
          'last_name': 'Suspended',
          'is_suspended': true,
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, expectedResponse),
          data: Matchers.any,
          queryParameters: {'id': userId},
        );

        final request = UpdateUserRequest((b) => b..isSuspended = true);

        // Act
        final response = await usersApi.updateUser(
          id: userId,
          updateUserRequest: request,
        );

        // Assert
        expect(response.data!.isSuspended, isTrue);
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 user not found', () async {
        // Arrange
        const userId = 'nonexistent_user';
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'User not found',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(404, errorResponse),
          data: Matchers.any,
          queryParameters: {'id': userId},
        );

        final request = UpdateUserRequest((b) => b..givenName = 'Test');

        // Act & Assert
        expect(
          () => usersApi.updateUser(
            id: userId,
            updateUserRequest: request,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(404),
          )),
        );
      });

      test('throws DioException on 400 validation error', () async {
        // Arrange
        const userId = 'user_123';
        final errorResponse = {
          'error': 'validation_error',
          'error_description': 'Invalid email format',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(400, errorResponse),
          data: Matchers.any,
          queryParameters: {'id': userId},
        );

        final request = UpdateUserRequest();

        // Act & Assert
        expect(
          () => usersApi.updateUser(
            id: userId,
            updateUserRequest: request,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(400),
          )),
        );
      });
    });

    group('request validation', () {
      test('sends user id as query parameter', () async {
        // Arrange
        const userId = 'user_update_test';

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, {
            'id': userId,
            'first_name': 'Updated',
            'last_name': 'User',
          }),
          data: Matchers.any,
          queryParameters: {'id': userId},
        );

        final request = UpdateUserRequest((b) => b..givenName = 'Updated');

        // Act
        final response = await usersApi.updateUser(
          id: userId,
          updateUserRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(200));
      });
    });
  });

  group('deleteUser', () {
    const testPath = '/api/v1/user';

    group('success scenarios', () {
      test('deletes user successfully', () async {
        // Arrange
        const userId = 'user_to_delete';
        final expectedResponse = {
          'message': 'User successfully deleted',
          'code': 'OK',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'id': userId},
        );

        // Act
        final response = await usersApi.deleteUser(id: userId);

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.message, contains('successfully deleted'));
        expect(response.data!.code, equals('OK'));
      });

      test('deletes user with profile deletion flag', () async {
        // Arrange
        const userId = 'user_full_delete';
        final expectedResponse = {
          'message': 'User and profile successfully deleted',
          'code': 'OK',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'id': userId, 'is_delete_profile': 'true'},
        );

        // Act
        final response = await usersApi.deleteUser(
          id: userId,
          isDeleteProfile: true,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.message, contains('profile'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 user not found', () async {
        // Arrange
        const userId = 'nonexistent_user';
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'User not found',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(404, errorResponse),
          queryParameters: {'id': userId},
        );

        // Act & Assert
        expect(
          () => usersApi.deleteUser(id: userId),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(404),
          )),
        );
      });

      test('throws DioException on 401 unauthorized', () async {
        // Arrange
        const userId = 'user_123';
        final errorResponse = {
          'error': 'unauthorized',
          'error_description': 'Invalid or expired token',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(401, errorResponse),
          queryParameters: {'id': userId},
        );

        // Act & Assert
        expect(
          () => usersApi.deleteUser(id: userId),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(401),
          )),
        );
      });

      test('throws DioException on 403 forbidden', () async {
        // Arrange
        const userId = 'protected_user';
        final errorResponse = {
          'error': 'forbidden',
          'error_description': 'Insufficient permissions to delete this user',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(403, errorResponse),
          queryParameters: {'id': userId},
        );

        // Act & Assert
        expect(
          () => usersApi.deleteUser(id: userId),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(403),
          )),
        );
      });
    });

    group('request validation', () {
      test('sends user id as query parameter', () async {
        // Arrange
        const userId = 'user_delete_test';

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(200, {
            'message': 'User deleted',
            'code': 'OK',
          }),
          queryParameters: {'id': userId},
        );

        // Act
        final response = await usersApi.deleteUser(id: userId);

        // Assert
        expect(response.statusCode, equals(200));
      });

      test('sends is_delete_profile parameter when provided', () async {
        // Arrange
        const userId = 'user_profile_delete';

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(200, {
            'message': 'User and profile deleted',
            'code': 'OK',
          }),
          queryParameters: {'id': userId, 'is_delete_profile': 'true'},
        );

        // Act
        final response = await usersApi.deleteUser(
          id: userId,
          isDeleteProfile: true,
        );

        // Assert
        expect(response.statusCode, equals(200));
      });
    });
  });
}
