# API Test Modernization - Pragmatic Approach

**Date:** December 17, 2025
**Status:** Planning Phase - Self-Review & Reflection
**Goal:** Enterprise-grade API tests without over-engineering

---

## Current State Analysis

### What We Have (19 test files)

**Test Helpers:**
- ✅ `test_helpers/dio_adapter.dart` - Basic `http_mock_adapter` setup (JWKS, logout)
- ⚠️ `test_helpers/dio_mock.dart` - Generic mock returning `{"message": "success", "code": "200"}`

**API Tests (14 files):**
- All use `DioAdapterMock` (generic, valueless responses)
- All have `// TODO` comments
- All only check `isNotNull`
- Zero real HTTP mocking
- Zero error scenario testing

---

## What PR #53 Does (Reference Pattern)

**Test Helpers Structure:**
```
test_helpers/
  - jwt_test_helper.dart           (Focused: JWT token generation)
  - auth_state_fixtures.dart       (Focused: AuthState domain fixtures)
  - mock_store.dart                (Focused: Storage mocking)
  - dio_adapter.dart               (Focused: HTTP mocking)
```

**Key Pattern:** Small, focused, domain-specific helper files. NOT one massive fixtures file.

**Test Pattern from `auth_state_test.dart`:**
- Inline test data in setUp()
- Domain-specific fixtures for complex objects
- AAA pattern (Arrange, Act, Assert)
- Comprehensive edge cases
- No over-abstraction

---

## API Test Requirements

### What APIs Actually Do

**Example: UsersApi**
- `POST /api/v1/user` - Create user
- `DELETE /api/v1/user?id={id}` - Delete user
- `GET /api/v1/user?id={id}` - Get user
- `GET /api/v1/users?sort=...&page_size=...` - List users
- `PATCH /api/v1/user?id={id}` - Update user

**Key Technical Details:**
- Auto-generated APIs using `built_value` serialization
- All require Bearer authentication
- Responses are deserialized to specific types
- Query parameters for filtering/pagination
- Standard HTTP error responses (400, 401, 404, 500)

---

## Minimal Infrastructure Needed

### Option 1: No Helper File (Inline Everything)

**Pros:**
- Most readable (data right next to test)
- No abstraction overhead
- Easy to modify per-test

**Cons:**
- Repetition if same response used multiple times
- Longer test files

**Example:**
```dart
test('should create user successfully', () async {
  // Arrange
  dioAdapter.onPost(
    '/api/v1/user',
    (server) => server.reply(201, {
      'user': {
        'id': 'user_123',
        'email': 'test@example.com',
        'first_name': 'Test',
        'last_name': 'User',
      },
    }),
  );

  // Act
  final response = await usersApi.createUser(
    createUserRequest: CreateUserRequest((b) => b
      ..profile.givenName = 'Test'
      ..profile.familyName = 'User'),
  );

  // Assert
  expect(response.data?.user?.id, equals('user_123'));
  expect(response.data?.user?.email, equals('test@example.com'));
});
```

---

### Option 2: Minimal Helper for Common Patterns Only

**Create `test_helpers/api_response_helpers.dart` ONLY IF we see clear repetition.**

**Scope (if needed):**
```dart
/// Helper for creating common error responses
class ApiErrorResponses {
  static Map<String, dynamic> validation(String message) => {
    'error': 'validation_error',
    'error_description': message,
  };

  static Map<String, dynamic> unauthorized() => {
    'error': 'unauthorized',
    'error_description': 'Invalid or expired token',
  };

  static Map<String, dynamic> notFound(String resource) => {
    'error': 'not_found',
    'error_description': '$resource not found',
  };
}
```

**That's it.** No massive fixtures. No user response builders. Keep it inline.

---

## Recommended Approach

### Phase 1: Single API Test Prototype (users_api_test.dart)

**Steps:**
1. ✅ Upgrade ONE method (`createUser`) with inline fixtures
2. ✅ Add error scenarios (400, 401, 404, 500)
3. ✅ Add request validation
4. ✅ Use proper `http_mock_adapter`
5. ✅ NO helper files yet - prove we need them first

**Success Criteria:**
- Test is readable and maintainable
- Catches real bugs
- No `// TODO` comments
- No `isNotNull` assertions

---

### Phase 2: Evaluate Repetition

**After completing `users_api_test.dart`, ask:**
1. What JSON responses did we repeat?
2. What patterns emerged?
3. Do we ACTUALLY need a helper file?

**Decision Tree:**
- **Low repetition (< 3 times):** Keep inline, NO helper
- **Medium repetition (3-5 times):** Extract to small helper
- **High repetition (> 5 times):** Create focused helper file

---

### Phase 3: Template & Scale

**Once prototype is complete:**
1. ✅ Use `users_api_test.dart` as template
2. ✅ Apply same pattern to remaining 13 API tests
3. ✅ Create helper ONLY if repetition is proven
4. ✅ Keep helpers small and focused

---

## What We Will NOT Do

❌ **Create massive fixtures file** (already deleted)
❌ **Over-engineer test infrastructure**
❌ **Add helpers before proving we need them**
❌ **Abstract away readability**
❌ **Create mock JWT tokens for API tests** (not needed - APIs don't parse JWTs)
❌ **Test built_value serialization** (already tested by library)

---

## Quality Standards (Enterprise-Grade)

### Every API Test Must Have:

1. **Proper HTTP Mocking**
   - Use `http_mock_adapter` not `DioAdapterMock`
   - Mock specific endpoints with realistic responses

2. **Success Scenarios**
   - Valid request → 200/201 response
   - Response deserialization validation
   - Multiple field assertions (not just `isNotNull`)

3. **Error Scenarios**
   - 400 validation errors
   - 401 unauthorized
   - 404 not found
   - 500 server error
   - Network timeout (if applicable)

4. **Request Validation**
   - Verify request body structure
   - Verify query parameters
   - Verify headers (Bearer token)

5. **AAA Pattern**
   ```dart
   // Arrange - setup mocks and data
   // Act - call the API method
   // Assert - verify behavior
   ```

6. **Clear Test Names**
   - ❌ `test('test createUser')`
   - ✅ `test('should create user with valid request')`
   - ✅ `test('should throw DioException on 400 validation error')`

---

## File Structure (Final State)

```
test/
  test_helpers/
    dio_adapter.dart                    (existing - good)
    dio_mock.dart                       (existing - will deprecate)
    api_response_helpers.dart           (create ONLY IF proven needed)

  business_api_test.dart                (upgrade with inline fixtures)
  callbacks_api_test.dart               (upgrade with inline fixtures)
  connected_apps_api_test.dart          (upgrade with inline fixtures)
  environments_api_test.dart            (upgrade with inline fixtures)
  feature_flags_api_test.dart           (upgrade with inline fixtures)
  industries_api_test.dart              (upgrade with inline fixtures)
  o_auth_api_test.dart                  (upgrade with inline fixtures)
  organizations_api_test.dart           (upgrade with inline fixtures)
  permissions_api_test.dart             (upgrade with inline fixtures)
  roles_api_test.dart                   (upgrade with inline fixtures)
  self_serve_portal_api_test.dart       (upgrade with inline fixtures)
  subscribers_api_test.dart             (upgrade with inline fixtures)
  timezones_api_test.dart               (upgrade with inline fixtures)
  users_api_test.dart                   (✨ PROTOTYPE FIRST)

  error/
    kinde_error_code_test.dart          (good - keep)

  kinde_flutter_sdk_test.dart           (good - expand later)
  mock_channels.dart                    (good - keep)
```

**Total:** 19 files (same count, massively improved quality)

---

## Next Action

**Create prototype for `users_api_test.dart` with:**
- Inline fixtures (no helper files)
- All 5 methods upgraded
- Error scenarios for each
- Request validation
- Proper assertions

**Then reflect:** Did we need a helper? What patterns emerged?

**Estimated Time:** 2-3 hours for prototype (going slowly and carefully)

---

## Key Principle

> **"Prefer inline readability over premature abstraction. Extract to helpers only when repetition is proven."**

This aligns with:
- ✅ Enterprise-grade standards (readable, maintainable)
- ✅ PR #53 pattern (small, focused helpers)
- ✅ Pragmatic engineering (solve real problems, not theoretical ones)
- ✅ Easy future maintenance (new developers understand inline data)

---

## Reflection Questions Before Starting

1. ✅ Do we understand the API structure? **Yes - reviewed `users_api.dart`**
2. ✅ Do we have a clear pattern to follow? **Yes - PR #53 auth_state_test.dart**
3. ✅ Are we avoiding over-engineering? **Yes - inline first, extract later**
4. ✅ Is this maintainable? **Yes - readable, no magic abstractions**
5. ✅ Will this catch real bugs? **Yes - comprehensive error scenarios**

---

**Ready to proceed with `users_api_test.dart` prototype?**
