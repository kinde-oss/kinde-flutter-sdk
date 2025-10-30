# Background Token Refresh - Implementation Plan

**Modernization:** #6 of 7 (Phase 2) **Date:** October 30, 2025 **Status:** ✅ COMPLETE - See `06_background_token_refresh_complete.md` **Approach:** Reference-First, Surgical Precision, Manual Verification

---

## 🎯 Executive Summary

**Implementing Background Token Refresh using the EXACT pattern from Kinde's js-utils SDK.**

**Core Principle:**

> _"Match js-utils implementation precisely. No innovation. No optimization. Just alignment."_

---

## 📋 Reference Pattern (from js-utils)

### Key Components from js-utils

**1. Timer Management** (`refreshTimer.ts`):

```typescript
// Global timer reference
let refreshTimer: number | undefined;

export function setRefreshTimer(timer: number, callback: () => void) {
  clearRefreshTimer(); // ALWAYS clear first
  if (timer <= 0) throw new Error('Timer duration must be positive');

  refreshTimer = window.setTimeout(
    callback,
    Math.min(timer * 1000 - 10000, 86400000) // 10s buffer, 24h max
  );
}

export function clearRefreshTimer() {
  if (refreshTimer !== undefined) {
    window.clearTimeout(refreshTimer);
    refreshTimer = undefined;
  }
}
```

**2. Auto-Refresh After Token Refresh** (`refreshToken.ts` lines 144-156):

```typescript
if (isClient()) {
  const exp = Number((await getClaim('exp'))?.value);
  if (Number.isFinite(exp) || data?.expires_in) {
    let secsToExpiry = 0;
    if (!data?.expires_in) {
      const nowSec = Math.floor(Date.now() / 1000);
      secsToExpiry = Math.max(exp - nowSec, 1); // minimum 1 second
    }
    setRefreshTimer(data?.expires_in || secsToExpiry, async () => {
      refreshToken({domain, clientId, refreshType, onRefresh}); // Recursive
    });
  }
}
```

**Key Insights:**

- ✅ After EVERY successful token refresh, schedule the next refresh
- ✅ Use `exp` claim from JWT or `expires_in` from response
- ✅ 10-second buffer before expiry
- ✅ 24-hour maximum timer duration
- ✅ Clear existing timer before setting new one
- ✅ Minimum 1-second timer
- ✅ Recursive self-scheduling

---

## 🎨 Flutter Implementation Design

### Architecture (Matching js-utils)

```dart
class KindeFlutterSDK with TokenUtils {
  // Global timer reference (matching js-utils pattern)
  Timer? _refreshTimer;

  // Constants matching js-utils
  static const Duration _refreshBufferDuration = Duration(seconds: 10);  // 10s buffer
  static const Duration _maxRefreshInterval = Duration(hours: 24);  // 24h max
  static const Duration _minRefreshInterval = Duration(seconds: 1);  // 1s min

  // Timer management (matching js-utils)
  void _setRefreshTimer(Duration duration, VoidCallback callback) {
    _clearRefreshTimer();  // Always clear first

    if (duration.inSeconds <= 0) {
      throw KindeError(
        code: KindeErrorCode.unknown.code,
        message: 'Timer duration must be positive',
      );
    }

    // Apply buffer and cap (matching js-utils logic)
    final adjustedDuration = Duration(
      milliseconds: min(
        duration.inMilliseconds - _refreshBufferDuration.inMilliseconds,
        _maxRefreshInterval.inMilliseconds,
      ),
    );

    _refreshTimer = Timer(adjustedDuration, callback);
  }

  void _clearRefreshTimer() {
    _refreshTimer?.cancel();
    _refreshTimer = null;
  }

  // Schedule next refresh after token refresh (matching js-utils)
  void _scheduleNextRefresh() {
    // Get expiry from JWT exp claim
    final exp = _getClaim<int>('exp');

    if (exp != null && exp > 0) {
      final nowSec = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final secsToExpiry = max(exp - nowSec, 1);  // minimum 1 second

      _setRefreshTimer(Duration(seconds: secsToExpiry), () async {
        await _performBackgroundRefresh();  // Recursive
      });
    }
  }

  // Background refresh (matches js-utils refreshToken pattern)
  Future<void> _performBackgroundRefresh() async {
    try {
      // Call existing getToken which handles refresh
      await getToken();

      // Schedule next refresh (recursive, matching js-utils)
      _scheduleNextRefresh();
    } catch (e) {
      // If refresh fails, clear timer (user will need to re-authenticate)
      _clearRefreshTimer();
    }
  }
}
```

---

## 🔧 Implementation Steps

### Step 1: Add Timer Infrastructure (15 min)

**File:** `lib/src/kinde_flutter_sdk.dart`

**Add to class:**

```dart
// Background token refresh timer (matches js-utils pattern)
Timer? _refreshTimer;

// Timer constants (matching js-utils)
static const Duration _refreshBufferDuration = Duration(seconds: 10);
static const Duration _maxRefreshInterval = Duration(hours: 24);
static const Duration _minRefreshInterval = Duration(seconds: 1);
```

### Step 2: Implement Timer Management (20 min)

**Add methods:**

```dart
/// Sets a refresh timer with automatic cleanup and safety constraints.
///
/// Matches the pattern from Kinde's js-utils SDK where timers are always
/// cleared before setting, and durations are constrained to prevent
/// extremely long or short timers.
///
/// The timer duration is automatically adjusted to be 10 seconds less than
/// the requested duration (refresh buffer) and capped at 24 hours for safety.
void _setRefreshTimer(Duration duration, VoidCallback callback) {
  _clearRefreshTimer();

  if (duration.inSeconds <= 0) {
    throw KindeError(
      code: KindeErrorCode.unknown.code,
      message: 'Timer duration must be positive',
    );
  }

  // Apply 10-second buffer and 24-hour cap (matching js-utils)
  final adjustedDuration = Duration(
    milliseconds: min(
      duration.inMilliseconds - _refreshBufferDuration.inMilliseconds,
      _maxRefreshInterval.inMilliseconds,
    ),
  );

  // Ensure minimum 1 second
  final safeDuration = adjustedDuration.inSeconds < 1
      ? _minRefreshInterval
      : adjustedDuration;

  _refreshTimer = Timer(safeDuration, callback);
}

/// Clears the current refresh timer if one exists.
///
/// Safe to call even if no timer is currently active.
void _clearRefreshTimer() {
  _refreshTimer?.cancel();
  _refreshTimer = null;
}
```

### Step 3: Implement Auto-Scheduling (30 min)

**Add method:**

```dart
/// Schedules the next background token refresh based on token expiry.
///
/// Matches the pattern from Kinde's js-utils SDK where after every
/// successful token refresh, the next refresh is automatically scheduled
/// using the JWT 'exp' claim.
void _scheduleNextRefresh() {
  // Get expiry from access token's 'exp' claim
  final exp = _getClaim<int>('exp');

  if (exp == null) {
    // No exp claim, cannot schedule refresh
    return;
  }

  // Calculate seconds until expiry
  final nowSec = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  final secsToExpiry = max(exp - nowSec, 1);  // Minimum 1 second

  // Schedule refresh (will fire 10 seconds before actual expiry due to buffer)
  _setRefreshTimer(Duration(seconds: secsToExpiry), () async {
    await _performBackgroundRefresh();
  });
}
```

### Step 4: Implement Background Refresh (20 min)

**Add method:**

```dart
/// Performs a background token refresh and schedules the next one.
///
/// This method is called by the refresh timer and matches the recursive
/// pattern from Kinde's js-utils SDK where refreshToken automatically
/// schedules the next refresh after a successful refresh.
Future<void> _performBackgroundRefresh() async {
  try {
    // Use existing getToken() which handles refresh via interceptor
    await getToken();

    // After successful refresh, schedule the next one (recursive pattern)
    _scheduleNextRefresh();
  } catch (e) {
    // If refresh fails, clear timer
    // User will need to re-authenticate manually
    _clearRefreshTimer();
    kindeDebugPrint(
      methodName: '_performBackgroundRefresh',
      message: 'Background refresh failed: $e',
    );
  }
}
```

### Step 5: Integrate with Existing Flow (30 min)

**Modify `_saveState()` method:**

```dart
_saveState(TokenResponse? tokenResponse) {
  _store.authState = AuthState(
      accessToken: tokenResponse?.accessToken,
      idToken: tokenResponse?.idToken,
      accessTokenExpirationDateTime:
          tokenResponse?.accessTokenExpirationDateTime,
      refreshToken: tokenResponse?.refreshToken,
      scope: tokenResponse?.scopes?.join(' '));
  _kindeApi.setBearerAuth(_bearerAuth, tokenResponse?.accessToken ?? '');

  // Schedule next refresh after saving new token (matches js-utils pattern)
  _scheduleNextRefresh();
}
```

**Modify `_commonLogoutCleanup()` method:**

```dart
Future<void> _commonLogoutCleanup() async {
  // Clear refresh timer on logout
  _clearRefreshTimer();

  _kindeApi.setBearerAuth(_bearerAuth, '');
  await Store.instance.clear();
}
```

### Step 6: Add Import (2 min)

**Add to imports:**

```dart
import 'dart:async';  // Already imported, verify it's there
import 'dart:math';   // For min() and max()
```

---

## ✅ Manual Verification Checklist

### Code Review Checklist

- [ ] **Timer reference**: Single `Timer?` variable (not multiple)
- [ ] **Clear before set**: `_clearRefreshTimer()` called at start of `_setRefreshTimer()`
- [ ] **10-second buffer**: Applied correctly (`duration - 10s`)
- [ ] **24-hour cap**: Applied correctly (`min(adjusted, 24h)`)
- [ ] **Minimum 1s**: Enforced in `_setRefreshTimer()`
- [ ] **Positive validation**: Check `duration.inSeconds <= 0`
- [ ] **Recursive scheduling**: `_scheduleNextRefresh()` called after successful refresh
- [ ] **Logout cleanup**: `_clearRefreshTimer()` called in `_commonLogoutCleanup()`
- [ ] **Save state integration**: `_scheduleNextRefresh()` called in `_saveState()`
- [ ] **Error handling**: Failed refresh clears timer
- [ ] **Null safety**: All nullable types handled

### Logic Verification

**Scenario 1: Token with 3600s expiry**

- Input: `exp` claim = now + 3600
- Expected: Timer set for 3590 seconds (3600 - 10)
- Verify: ✓

**Scenario 2: Token with 48h expiry**

- Input: `exp` claim = now + 172800
- Expected: Timer set for 24 hours (86400s, capped)
- Verify: ✓

**Scenario 3: Token with 5s expiry**

- Input: `exp` claim = now + 5
- Expected: Timer set for 1 second (minimum, after -10s buffer would be negative)
- Verify: ✓

**Scenario 4: Successful refresh**

- Action: Token refreshed successfully
- Expected: New timer scheduled automatically
- Verify: ✓

**Scenario 5: Failed refresh**

- Action: Token refresh fails
- Expected: Timer cleared, no retry
- Verify: ✓

**Scenario 6: User logs out**

- Action: `logout()` called
- Expected: Timer cleared immediately
- Verify: ✓

### Cross-SDK Alignment Verification

- [ ] **Buffer matches**: 10 seconds (same as js-utils)
- [ ] **Max matches**: 24 hours (same as js-utils)
- [ ] **Min matches**: 1 second (same as js-utils)
- [ ] **Clear-first pattern**: Matches js-utils
- [ ] **Recursive scheduling**: Matches js-utils
- [ ] **Error handling**: Matches js-utils (clear on error)

---

## 🧪 Testing Strategy

### Unit Test Scenarios

1. **Timer Setting**

   - Normal duration (1 hour)
   - Very long duration (>24h, should cap)
   - Very short duration (<10s, should use minimum)
   - Zero/negative duration (should throw)

2. **Timer Clearing**

   - Clear when timer exists
   - Clear when no timer (should be safe)
   - Clear multiple times

3. **Scheduling**

   - With valid exp claim
   - Without exp claim (no crash)
   - With expired token
   - With very long expiry

4. **Background Refresh**

   - Successful refresh → schedules next
   - Failed refresh → clears timer
   - Multiple refreshes in sequence

5. **Integration**
   - Login → timer scheduled
   - Token refresh → timer rescheduled
   - Logout → timer cleared
   - App restart → timer not active (expected)

### Manual Testing Scenarios

1. **Normal Flow**

   - Login
   - Wait for refresh (set short expiry for testing)
   - Verify token refreshed automatically
   - Verify no user interruption

2. **Logout During Refresh**

   - Login
   - Logout before timer fires
   - Verify timer cleared
   - Verify no errors

3. **App Lifecycle**
   - Login
   - Background app
   - Return to app
   - Verify behavior is correct

---

## 📊 Success Criteria

### Functional Requirements

- ✅ Token refreshes automatically before expiry
- ✅ No "session expired" errors for active users
- ✅ Timer cleared on logout
- ✅ Failed refresh doesn't crash
- ✅ Matches js-utils behavior exactly

### Non-Functional Requirements

- ✅ No memory leaks (timer properly cleared)
- ✅ No performance impact (single timer)
- ✅ No breaking changes
- ✅ Clean code (readable, maintainable)

### Documentation Requirements

- ✅ Code comments explain js-utils alignment
- ✅ Implementation log updated
- ✅ Manual verification documented

---

## 🎯 Implementation Approach

**Philosophy:** "Reference-First, Verify Manually, Test Thoroughly"

1. **Implement exactly** as js-utils does (no innovation)
2. **Verify manually** that logic matches (use common sense)
3. **Test thoroughly** (automated + manual)
4. **Document completely** (explain decisions)

**Time Estimate:** 2-3 hours **Risk Level:** LOW (non-breaking, well-defined pattern) **Confidence:** HIGH (clear reference implementation)

---

**Status:** Ready to implement with surgical precision.
