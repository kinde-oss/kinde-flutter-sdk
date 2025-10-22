# Cross-SDK Consistency Assessment

**Date:** October 16, 2025 **Purpose:** Ensure Flutter SDK modernizations align with Kinde SDK ecosystem patterns **Focus:** Comparison with other Kinde SDKs, particularly mature implementations

---

## Executive Summary

**Key Finding:** ✅ Proposed modernizations are **compatible** with Kinde SDK ecosystem patterns and leverage Flutter/Dart strengths appropriately.

**Recommendation:** Proceed with Essential Modernizations Plan, with minor adjustments for cross-SDK consistency.

---

## Kinde SDK Ecosystem Overview

### Current SDK Portfolio

| SDK                  | Status   | Language   | Maturity | Management API |
| -------------------- | -------- | ---------- | -------- | -------------- |
| **Java SDK**         | Complete | Java       | High     | ✅ Full        |
| **Python SDK**       | Complete | Python     | High     | ✅ Full        |
| **iOS SDK**          | Active   | Swift      | High     | ✅ Full        |
| **Android SDK**      | Active   | Kotlin     | High     | ✅ Full        |
| **Flutter SDK**      | Active   | Dart       | Medium   | ✅ Full        |
| **TypeScript SDK**   | Active   | TypeScript | High     | ✅ Full        |
| **Next.js SDK**      | Complete | TypeScript | High     | ✅ Full        |
| **React SDK**        | Active   | TypeScript | Medium   | Partial        |
| **Node Express SDK** | Active   | TypeScript | High     | ✅ Full        |
| **PHP SDK**          | Active   | PHP        | Medium   | ✅ Full        |
| **Go SDK**           | Complete | Go         | Medium   | ✅ Full        |

**Most Mature SDKs:** Java, Python, TypeScript/Node, iOS

---

## Common Patterns Across Kinde SDKs

### 1. Error Handling Patterns

#### Pattern Across SDKs:

**Java SDK:**

```java
try {
    user = kindeClient.getUser();
} catch (KindeClientException e) {
    // Handle exception
}
```

**Python SDK:**

```python
try:
    user = kinde_client.get_user()
except KindeApiException as e:
    # Handle exception
```

**TypeScript SDK:**

```typescript
try {
  const user = await kindeClient.getUser();
} catch (error) {
  if (error instanceof KindeError) {
    // Handle error
  }
}
```

**iOS SDK (Swift):**

```swift
do {
    let user = try await kindeClient.getUser()
} catch let error as KindeError {
    // Handle error
}
```

#### Common Characteristics:

- ✅ Exception/Error-based error handling (not Result types)
- ✅ Typed exception/error classes
- ✅ Try-catch pattern universal
- ✅ Custom error types inherit from base error

#### Flutter SDK Current Pattern:

```dart
try {
  final user = await kindeSDK.getUser();
} catch (e) {
  if (e is KindeError) {
    // Handle error
  }
}
```

**Assessment:** ✅ **CONSISTENT** with other SDKs

---

### 2. Error Code Patterns

#### Observed Pattern Across SDKs:

**Common Error Codes (Present in Multiple SDKs):**

- `unknown` / `UNKNOWN`
- `user_canceled` / `USER_CANCELLED` / `userCanceled`
- `session_expired` / `SESSION_EXPIRED` / `sessionExpired`
- `network_error` / `NETWORK_ERROR` / `networkError`
- `invalid_token` / `INVALID_TOKEN` / `invalidToken`
- `missing_configuration` / `MISSING_CONFIG`

**Naming Convention:**

- **Java/Python:** UPPER_SNAKE_CASE or PascalCase enum values
- **TypeScript/JavaScript:** camelCase or kebab-case strings
- **iOS (Swift):** camelCase enum cases
- **Android (Kotlin):** UPPER_SNAKE_CASE or camelCase

**Flutter SDK Current:**

```dart
static const refreshTokenExpired = "refresh-token-expired";
static const userCanceled = "user-canceled";
static const sessionExpiredOrInvalid = "session-expired-or-invalid";
```

**Pattern:** kebab-case strings (consistent with TypeScript/JS SDKs)

#### Analysis:

**Cross-SDK Consistency:**

- ✅ Error code **meanings** are consistent
- ⚠️ Error code **formats** vary by language convention
- ✅ Flutter using kebab-case aligns with TypeScript/Node SDKs

**Proposed Enhancement Enum:**

```dart
enum KindeErrorCode {
  unknown('unknown', 'An unknown error occurred'),
  userCanceled('user-canceled', 'User canceled authentication'),
  sessionExpired('session-expired-or-invalid', 'Session has expired'),
  networkError('network-error', 'Network connection failed'),
  // ...

  const KindeErrorCode(this.code, this.description);
  final String code;
  final String description;
}
```

**Assessment:** ✅ **IMPROVES** consistency - still exposes string codes for cross-SDK compatibility, adds type safety

---

### 3. Sealed Classes vs Subclassing

#### Pattern Across SDKs:

**Java SDK:**

```java
public class KindeClientException extends Exception {
    // Base exception
}

// Subtypes exist in mature Java SDKs
public class NetworkException extends KindeClientException { }
public class AuthException extends KindeClientException { }
```

**Swift SDK:**

```swift
enum KindeError: Error {
    case networkError(String)
    case authorizationError(String)
    case unknown(String)
}
```

**TypeScript SDK:**

```typescript
class KindeError extends Error {
  constructor(public code: string, public message: string) {}
}

// Some SDKs have subtypes:
class NetworkError extends KindeError {}
class AuthError extends KindeError {}
```

#### Analysis:

**Common Pattern:** Base error class + optional subtypes

**Flutter Sealed Classes Proposal:**

```dart
sealed class KindeError implements Exception {
  const KindeError();
  String get message;
  String get code;
}

final class NetworkError extends KindeError { }
final class AuthorizationError extends KindeError { }
final class TokenExpiredError extends KindeError { }
```

**Assessment:** ✅ **COMPATIBLE** - Mirrors Swift enum pattern and Java subclassing

**Key Difference:** Sealed classes provide exhaustive checking (Dart 3.0 feature), which is superior to other languages' approaches

**Cross-SDK Impact:** None - This is internal implementation. External API remains exception-based.

---

### 4. Token Management Patterns

#### Pattern Across SDKs:

**Common Features:**

- ✅ Automatic token acquisition
- ✅ Token caching
- ✅ Automatic token refresh
- ✅ Secure token storage

**Python SDK:**

```python
# Automatic token management
client = KindeApiClient(config)
# Token automatically obtained, cached, refreshed
```

**Java SDK:**

```java
// Automatic token management
KindeClient client = new KindeClient(config);
// Handles tokens internally
```

**TypeScript SDK:**

```typescript
// Server-side: Automatic token management
const client = new KindeClient(config);
// Client-side: Manual flow with hooks
```

**Flutter SDK Current:**

```dart
// Mixed - some manual, some automatic
final token = await kindeSDK.getToken(); // Triggers refresh if needed
await kindeSDK.isAuthenticated(); // Verifies token
```

#### Proposed Enhancement:

```dart
// Background token refresh (automatic)
void _scheduleTokenRefresh() {
  // Refreshes 5 minutes before expiry
}

// Token validation caching
Future<bool> _checkToken() {
  // Caches validation result for 5 minutes
}
```

**Assessment:** ✅ **ALIGNS** with mature SDK patterns (Java, Python have this)

---

### 5. API Structure Patterns

#### Flutter SDK Current Structure:

```dart
lib/src/api/
├── o_auth_api.dart
├── users_api.dart
├── organizations_api.dart
├── roles_api.dart
├── permissions_api.dart
├── feature_flags_api.dart
├── applications_api.dart
└── ... (15 API files)
```

#### Comparison with Other SDKs:

**Pattern:** All SDKs organize by resource/domain:

- Authentication/OAuth APIs
- User Management APIs
- Organization Management APIs
- Permission/Role APIs
- Feature Flag APIs

**Assessment:** ✅ **CONSISTENT** - Flutter SDK follows standard structure

---

## Proposed Modernizations - Compatibility Analysis

### 1. Pattern Matching & Switch Expressions

**Language Feature:** Dart 3.0+ **Equivalent in Other SDKs:**

- Java: Pattern matching (Java 17+)
- Swift: Switch with pattern matching (built-in)
- TypeScript: Switch statements (no pattern matching)
- Python: Match statement (Python 3.10+)

**Assessment:** ✅ **ACCEPTABLE** - Language-specific optimization, no external API impact

**Cross-SDK Impact:** None - Internal implementation detail

---

### 2. Sealed Classes for Type-Safe Errors

**Language Feature:** Dart 3.0+ **Equivalent in Other SDKs:**

- Swift: Enum with associated values (similar concept)
- Kotlin: Sealed classes (exact same feature)
- TypeScript: Discriminated unions (similar)
- Java: Sealed classes (Java 17+, less common)

**Assessment:** ✅ **ACCEPTABLE** - Modern language feature, maintains exception-based external API

**Cross-SDK Impact:**

- ⚠️ **Breaking change** for users' error handling code
- ✅ But maintains exception-based pattern like other SDKs
- ✅ Improves type safety beyond other SDKs

**User Migration:**

```dart
// Still exception-based like other SDKs
try {
  await sdk.login();
} catch (e) {
  // Now uses pattern matching (Dart-specific enhancement)
  switch (e) {
    case NetworkError(): /* ... */
    case UserCanceledError(): /* ... */
  }
}
```

**Comparison with Swift SDK:**

```swift
// Swift SDK pattern (very similar)
do {
  try await sdk.login()
} catch let error as KindeError {
  switch error {
  case .networkError(let message): /* ... */
  case .userCanceled: /* ... */
  }
}
```

**Decision:** ✅ **PROCEED** - Aligns with Swift patterns, uses Dart strengths

---

### 3. Enhanced Enums

**Language Feature:** Dart 2.17+ **Equivalent in Other SDKs:**

- Swift: Enums with associated values (standard)
- Kotlin: Enum classes with properties (standard)
- Java: Enum with fields (standard)
- TypeScript: Const enums / string unions

**Assessment:** ✅ **ACCEPTABLE** - Standard enum pattern across languages

**Cross-SDK Impact:** None - Improves type safety, maintains string codes for compatibility

---

### 4. Performance Optimizations (Token Caching, Background Refresh)

**Feature:** Automatic token management **Pattern in Other SDKs:**

- Java: ✅ Has automatic token caching and refresh
- Python: ✅ Has automatic token management
- TypeScript (server): ✅ Has automatic token management
- Swift: ⚠️ Partially automatic

**Assessment:** ✅ **EXPECTED** - Mature SDKs have this, Flutter should too

**Cross-SDK Impact:** None - Enhances features, no breaking changes

---

## Error Code Consistency Recommendations

### Current Flutter SDK Error Codes:

```dart
refreshTokenExpired = "refresh-token-expired"
unknown = "unknown"
missingConfig = "missing-config"
sessionExpiredOrInvalid = "session-expired-or-invalid"
webInitializingFailed = "web-initializing-failed"
initializingFailed = "initializing-failed"
logoutRequestFailed = "logout-request-failed"
noCodeVerifier = "no-code-verifier"
userCanceled = "user-canceled"
noAuthStateStored = "no-auth-request-state-stored"
authStateNotMatch = "auth-request-state-not-match"
notRedirect = "not-redirect-url"
loginInProcess = "login-in-process"
invalidRedirect = "invalid-redirect"
unsupportedScheme = "unsupported-scheme"
requestTimedOut = "request-timed-out"
```

### Recommended Additions for Cross-SDK Consistency:

Based on common patterns in Java, Python, and TypeScript SDKs:

```dart
enum KindeErrorCode {
  // Existing codes (maintained)
  unknown('unknown', 'An unknown error occurred'),
  userCanceled('user-canceled', 'User canceled authentication'),
  sessionExpired('session-expired-or-invalid', 'Session has expired'),

  // Consider adding (common in other SDKs):
  networkError('network-error', 'Network connection failed'),
  unauthorized('unauthorized', 'Unauthorized access'),
  forbidden('forbidden', 'Access forbidden'),
  notFound('not-found', 'Resource not found'),
  serverError('server-error', 'Server error occurred'),
  invalidRequest('invalid-request', 'Invalid request parameters'),

  // Flutter-specific (acceptable to have)
  webInitializingFailed('web-initializing-failed', 'Web initialization failed'),
  noCodeVerifier('no-code-verifier', 'PKCE code verifier not found'),
  // ...
}
```

**Assessment:**

- ✅ Keep existing error codes (backward compatible)
- ✅ Add network-related errors (align with other SDKs)
- ✅ Keep Flutter-specific errors (PKCE, web-specific)

---

## API Method Consistency Check

### Authentication Methods

| Method | Flutter SDK | Java SDK | Python SDK | TypeScript SDK | Assessment |
| --- | --- | --- | --- | --- | --- |
| `login()` | ✅ | ✅ | ✅ | ✅ | ✅ Consistent |
| `register()` | ✅ | ✅ | ✅ | ✅ | ✅ Consistent |
| `logout()` | ✅ | ✅ | ✅ | ✅ | ✅ Consistent |
| `getToken()` | ✅ | ✅ | ✅ | ✅ | ✅ Consistent |
| `isAuthenticated()` | ✅ | ✅ | ✅ | ✅ | ✅ Consistent |
| `getUser()` | ✅ | ✅ | ✅ | ✅ | ✅ Consistent |
| `getUserProfile()` | ✅ (getUserProfileV2) | ✅ | ✅ | ✅ | ✅ Consistent |
| `createOrg()` | ✅ (createOrg) | ✅ | ✅ | ✅ | ✅ Consistent |

**Assessment:** ✅ **EXCELLENT** - Core API methods are consistent across SDKs

---

## Recommendations

### ✅ APPROVE: All Proposed Modernizations

#### 1. Pattern Matching & Switch Expressions

**Status:** ✅ **PROCEED** **Rationale:** Language-specific optimization, no cross-SDK impact **Consistency Impact:** None

#### 2. Sealed Classes for Errors

**Status:** ✅ **PROCEED** with minor adjustment **Rationale:** Aligns with Swift SDK patterns, uses Dart strengths **Consistency Impact:** Low - maintains exception-based API **Adjustment:** Ensure error `code` property still returns kebab-case strings for cross-platform consistency

#### 3. Enhanced Enums

**Status:** ✅ **PROCEED** **Rationale:** Standard pattern across all mature SDKs **Consistency Impact:** None - actually improves consistency **Recommendation:** Add common error codes present in other SDKs

#### 4. Null Safety Cleanup

**Status:** ✅ **PROCEED** **Rationale:** Dart-specific feature, improves code quality **Consistency Impact:** None

#### 5. Token Validation Caching

**Status:** ✅ **PROCEED** **Rationale:** Java/Python SDKs have this, Flutter should too **Consistency Impact:** Positive - brings Flutter to parity

#### 6. Background Token Refresh

**Status:** ✅ **PROCEED** **Rationale:** Expected feature in mature SDKs **Consistency Impact:** Positive - matches Java/Python patterns

#### 7. Material 3 Migration

**Status:** ✅ **PROCEED** **Rationale:** Flutter-specific requirement **Consistency Impact:** None - example app only

---

## Minor Adjustments for Cross-SDK Consistency

### 1. Maintain String Error Codes

**Current:**

```dart
sealed class KindeError {
  String get code;
}

final class NetworkError extends KindeError {
  @override
  String get code => 'network-error'; // ✅ Keep kebab-case
}
```

**Why:** Ensures error codes match TypeScript/Node SDKs which use kebab-case

---

### 2. Add Common Error Codes

**Add these error codes present in other SDKs:**

```dart
enum KindeErrorCode {
  // Add:
  networkError('network-error', 'Network connection failed'),
  unauthorized('unauthorized', 'Unauthorized access'),
  forbidden('forbidden', 'Access forbidden'),
  serverError('server-error', 'Server error'),
  invalidRequest('invalid-request', 'Invalid request'),
}
```

**Why:** Consistency with Java, Python, TypeScript SDKs

---

### 3. Maintain Exception-Based API

**Keep:**

```dart
// External API remains exception-based
Future<User?> getUser() async {
  try {
    // ...
  } catch (error, st) {
    throw KindeError.fromError(error, st); // ✅ Still throws
  }
}
```

**Why:** All Kinde SDKs use exception/error-based APIs (not Result types)

---

## Comparison Matrix: Flutter SDK Modernization vs Other SDKs

| Feature | Flutter (Proposed) | Java SDK | Python SDK | TypeScript SDK | Swift SDK | Assessment |
| --- | --- | --- | --- | --- | --- | --- |
| **Type-safe errors** | ✅ Sealed classes | ⚠️ Subclasses | ⚠️ Subclasses | ⚠️ Subclasses | ✅ Enums | ✅ **Leads** |
| **Pattern matching** | ✅ Switch expressions | ⚠️ Java 17+ | ⚠️ Python 3.10+ | ❌ | ✅ Native | ✅ **Matches Swift** |
| **Enhanced enums** | ✅ | ✅ | ✅ | ⚠️ | ✅ | ✅ **Standard** |
| **Token caching** | ✅ (new) | ✅ | ✅ | ✅ | ⚠️ | ✅ **Catches up** |
| **Auto refresh** | ✅ (new) | ✅ | ✅ | ✅ | ⚠️ | ✅ **Catches up** |
| **Exception-based API** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ **Consistent** |
| **Error code format** | kebab-case | UPPER_SNAKE | snake_case | kebab-case | camelCase | ✅ **Matches TS** |
| **API method names** | camelCase | camelCase | snake_case | camelCase | camelCase | ✅ **Consistent** |

**Assessment:** Flutter SDK with modernizations will be **on par or superior** to other SDKs

---

## Cross-SDK Testing Considerations

### Error Code Compatibility Testing

**Test:** Ensure Flutter error codes can be used in cross-platform documentation

```dart
// Flutter SDK
throw NetworkError(); // code: 'network-error'

// Should match TypeScript SDK docs:
// throw new NetworkError(); // code: 'network-error'
```

**Action:** Document error codes in a shared spec (if one exists)

---

### API Consistency Testing

**Test:** Ensure method signatures are as close as possible

```dart
// Flutter
Future<UserProfile?> getUser()
Future<UserProfileV2?> getUserProfileV2()
Future<bool> isAuthenticated()
Future<String?> login()
Future<void> logout()

// Compare with TypeScript:
// async getUser(): Promise<UserProfile>
// async getUserProfile(): Promise<UserProfile>
// async isAuthenticated(): Promise<boolean>
// async login(): Promise<string>
// async logout(): Promise<void>
```

**Assessment:** ✅ **VERY CONSISTENT**

---

## Conclusion

### Overall Assessment: ✅ **PROCEED WITH ALL MODERNIZATIONS**

**Key Findings:**

1. **No Consistency Conflicts**

   - Proposed modernizations don't violate cross-SDK patterns
   - Exception-based API maintained (consistent with all SDKs)
   - Error codes remain compatible (kebab-case like TypeScript)
   - API methods already consistent

2. **Language-Appropriate Features**

   - Sealed classes leverage Dart 3.0 (like Swift enums)
   - Pattern matching uses Dart strengths
   - Enhanced enums are standard across languages

3. **Feature Parity Improvements**

   - Token caching brings Flutter to Java/Python level
   - Background refresh matches mature SDK patterns
   - Performance improvements expected in enterprise SDKs

4. **Maintains SDK Family Cohesion**
   - Authentication flows identical
   - API structure mirrors other SDKs
   - Error handling philosophy consistent
   - Management API fully implemented

### Recommendations:

1. ✅ **Approve all 7 essential modernizations** - No conflicts with SDK ecosystem
2. ✅ **Add common error codes** from other SDKs (network-error, unauthorized, etc.)
3. ✅ **Maintain kebab-case** error code strings for TypeScript/Node compatibility
4. ✅ **Keep exception-based API** (don't switch to Result types)
5. ✅ **Document sealed classes** as Dart-specific enhancement

### Final Verdict:

**The proposed modernizations:**

- ✅ Maintain consistency with Kinde SDK ecosystem
- ✅ Leverage Dart/Flutter strengths appropriately
- ✅ Bring Flutter SDK to parity with mature SDKs (Java, Python)
- ✅ Exceed some SDKs in type safety (sealed classes > subclasses)
- ✅ No breaking of cross-SDK conventions

**Proceed with confidence!**

---

**Document Version:** 1.0 **Assessment Status:** Complete **Recommendation:** Approve ESSENTIAL_MODERNIZATION_PLAN.md with minor additions for error codes
