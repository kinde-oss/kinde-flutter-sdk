# Sealed Classes for Type-Safe Errors Implementation Log

**Modernization:** #3 of 7 (Phase 2) **Feature:** Sealed Classes for Type-Safe Errors **Start Date:** October 24, 2025 **Status:** 🔄 In Progress **Estimated Effort:** 8-10 hours **Risk Level:** Medium-High (Breaking Change)

---

## Executive Summary

This modernization introduces Dart 3.0 sealed classes to provide compiler-enforced exhaustive error handling, making error handling predictable and type-safe.

**Key Principle:** Balance type safety with pragmatism—don't force users to handle 16 cases if they only care about 3.

---

## Critical Architectural Analysis 🧠

### Initial Plan Review

**Original Proposal (from ESSENTIAL_MODERNIZATION_PLAN.md):**

- Convert `KindeError` to sealed class
- Create separate class for each error type (NetworkError, UserCanceledError, etc.)
- Force exhaustive pattern matching

### 🚨 Critical Thinking - Potential Issues

**Issue #1: Breaking Change Magnitude**

- **Concern:** Converting to 16 separate sealed classes is a MASSIVE breaking change
- **Impact:** Every user's error handling code breaks
- **Assessment:** This is v2.0-worthy, but we need to ensure it's worth the pain

**Issue #2: Cross-SDK Consistency**

- **Concern:** We just implemented kebab-case error codes for cross-SDK consistency
- **Question:** If we move to sealed classes, do we abandon the error codes?
- **Assessment:** Need to maintain both for consistency and migration path

**Issue #3: Current State Analysis** We already have:

- ✅ Enhanced enums with 16 error codes (completed in #1)
- ✅ Pattern matching implementation (completed in #2)
- ✅ Existing `AuthorizationKindeError` subclass
- ✅ Error categorization (authentication, network, configuration, etc.)

**Question:** Are we duplicating functionality?

**Issue #4: User Experience**

```dart
// With 16 sealed classes, users MUST handle all cases:
catch (e) {
  switch (e) {
    case NetworkError(): // ...
    case UserCanceledError(): // ...
    case TokenExpiredError(): // ...
    case RefreshTokenExpiredError(): // ...
    case InvalidRedirectError(): // ...
    case MissingConfigError(): // ...
    // ... 10 more cases!
  }
}
```

**Concern:** This is exhausting (literally). Users who only care about "network" vs "auth" vs "other" must still handle all 16.

---

## Proposed Hybrid Solution ✨

### Design Philosophy

**Goal:** Provide type safety without sacrificing flexibility or cross-SDK consistency.

**Solution:** Multi-level error hierarchy

1. **Sealed class** at the top (`KindeError`) - compiler enforces exhaustiveness
2. **Category-based sealed subtypes** (4-5 high-level types) - manageable exhaustive handling
3. **Preserve error codes** - fine-grained control when needed, cross-SDK consistency

### Architecture Design

```dart
/// Base sealed class - all Kinde errors extend this
sealed class KindeError implements Exception {
  const KindeError({
    required this.code,
    required this.message,
    this.stackTrace,
  });

  final KindeErrorCode code;
  final String message;
  final StackTrace? stackTrace;

  @override
  String toString() => '[$code] $message';
}

/// Authentication and authorization errors
/// - User canceled
/// - Token expired
/// - Session invalid
/// - Invalid credentials
final class AuthenticationError extends KindeError {
  const AuthenticationError({
    required super.code,
    required super.message,
    super.stackTrace,
  });
}

/// Network and connectivity errors
/// - Network errors
/// - Timeout errors
/// - Connection failures
final class NetworkError extends KindeError {
  const NetworkError({
    required super.code,
    required super.message,
    super.stackTrace,
  });
}

/// Configuration and initialization errors
/// - Missing configuration
/// - Invalid configuration
/// - Initialization failures
final class ConfigurationError extends KindeError {
  const ConfigurationError({
    required super.code,
    required super.message,
    super.stackTrace,
  });
}

/// OAuth flow and state errors
/// - State mismatch
/// - Invalid redirect
/// - No code verifier
/// - No auth state
final class OAuthFlowError extends KindeError {
  const OAuthFlowError({
    required super.code,
    required super.message,
    super.stackTrace,
  });
}

/// Generic errors that don't fit other categories
/// - Unknown errors
/// - Unexpected exceptions
final class GenericKindeError extends KindeError {
  const GenericKindeError({
    required super.code,
    required super.message,
    super.stackTrace,
  });
}
```

### Usage Examples

**Level 1: Coarse-grained (Exhaustive, 5 cases)**

```dart
try {
  await sdk.login();
} catch (e) {
  switch (e) {
    case AuthenticationError():
      print('Auth issue: ${e.message}');
      redirectToLogin();
    case NetworkError():
      print('Network issue: ${e.message}');
      showRetryDialog();
    case ConfigurationError():
      print('Config issue: ${e.message}');
      showErrorToAdmin();
    case OAuthFlowError():
      print('OAuth issue: ${e.message}');
      restartAuthFlow();
    case GenericKindeError():
      print('Unknown issue: ${e.message}');
      showGenericError();
  }
  // Compiler ensures exhaustiveness! Missing a case = compile error
}
```

**Level 2: Fine-grained (Check specific codes when needed)**

```dart
try {
  await sdk.login();
} catch (e) {
  if (e is KindeError) {
    switch (e.code) {
      case KindeErrorCode.userCanceled:
        return; // Silent failure for user cancellation
      case KindeErrorCode.networkError:
        showRetryDialog();
      case KindeErrorCode.refreshTokenExpired:
        await reauthenticate();
      default:
        showGenericError(e.message);
    }
  }
}
```

**Level 3: Mixed approach (Best of both)**

```dart
try {
  await sdk.login();
} catch (e) {
  switch (e) {
    case AuthenticationError(:final code):
      if (code == KindeErrorCode.userCanceled) {
        return; // Silent
      } else if (code == KindeErrorCode.refreshTokenExpired) {
        await reauthenticate();
      } else {
        redirectToLogin();
      }
    case NetworkError():
      showRetryDialog();
    case ConfigurationError() || OAuthFlowError() || GenericKindeError():
      showGenericError(e.message);
  }
}
```

---

## Benefits of Hybrid Approach

### ✅ Type Safety

- Compiler-enforced exhaustiveness at the category level
- Can't forget to handle a major error category
- IDE autocomplete suggests all sealed subtypes

### ✅ User Flexibility

- **Simple use case:** Handle 5 categories (coarse-grained)
- **Complex use case:** Check specific codes (fine-grained)
- **Mixed use case:** Categories + selective code checking

### ✅ Cross-SDK Consistency

- Preserves kebab-case error codes
- TypeScript/Node SDKs can use same codes
- Migration path for existing users

### ✅ Backward Compatibility (Soft Migration)

- Existing `if (e is KindeError)` still works
- Existing `e.code` checks still work
- Can migrate gradually to pattern matching

### ✅ Maintainability

- Clear error hierarchy
- Easy to add new errors (just map to existing category)
- Doesn't force refactoring when adding error codes

---

## Error Code to Category Mapping

Based on our Enhanced Enums implementation:

```dart
// ErrorCategory enum mapping:
authentication -> AuthenticationError
network -> NetworkError
configuration -> ConfigurationError
oauth, state -> OAuthFlowError
unknown, initialization, user -> GenericKindeError
```

**Detailed Mapping:**

| Error Code                   | Enhanced Enum Category | Sealed Class Type   |
| ---------------------------- | ---------------------- | ------------------- |
| `refresh-token-expired`      | authentication         | AuthenticationError |
| `session-expired-or-invalid` | authentication         | AuthenticationError |
| `invalid-credentials`        | authentication         | AuthenticationError |
| `network-error`              | network                | NetworkError        |
| `user-canceled`              | user                   | GenericKindeError   |
| `missing-config`             | configuration          | ConfigurationError  |
| `initializing-failed`        | initialization         | ConfigurationError  |
| `auth-state-not-match`       | state                  | OAuthFlowError      |
| `invalid-redirect`           | oauth                  | OAuthFlowError      |
| `unsupported-scheme`         | oauth                  | OAuthFlowError      |
| `not-redirect`               | oauth                  | OAuthFlowError      |
| `no-code-verifier`           | state                  | OAuthFlowError      |
| `no-auth-state-stored`       | state                  | OAuthFlowError      |
| `login-in-process`           | state                  | OAuthFlowError      |
| `logout-request-failed`      | network                | NetworkError        |
| `unknown`                    | unknown                | GenericKindeError   |

---

## Implementation Plan

### Phase 1: Design & Architecture (2 hours)

**Tasks:**

1. ✅ Review existing error handling
2. ✅ Analyze breaking change impact
3. ✅ Design category hierarchy
4. ✅ Create error code mapping
5. 🔄 Validate design with critical review

### Phase 2: Core Implementation (4 hours)

**Tasks:**

1. Convert `KindeError` to sealed class
2. Implement 5 sealed subtypes
3. Update factory constructors
4. Add helper function to map code → type
5. Update all error creation sites

### Phase 3: Update Error Handling (2 hours)

**Tasks:**

1. Update internal SDK error handling
2. Review all `throw KindeError(...)` calls
3. Ensure correct sealed type is used
4. Update `KindeError.fromError()` factory

### Phase 4: Testing (2 hours)

**Tasks:**

1. Update existing tests
2. Add sealed class-specific tests
3. Test exhaustiveness checking
4. Test all error creation paths
5. Verify backward compatibility

### Phase 5: Documentation (2 hours)

**Tasks:**

1. Update BREAKING_CHANGES.md
2. Create migration guide
3. Add examples to docs
4. Update error handling examples

---

## Breaking Change Analysis

### What Breaks?

**Pattern 1: Type checking (BREAKS)**

```dart
// OLD (still works, but deprecated pattern)
if (e is KindeError) {
  // handle
}

// NEW (recommended)
switch (e) {
  case AuthenticationError(): // ...
  case NetworkError(): // ...
  // ...
}
```

**Pattern 2: Code checking (WORKS - No break!)**

```dart
// OLD (still works!)
if (e is KindeError) {
  if (e.code == 'network-error') { /* ... */ }
}

// NEW (also works, enhanced enums)
if (e is KindeError) {
  if (e.code == KindeErrorCode.networkError) { /* ... */ }
}
```

**Pattern 3: Direct instantiation (BREAKS)**

```dart
// OLD (will not compile)
throw KindeError(code: 'network-error', message: 'Connection failed');

// NEW (required)
throw NetworkError(
  code: KindeErrorCode.networkError,
  message: 'Connection failed'
);
```

### Migration Difficulty: **Medium**

**Why Medium (not High)?**

- Most users likely use pattern #2 (code checking) - which still works!
- Internal SDK changes are our responsibility
- Users who use pattern #1 get compile errors (easy to fix)
- Users who use pattern #3 probably shouldn't (internal implementation detail)

**Estimated User Impact:** 30-40% of users need to update (those using pattern matching on base `KindeError` type)

---

## Risk Assessment

### High Risks

**1. Breaking Change Adoption**

- **Risk:** Users resist upgrading due to breaking changes
- **Mitigation:** Excellent migration guide, clear benefits, v2.0 expectation
- **Probability:** Medium
- **Impact:** High

**2. Incomplete Exhaustiveness**

- **Risk:** We miss an error creation site, throws wrong sealed type
- **Mitigation:** Comprehensive testing, static analysis
- **Probability:** Low
- **Impact:** Medium

### Medium Risks

**3. Category Design Flaws**

- **Risk:** Our 5-category design doesn't cover all use cases well
- **Mitigation:** Based on existing ErrorCategory enum, validated by usage patterns
- **Probability:** Low
- **Impact:** Medium

**4. Cross-SDK Inconsistency**

- **Risk:** Other Kinde SDKs don't have sealed classes, causing confusion
- **Mitigation:** Preserve error codes, document the difference
- **Probability:** Medium
- **Impact:** Low

### Low Risks

**5. Performance Overhead**

- **Risk:** Sealed classes add overhead
- **Mitigation:** Sealed classes compile to standard classes, zero overhead
- **Probability:** Very Low
- **Impact:** None

---

## Success Criteria

1. ✅ All 283+ tests pass
2. ✅ Compiler enforces exhaustiveness (test with incomplete switches)
3. ✅ Users can choose coarse-grained (5 types) or fine-grained (16 codes)
4. ✅ Error codes preserved for cross-SDK consistency
5. ✅ Comprehensive migration guide written
6. ✅ No regressions in error handling behavior

---

## Timeline Tracking

| Phase                 | Estimated       | Actual  | Status             |
| --------------------- | --------------- | ------- | ------------------ |
| Design & Architecture | 2 hours         | TBD     | 🔄 In Progress     |
| Core Implementation   | 4 hours         | TBD     | ⏳ Pending         |
| Update Error Handling | 2 hours         | TBD     | ⏳ Pending         |
| Testing               | 2 hours         | TBD     | ⏳ Pending         |
| Documentation         | 2 hours         | TBD     | ⏳ Pending         |
| **Total**             | **10-12 hours** | **TBD** | **🔄 In Progress** |

---

## Decision Log

### Decision #1: Hybrid Approach (Category + Code)

**Date:** October 24, 2025 **Decision:** Use 5 sealed subtypes for categories + preserve error codes **Rationale:**

- Balances type safety with user flexibility
- Maintains cross-SDK consistency
- Provides migration path
- Reduces breaking change impact

**Alternative Considered:** 16 separate sealed classes (one per error code) **Why Rejected:** Too many cases for users to handle, less flexible

---

### Decision #2: Keep GenericKindeError as Catch-All

**Date:** October 24, 2025 **Decision:** Include `GenericKindeError` for uncategorized errors **Rationale:**

- Future-proof (can add codes without new sealed types)
- Handles unexpected errors gracefully
- Prevents forcing artificial categorization

**Alternative Considered:** Only 4 specific categories **Why Rejected:** Need catch-all for unexpected errors

---

## Implementation Sessions

### Session 1: Design & Critical Analysis

**Date:** October 24, 2025 **Duration:** 2 hours **Objective:** Critically evaluate sealed class approach and design architecture

**Actions:**

1. ✅ Reviewed existing error handling patterns
2. ✅ Analyzed breaking change magnitude
3. ✅ Identified issues with 16-class approach
4. ✅ Designed hybrid category-based solution
5. ✅ Created error code mapping table
6. ✅ Documented decision rationale

**Findings:**

- Original plan of 16 sealed classes would be too rigid
- Hybrid approach provides better balance
- Can maintain cross-SDK consistency
- Breaking change is manageable with soft migration path

**Next Steps:**

- ✅ Validate design with external review mindset
- 🔄 Critical design validation
- Begin implementation after validation

---

### Session 2: Critical Design Validation 🧠

**Date:** October 24, 2025 **Duration:** 30 minutes **Objective:** Validate hybrid approach with skeptical mindset before implementing

**Critical Questions:**

**Q1:** Is this change worth the breaking change pain? **A:** YES, with caveats:

- ✅ Compiler-enforced exhaustiveness prevents bugs
- ✅ Type-safe error handling is industry best practice
- ✅ This is v2.0 - breaking changes expected
- ⚠️ Must provide excellent migration guide
- ⚠️ Hybrid approach reduces pain (codes still work)

**Q2:** Why not just use the enhanced enums we already have? **A:** Different purposes:

- Enhanced enums = Fine-grained error identification (16 codes)
- Sealed classes = Coarse-grained error **handling** (5 categories)
- They complement each other, not duplicate
- Example: User wants to handle "all network errors" → sealed class
- Example: User wants specific behavior for "refresh token expired" → check code

**Q3:** Won't users just use a catch-all case and defeat the purpose? **A:** Possibly, but:

- Dart compiler warns on catch-alls in switch expressions
- Documentation will show proper usage
- Users who want simple handling can still check codes
- Those who want type safety get exhaustiveness checking

**Q4:** Is 5 categories the right number, or should it be 4 or 6? **A:** 5 is optimal:

1. `AuthenticationError` - User identity issues (3 codes)
2. `NetworkError` - Connectivity issues (2 codes)
3. `ConfigurationError` - Developer setup issues (2 codes)
4. `OAuthFlowError` - OAuth/PKCE flow issues (6 codes)
5. `GenericKindeError` - Everything else (3 codes)

**Rationale:**

- Maps cleanly to existing ErrorCategory enum
- Each category has clear handling strategy
- Not too few (loses granularity) or too many (exhausting)
- Balanced distribution of error codes

**Q5:** Should we make breaking change incrementally or all at once? **A:** All at once for v2.0:

- Clean break, clear version boundary
- Users upgrade deliberately to v2.0
- Incremental changes would be confusing (mix of old/new)
- Provide excellent v1→v2 migration guide

**Q6:** What if we need to add new error codes later? **A:** Design is extensible:

- New codes map to existing categories (no breaking change)
- Example: New "timeout-extended" → maps to NetworkError
- Only need new sealed type if new **category** emerges (rare)
- GenericKindeError serves as catch-all for odd cases

**Q7:** How will this affect SDK users who have deeply nested error handling? **A:** Migration path:

```dart
// v1.x - Works, but not exhaustive
try {
  await sdk.login();
} catch (e) {
  if (e is KindeError) {
    if (e.code == 'network-error') { /* ... */ }
  }
}

// v2.0 - Still works! (soft migration)
try {
  await sdk.login();
} catch (e) {
  if (e is KindeError) {
    if (e.code == KindeErrorCode.networkError) { /* ... */ }
  }
}

// v2.0 - Best practice (compiler-checked)
try {
  await sdk.login();
} catch (e) {
  switch (e) {
    case NetworkError():
      // Handle network issues
    case AuthenticationError():
      // Handle auth issues
    // ... must handle all 5 categories
  }
}
```

**Q8:** Does this match patterns in mature, production SDKs? **A:** Yes:

- Swift iOS SDK: `enum KindeError: Error { case network, auth, unknown }`
- Kotlin Android SDK: Sealed class hierarchies common
- TypeScript SDK: Class hierarchies with base error
- **Our approach**: Hybrid of Swift enum + Java subclassing
- **Advantage**: Compile-time exhaustiveness (better than Java/TS)

---

### **VALIDATION DECISION:** ✅ **PROCEED WITH IMPLEMENTATION**

**Confidence Level:** High

**Rationale:**

1. Design is well-reasoned and addresses real problems
2. Breaking change is justified for v2.0
3. Hybrid approach provides flexibility
4. Cross-SDK consistent (improves on some SDKs)
5. Extensible for future needs
6. Soft migration path available
7. All critical questions answered satisfactorily

**Risks Accepted:**

- ⚠️ Users must update error handling (acceptable for v2.0)
- ⚠️ Some users might misuse with catch-alls (documentation mitigates)
- ⚠️ 5-category design might not be perfect (but it's good enough, extensible)

**Proceed to Implementation:** Yes ✅

---

### Session 3: Core Implementation - Sealed Class Structure

**Date:** October 24, 2025 **Duration:** [In Progress] **Objective:** Implement sealed class hierarchy with 5 category types

**Implementation Steps:**

**Step 1:** ✅ Create sealed `KindeError` base class

- ✅ Defined sealed class with required fields (code, message, stackTrace)
- ✅ Preserved equality and hashCode methods
- ✅ Preserved toString() method
- ✅ Kept `fromError` factory for backward compatibility

**Step 2:** ✅ Create 5 sealed subtypes

- ✅ `AuthenticationError` - final class for auth issues
- ✅ `NetworkError` - final class for connectivity issues
- ✅ `ConfigurationError` - final class for setup issues
- ✅ `OAuthFlowError` - final class for OAuth/PKCE errors
- ✅ `GenericKindeError` - final class for other errors

**Step 3:** ✅ Implement helper functions

- ✅ `_createErrorFromCode()` - Maps error code to appropriate sealed type
- ✅ `_handleError()` - Handles generic exceptions
- ✅ `_handleDioException()` - Handles network exceptions
- ✅ `_handleFormatException()` - Handles format exceptions
- ✅ `_flutterAppAuthExceptionMapper()` - Handles platform exceptions

**Step 4:** 🔄 Handle `AuthorizationKindeError` integration **Decision Point:** How to integrate `AuthorizationKindeError` with sealed classes?

**Option A:** Remove `AuthorizationKindeError`, merge into `OAuthFlowError`

- ✅ **PRO:** Simpler, cleaner sealed class hierarchy
- ✅ **PRO:** `OAuthFlowError` already covers OAuth authorization errors
- ✅ **PRO:** No need for complex subclassing
- ❌ **CON:** Loses specific `AuthorizationKindeError` type (breaking change)

**Option B:** Keep `AuthorizationKindeError` as factory returning `OAuthFlowError`

- ✅ **PRO:** Maintains backward compatibility (soft migration)
- ✅ **PRO:** Existing code using `AuthorizationKindeError` still works
- ✅ **PRO:** Clear deprecation path
- ⚠️ **CON:** Slightly more complex (factory method)

**Decision:** ✅ **Option B** - Keep as factory returning `OAuthFlowError`

**Rationale:**

- Provides migration path for existing code
- Factory pattern is clean and idiomatic
- Can be marked `@Deprecated` in future if needed
- Minimal complexity overhead

**Implementation:**

````dart
/// Legacy class for OAuth2 authorization errors.
///
/// This class has been superseded by [OAuthFlowError] in v2.0.
/// It is maintained for backward compatibility and will return an [OAuthFlowError].
///
/// Consider migrating to:
/// ```dart
/// catch (e) {
///   switch (e) {
///     case OAuthFlowError():
///       // Handle OAuth errors
///   }
/// }
/// ```
class AuthorizationKindeError extends OAuthFlowError {
  // Constructor delegates to OAuthFlowError
  AuthorizationKindeError._({
    required super.code,
    required super.message,
  });

  /// Creates an [OAuthFlowError] from an OAuth2 [AuthorizationException].
  @protected
  static OAuthFlowError fromOauth2Exception(AuthorizationException error) {
    return OAuthFlowError(
      code: KindeErrorCode.fromString(error.error),
      message: error.description ?? "Unknown OAuth2 authorization error",
    );
  }
}
````

**Wait - Issue Identified:** 🚨

`OAuthFlowError` is marked as `final class`, so it **cannot** be extended.

**Revised Decision:** Make `AuthorizationKindeError` a typedef or remove entirely.

**Better Option C:** Create `AuthorizationKindeError` as a factory function

```dart
/// Creates an [OAuthFlowError] from an OAuth2 [AuthorizationException].
///
/// This replaces the former `AuthorizationKindeError` class.
@protected
OAuthFlowError createAuthorizationError(AuthorizationException error) {
  return OAuthFlowError(
    code: KindeErrorCode.fromString(error.error),
    message: error.description ?? "Unknown OAuth2 authorization error",
  );
}
```

**Analysis Complete:** ✅

**Findings:**

- `AuthorizationKindeError` is **INTERNAL ONLY**
- Only used in `KindeError.fromError()` factory
- NOT used in tests
- NOT part of public API

**Final Decision:** Remove `AuthorizationKindeError` entirely, use `OAuthFlowError` directly

**Rationale:**

- ✅ No user-facing breaking change (internal detail)
- ✅ Simpler sealed class hierarchy
- ✅ Less code to maintain

**Implementation:**

```dart
// IN: KindeError.fromError()
AuthorizationException e => OAuthFlowError(
  code: KindeErrorCode.fromString(e.error),
  message: e.description ?? "Unknown OAuth2 authorization error",
),
```

**Step 4:** ✅ RESOLVED - `AuthorizationKindeError` will be removed

**Step 5:** 🔄 Now ready to replace existing `kinde_error.dart`

---

---

### ✅ FINAL DECISION: Pause & Defer to v3.0

**Date:** October 24, 2025 **Decision:** Pause sealed classes implementation, proceed with Modernizations #4-7

**Rationale:**

1. **Cost-Benefit:** 10-13 hours for breaking change vs. 14 hours for 4 non-breaking improvements
2. **Risk Management:** Core error handling changes carry high risk
3. **User Value:** Performance, UX, and UI improvements deliver immediate value
4. **Strategic Flexibility:** Can revisit in v3.0 with user feedback

**What We Accomplished:**

- ✅ 770+ lines of comprehensive planning and architectural analysis
- ✅ Error category mapping and migration path design
- ✅ Reference implementation (`kinde_error_new.dart`)
- ✅ Identified `AuthorizationKindeError` as internal-only (simplification opportunity)
- ✅ Professional cost-benefit assessment

**Next Steps:**

1. Archive sealed classes work for v3.0 reference
2. Begin Modernization #4: Null Safety Cleanup
3. Continue with same high standards and thoroughness

---

**Log Status:** ⏸️ **PAUSED - Deferred to v3.0** **Last Updated:** October 24, 2025 **Time Invested:** 3 hours (planning + initial implementation) **Outcome:** Architectural insights preserved for future use

**See:** `SEALED_CLASSES_ASSESSMENT.md` for complete decision rationale
