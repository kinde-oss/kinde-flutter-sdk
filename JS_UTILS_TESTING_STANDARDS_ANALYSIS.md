# js-utils Testing Standards Analysis

**Date:** December 17, 2025  
**Purpose:** Analyze js-utils SDK testing patterns to align Flutter SDK tests with enterprise standards

---

## Key Patterns Observed in js-utils

### 1. **Test Organization & Structure**

**Co-location Pattern:**
- Tests live NEXT TO source files (e.g., `getClaim.ts` and `getClaim.test.ts` in same directory)
- One test file per source file
- Focused, modular testing

**Note:** Flutter convention uses separate `test/` directory (standard for Dart/Flutter), so we maintain that pattern but adopt other organizational principles.

---

### 2. **Test Naming Convention** ⚠️ KEY DIFFERENCE

**js-utils style (concise, descriptive phrases):**
```typescript
it("when no token", async () => { ... });
it("boolean true", () => { ... });
it("missing state param", async () => { ... });
it("state mismatch", async () => { ... });
it("get claim string value", async () => { ... });
```

**Our current style (verbose "should" statements):**
```dart
test('should create user with complete profile and email identity', () async { ... });
test('should throw DioException on 400 validation error', () async { ... });
test('should send user id as query parameter', () async { ... });
```

**✅ BETTER APPROACH (aligned with js-utils):**
```dart
test('complete profile with email identity', () async { ... });
test('throws on 400 validation error', () async { ... });
test('sends user id as query parameter', () async { ... });
```

**Rationale:** Shorter, more readable, less verbose. The `group()` context provides enough information.

---

### 3. **Test Grouping & Hierarchy**

**js-utils pattern:**
```typescript
describe("getFlag", () => {
  beforeEach(() => { /* setup */ });

  it("when no token", async () => { ... });
  it("when no flags", async () => { ... });
  it("boolean true", async () => { ... });
  it("string", async () => { ... });

  describe("with forceApi option", () => {
    it("calls API and returns flag value when found", async () => { ... });
    it("returns null when flag not found in API", async () => { ... });
    it("handles API error gracefully", async () => { ... });
  });
});
```

**Our current pattern:**
```dart
group('createUser', () {
  group('success scenarios', () {
    test('should create user...', () async { ... });
  });
  
  group('error scenarios', () {
    test('should throw DioException...', () async { ... });
  });
  
  group('request validation', () {
    test('should send correct headers', () async { ... });
  });
});
```

**✅ ASSESSMENT:** Our grouping is good! We use `group('success scenarios')` which is clear. js-utils uses fewer subgroups but similar organization.

---

### 4. **Assertion Style**

**js-utils pattern:**
```typescript
expect(value).toStrictEqual(null);
expect(value).toStrictEqual({ name: "test", value: "org_123456" });
expect(flagValue).toStrictEqual(true);
expect(result).toStrictEqual({
  success: false,
  error: "Invalid state or code",
});
```

**Our current pattern:**
```dart
expect(response.statusCode, equals(201));
expect(response.data!.id, equals('user_123abc'));
expect(response.data!.created, isTrue);
```

**✅ ASSESSMENT:** Both are good! Dart's `equals()` is equivalent to `toStrictEqual()`. Our assertions are comprehensive and specific.

---

### 5. **Test Helper Pattern** ⚠️ KEY LEARNING

**js-utils `testUtils/` directory:**
```
lib/utils/token/testUtils/
  - index.ts (45 lines - MINIMAL)
```

**Helper content (createMockAccessToken):**
```typescript
const baseMockAccessToken = {
  aud: [],
  azp: "b9da18c441b44d81bab3e8232de2e18d",
  billing: { has_payment_details: false },
  exp: 1168335720000,
  iat: 1168335720000,
  iss: "https://kinde.com",
  jti: "27daa125-2fb2-4e14-9270-742cd56e764b",
  org_code: "org_123456789",
  scp: ["openid", "profile", "email", "offline"],
  sub: "kp_cfcb1ae5b9254ad99521214014c54f43",
};

export const createMockAccessToken = (values = {}) => {
  const header = mockHeader;
  const payload = { ...baseMockAccessToken, ...values };
  // ... JWT creation logic
  return `${encodedHeader}.${encodedPayload}.${signature}`;
};
```

**Key observations:**
- **MINIMAL** - Only 45 lines
- **Focused** - Only creates mock access tokens (domain-specific)
- **Flexible** - Accepts custom values via spread operator
- **Co-located** - Lives in `token/testUtils/` near token tests

**✅ LESSON:** If we create a helper, it should be:
1. Minimal (<50 lines)
2. Domain-specific (e.g., `api_test_utils.dart` for API errors)
3. Flexible (accept custom values)
4. Co-located (in `test_helpers/` which is our equivalent)

---

### 6. **Error Testing Pattern**

**js-utils pattern:**
```typescript
it("missing state param", async () => {
  const urlParams = new URLSearchParams();
  urlParams.append("code", "test");  // Missing 'state'

  const result = await exchangeAuthCode({ /* ... */ });

  expect(result).toStrictEqual({
    success: false,
    error: "Invalid state or code",
  });
});

it("should handle token exchange failure", async () => {
  fetchMock.mockOnce({ status: 500, ok: false, body: "error" });

  const result = await exchangeAuthCode({ /* ... */ });

  expect(result).toStrictEqual({
    success: false,
    error: "Token exchange failed: 500 - error",
  });
});
```

**Our current pattern:**
```dart
test('should throw DioException on 400 validation error', () async {
  dioAdapter.onPost(
    testPath,
    (server) => server.reply(400, errorResponse),
  );

  expect(
    () => usersApi.createUser(createUserRequest: request),
    throwsA(isA<DioException>().having(
      (e) => e.response?.statusCode,
      'status code',
      equals(400),
    )),
  );
});
```

**✅ ASSESSMENT:** Both are excellent! js-utils tests return value with `{success: false, error: "..."}`, while we test exceptions. Both patterns are appropriate for their respective languages.

---

### 7. **Mock Strategy**

**js-utils pattern:**
```typescript
// HTTP mocking
import createFetchMock from "vitest-fetch-mock";
const fetchMock = createFetchMock(vi);

fetchMock.mockResponseOnce(JSON.stringify({
  access_token: "access_token",
  refresh_token: "refresh_token",
  id_token: "id_token",
}));

// Module mocking
vi.mock("./accountApi/callAccountApi", () => ({
  callAccountApiPaginated: vi.fn(),
}));

vi.mocked(callAccountApi.callAccountApiPaginated).mockResolvedValue({
  feature_flags: [/* ... */],
});
```

**Our current pattern:**
```dart
dioAdapter.onPost(
  '/api/v1/user',
  (server) => server.reply(201, {
    'id': 'user_123',
    'created': true,
  }),
  data: Matchers.any,
);
```

**✅ ASSESSMENT:** Both use proper HTTP mocking libraries. Our `http_mock_adapter` is equivalent to `vitest-fetch-mock`. Excellent.

---

### 8. **Setup & Teardown**

**js-utils pattern:**
```typescript
describe("exchangeAuthCode", () => {
  beforeEach(() => {
    fetchMock.enableMocks();
    vi.spyOn(refreshTokenTimer, "setRefreshTimer");
    vi.spyOn(main, "refreshToken");
    vi.useFakeTimers();
  });

  afterEach(() => {
    fetchMock.resetMocks();
    vi.useRealTimers();
  });

  it("test case", async () => { ... });
});
```

**Our current pattern:**
```dart
group('UsersApi', () {
  late Dio dio;
  late DioAdapter dioAdapter;
  late UsersApi usersApi;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://test.kinde.com'));
    dioAdapter = DioAdapter(dio: dio);
    usersApi = KindeApi(dio: dio).getUsersApi();
  });

  tearDown(() {
    dioAdapter.reset();
  });

  test('...', () async { ... });
});
```

**✅ ASSESSMENT:** Identical pattern! Both use setup/teardown for clean state. Excellent.

---

### 9. **Edge Case Coverage**

**js-utils comprehensive edge cases:**
```typescript
it("when no token", async () => { /* ... */ });
it("when no flags", async () => { /* ... */ });
it("when name missing", async () => { /* ... */ });
it("no existing flag", async () => { /* ... */ });
it("missing state param", async () => { /* ... */ });
it("missing code param", async () => { /* ... */ });
it("state mismatch", async () => { /* ... */ });
it("returns null when API returns no flags", async () => { /* ... */ });
```

**Our current coverage:**
```dart
test('should create user with complete profile', () async { /* ... */ });
test('should create user with minimal data', () async { /* ... */ });
test('should create user with multiple identities', () async { /* ... */ });
test('should return empty list when no users match', () async { /* ... */ });
```

**✅ ASSESSMENT:** Both have comprehensive edge case coverage. Good!

---

## Key Adjustments Needed for Flutter SDK

### 1. **Test Naming** (HIGH PRIORITY)

**Change from:**
```dart
test('should create user with complete profile and email identity', () async { ... });
```

**Change to:**
```dart
test('complete profile with email identity', () async { ... });
```

**Rationale:** Align with js-utils concise style. Less verbose, more readable.

---

### 2. **Create Minimal Test Helper** (MEDIUM PRIORITY)

**If repetition is proven after 2-3 API tests, create:**

```dart
// test_helpers/api_test_utils.dart (~50 lines MAX)

/// Minimal test utilities for API testing
class ApiTestUtils {
  /// Common error responses
  static Map<String, dynamic> validationError(String message) => {
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
  
  static Map<String, dynamic> serverError() => {
    'error': 'server_error',
    'error_description': 'Internal server error',
  };
}
```

**Size:** ~50 lines (like js-utils `testUtils/index.ts`)  
**Location:** `test_helpers/api_test_utils.dart`  
**Usage:** Optional, only if pattern repeats 5+ times

---

### 3. **Maintain Current Strengths** (KEEP AS IS)

**✅ Keep:**
- AAA pattern
- Comprehensive error scenarios
- Request validation tests
- Proper HTTP mocking
- Setup/teardown pattern
- Group organization
- Inline fixtures (no massive fixture files)

---

## Comparison Summary

| Aspect | js-utils | Flutter SDK (Current) | Adjustment Needed |
|--------|----------|----------------------|-------------------|
| **Test Naming** | Concise phrases | Verbose "should" | ✅ **Shorten names** |
| **Grouping** | Nested describes | Nested groups | ✅ **Keep as is** |
| **Assertions** | `toStrictEqual` | `equals()` | ✅ **Keep as is** |
| **HTTP Mocking** | vitest-fetch-mock | http_mock_adapter | ✅ **Keep as is** |
| **Setup/Teardown** | beforeEach/afterEach | setUp/tearDown | ✅ **Keep as is** |
| **Test Helpers** | Minimal (~45 lines) | None yet | ✅ **Add if needed** |
| **Error Testing** | Return values | Exception throwing | ✅ **Keep as is** |
| **Edge Cases** | Comprehensive | Comprehensive | ✅ **Keep as is** |
| **Inline Fixtures** | Yes | Yes | ✅ **Keep as is** |

---

## Action Items

### Immediate (users_api_test.dart adjustments)

1. **✅ Shorten test names** - Remove "should" prefix, make concise
   - Before: `'should create user with complete profile and email identity'`
   - After: `'complete profile with email identity'`

2. **✅ Evaluate helper need** - After 2-3 more API tests, decide if error helper is worth creating

---

### For Remaining 13 API Tests

1. **✅ Use concise test names** from the start
2. **✅ Maintain AAA pattern**
3. **✅ Keep comprehensive error coverage**
4. **✅ Use inline fixtures** (no massive helpers)
5. **✅ Add minimal helper ONLY if repetition exceeds 5 instances**

---

## Enterprise Standards Alignment

**js-utils demonstrates:**
- ✅ Concise, readable test names
- ✅ Comprehensive edge case coverage
- ✅ Proper mocking strategies
- ✅ Minimal, focused helpers
- ✅ Clear test organization
- ✅ No over-engineering

**Our Flutter SDK will demonstrate the same standards by:**
- ✅ Adopting concise naming
- ✅ Maintaining comprehensive coverage
- ✅ Using proper HTTP mocking
- ✅ Creating minimal helpers (if needed)
- ✅ Keeping clear organization
- ✅ Avoiding over-engineering

---

## Conclusion

**Current Status:** 90% aligned with js-utils standards  
**Key Adjustment:** Shorten test names to match js-utils concise style  
**Optional:** Add minimal error helper if pattern repeats 5+ times

**Next Steps:**
1. Refactor `users_api_test.dart` test names (15 minutes)
2. Continue with remaining API tests using new naming convention
3. Evaluate helper need after 3 API files complete
4. Maintain all other current patterns (they're excellent!)

**Result:** Enterprise-grade testing aligned with established Kinde SDK standards.
