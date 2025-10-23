# Flutter 3.35.6 Upgrade Assessment for Kinde Flutter SDK

**Date:** October 16, 2025 **Current Flutter Version:** 3.35.6 (already installed) **Current Dart Version:** 3.9.2 **Project:** kinde-flutter-sdk v1.1.1

---

## Executive Summary

This document provides a comprehensive assessment of upgrading the Kinde Flutter SDK to be fully compatible with Flutter 3.35.6 and Dart 3.9.2. The good news is that the development environment is already running Flutter 3.35.6, so we need to ensure the codebase and all dependencies are compatible with this version.

### Current State Analysis

**Main SDK (`pubspec.yaml`):**

- Dart SDK Constraint: `>=2.17.0 <4.0.0` ✅ (compatible with Dart 3.9.2)
- Flutter Constraint: `>=3.0.0` ✅ (compatible with Flutter 3.35.6)

**Example App (`example/pubspec.yaml`):**

- Dart SDK Constraint: `>=3.0.1 <4.0.0` ✅ (compatible with Dart 3.9.2)

**Platform Versions:**

- **Android:** minSdkVersion 16, compileSdkVersion 31
- **iOS:** Platform 13.0 (via Podfile)
- **macOS:** Platform 10.14 (via Podfile)

---

## Critical Issues Identified

### 1. ⚠️ CRITICAL: Dependency Resolution Failure

**Issue:** `flutter pub outdated` command fails with:

```
Package not available (could not find package _macros in the Dart SDK).
Failed to update packages.
```

**Impact:** This indicates a potential compatibility issue with the current dependency versions and Dart 3.9.2.

**Root Cause:** The `_macros` package is an internal Dart SDK feature that may require specific dependency versions.

---

## Platform-Specific Upgrade Requirements

### Android Platform

#### Current Configuration:

- **SDK Build Tools:** 7.2.0 (outdated)
- **Kotlin Version:** 1.7.10 (outdated)
- **Min SDK Version:** 16 (below Flutter 3.35 requirement)
- **Compile SDK Version:** 31 (outdated)
- **Java Compatibility:** 1.8

#### Required Changes:

1. **Min SDK Version:** Must upgrade from 16 to **24 (Android 7.0)**

   - Flutter 3.35 requires minimum API 24
   - Files to update:
     - `android/build.gradle`: Line 45 (`minSdkVersion 16`)

2. **Compile SDK Version:** Upgrade from 31 to **34** (Android 14) - Conservative choice

   - File: `android/build.gradle`: Line 28
   - Note: Using 34 instead of 35 for maximum stability. compileSdkVersion 35 can be considered in a future update

3. **Gradle Plugin:** Upgrade from 7.2.0 to **8.5.2** (stable, production-ready)

   - File: `android/build.gradle`: Line 12
   - Note: 8.5.2 chosen over 8.7.x for better stability and wider adoption

4. **Kotlin Version:** Upgrade from 1.7.10 to **1.9.24** (stable, production-ready)

   - File: `android/build.gradle`: Line 5
   - Note: 1.9.24 chosen over 2.1.0 for better stability and wider adoption

5. **Java Version:** Upgrade from 1.8 to **17** (LTS until 2029)

   - Required for Android Gradle Plugin 8.x
   - Files: `android/build.gradle` (lines 32-37)

6. **Gradle Wrapper:** Already on 8.9 ✅

7. **Namespace Declaration:** Already present ✅ (line 29)

### iOS Platform

#### Current Configuration:

- **Platform Version:** 13.0
- **Swift Version:** 5.0
- **Minimum iOS:** 9.0 (in podspec)

#### Required Changes:

1. **Podfile iOS Version:** Already at 13.0 ✅
2. **Podspec iOS Version:** Upgrade from 9.0 to **13.0**
   - File: `ios/kinde_flutter_sdk.podspec`: Line 19

### macOS Platform

#### Current Configuration:

- **Platform Version:** 10.14

#### Required Changes:

1. **Podfile macOS Version:** Upgrade from 10.14 to **10.15**
   - File: `example/macos/Podfile`: Line 1
2. **Podspec macOS Version:** Upgrade from 10.14 to **10.15**
   - File: `macos/kinde_flutter_sdk.podspec`: Line 20

---

## Material 3 Migration Requirements

### Theme Changes

**Issue Found:**

```dart
// example/lib/main.dart:82
primarySwatch: Colors.blue,
```

**Problem:** `primarySwatch` is deprecated in Material 3. This property is no longer used in Flutter 3.35.6's Material 3 implementation.

**Required Change:**

```dart
// Old (Material 2)
theme: ThemeData(
  primarySwatch: Colors.blue,
),

// New (Material 3)
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  useMaterial3: true,
),
```

---

## Dependency Compatibility Analysis

### Direct Dependencies (from `pubspec.yaml`)

| Package | Current Version | Status | Recommended Action |
| --- | --- | --- | --- |
| `flutter_appauth` | ^8.0.3 | ⚠️ CHECK | Verify compatibility with Flutter 3.35 |
| `hive` | ^2.2.3 | ⚠️ CHECK | May need update |
| `flutter_secure_storage` | ^8.0.0 | ⚠️ CHECK | May need update |
| `path_provider` | ^2.0.15 | ⚠️ OUTDATED | Update to latest |
| `dio` | ^5.0.0 | ⚠️ CHECK | Verify compatibility |
| `one_of_serializer` | >=1.5.0 <2.0.0 | ⚠️ CHECK | Verify compatibility |
| `mockito` | ^5.4.2 | ⚠️ CHECK | May need update |
| `shared_preferences` | ^2.3.1 | ⚠️ CHECK | May need update |
| `oauth2` | ^2.0.2 | ⚠️ CHECK | Verify compatibility |
| `jose` | ^0.3.4 | ⚠️ CHECK | Verify compatibility |
| `pubspec_parse` | ^1.2.1 | ⚠️ CHECK | May need update |
| `built_value` | ^8.9.5 | ⚠️ CHECK | May need update for Dart 3.9 |
| `built_collection` | ^5.1.1 | ⚠️ CHECK | May need update |
| `http_mock_adapter` | ^0.6.1 | ⚠️ CHECK | May need update |

### Dev Dependencies

| Package | Current Version | Status | Recommended Action |
| --- | --- | --- | --- |
| `flutter_lints` | ^2.0.0 | ❌ OUTDATED | Update to ^5.0.0 |
| `built_value_generator` | >=8.4.0 <9.0.0 | ⚠️ CHECK | May need update for Dart 3.9 |
| `build_runner` | any | ⚠️ UNSAFE | Pin to specific version |
| `test` | ^1.16.0 | ⚠️ OUTDATED | Update to latest |

### Example App Dependencies

| Package              | Current Version | Status      | Recommended Action   |
| -------------------- | --------------- | ----------- | -------------------- |
| `url_launcher`       | ^6.1.11         | ⚠️ OUTDATED | Update to latest     |
| `jwt_decoder`        | ^2.0.1          | ⚠️ CHECK    | Verify compatibility |
| `flutter_dotenv`     | ^5.1.0          | ⚠️ CHECK    | Verify compatibility |
| `cupertino_icons`    | ^1.0.2          | ⚠️ OUTDATED | Update to latest     |
| `flutter_screenutil` | ^5.9.3          | ⚠️ CHECK    | Verify compatibility |
| `go_router`          | ^14.8.0         | ⚠️ CHECK    | Verify compatibility |
| `flutter_lints`      | ^4.0.0          | ⚠️ OUTDATED | Update to ^5.0.0     |

---

## Breaking Changes to Address

### 1. Thread Merging on macOS and Windows

**Impact:** Flutter 3.35 merges UI and platform threads by default on macOS and Windows.

**Current Plugin Implementation:**

- `macos/Classes/KindeFlutterSdkPlugin.swift` - Uses simple message passing
- Native code appears minimal and should be compatible

**Action Required:** Test thoroughly on macOS and Windows after upgrade.

### 2. Form Widget and Slivers

**Assessment:** No direct usage of `Form` as sliver detected in codebase.

**Action Required:** None currently, but monitor for future changes.

### 3. Semantics API Changes

**Assessment:** No usage of `elevation` or `thickness` on `SemanticsConfiguration` detected.

**Action Required:** None currently.

### 4. Radio Widget Redesign

**Assessment:** No direct usage of `Radio`, `CupertinoRadio`, or `RadioListTile` detected.

**Action Required:** None currently.

### 5. DropdownButtonFormField Changes

**Assessment:** No usage detected in main SDK or example app.

**Action Required:** None currently.

---

## Code-Level Compatibility Issues

### 1. Authentication Flow (Web Support)

**File:** `lib/src/kinde_flutter_sdk.dart`

**Current Implementation Uses:**

- `flutter_appauth` package for native auth flows
- Custom web implementation via `KindeWeb`
- `flutter_secure_storage` for token storage
- `hive` for encrypted storage

**Potential Issues:**

- Web crypto APIs may have changed
- Secure storage implementation may need updates
- OAuth2 flow handling may have new requirements

### 2. Platform Channel Implementation

**Files:**

- `ios/Classes/KindeFlutterSdkPlugin.swift`
- `android/src/main/kotlin/com/kinde/kinde_flutter_sdk/KindeFlutterSdkPlugin.kt`
- `macos/Classes/KindeFlutterSdkPlugin.swift`

**Assessment:** Minimal platform channel usage. Current implementation is simple and should remain compatible.

### 3. Test Suite Compatibility

**Location:** `test/` directory (78 test files)

**Potential Issues:**

- Mock implementations may need updates
- Test package version may need upgrade
- Built value serialization tests may need updates

---

## Migration Strategy & Action Plan

### Phase 1: Environment & Dependencies (Critical)

**Priority: HIGH | Estimated Time: 2-4 hours**

1. **Resolve `_macros` Dependency Issue**

   - Run `flutter pub get` to regenerate lock file
   - Update `built_value` and `built_value_generator` to latest versions
   - Ensure all code generation dependencies are compatible with Dart 3.9

2. **Update Critical Dependencies**

   ```yaml
   # Update in pubspec.yaml
   dev_dependencies:
     flutter_lints: ^3.0.0 # Using 3.0.0 for stability (4.0.0 also acceptable)
     build_runner: ^2.4.13 # Pin specific version
     test: ^1.25.0
   ```

3. **Update Example App Dependencies**
   ```yaml
   # Update in example/pubspec.yaml
   dependencies:
     url_launcher: ^6.3.0
     cupertino_icons: ^1.0.8
   dev_dependencies:
     flutter_lints: ^5.0.0
   ```

### Phase 2: Platform Configuration Updates

**Priority: HIGH | Estimated Time: 3-5 hours**

1. **Android Configuration Updates**

   - Update `android/build.gradle`:
     - Kotlin version: 1.7.10 → 1.9.24 (production-stable)
     - Gradle plugin: 7.2.0 → 8.5.2 (production-stable)
     - minSdkVersion: 16 → 24
     - compileSdkVersion: 31 → 34 (conservative choice, 35 optional)
     - Java compatibility: 1_8 → VERSION_17 (LTS)

2. **iOS Configuration Updates**

   - Update `ios/kinde_flutter_sdk.podspec`:
     - Platform: 9.0 → 13.0

3. **macOS Configuration Updates**
   - Update `example/macos/Podfile`:
     - Platform: 10.14 → 10.15
   - Update `macos/kinde_flutter_sdk.podspec`:
     - Platform: 10.14 → 10.15

### Phase 3: Material 3 Migration

**Priority: MEDIUM | Estimated Time: 2-3 hours**

1. **Update Theme Implementation**

   - Replace `primarySwatch` with `colorScheme` in `example/lib/main.dart`
   - Add `useMaterial3: true` flag
   - Test visual appearance across all screens

2. **Review Widget Implementations**
   - Check if any custom widgets rely on Material 2 behavior
   - Update any theme-dependent code

### Phase 4: Code Generation & Build

**Priority: HIGH | Estimated Time: 1-2 hours**

1. **Regenerate Built Value Code**

   ```bash
   flutter pub get
   dart run build_runner build --delete-conflicting-outputs
   ```

2. **Verify Serialization**
   - Ensure all generated files are up to date
   - Check for any deprecation warnings

### Phase 5: Comprehensive Testing

**Priority: HIGH | Estimated Time: 8-12 hours**

1. **Unit Tests**

   ```bash
   flutter test
   ```

   - Run all 78 test files
   - Fix any test failures
   - Update mock implementations if needed

2. **Integration Testing**

   - Test authentication flows on all platforms:
     - Android (API 24+)
     - iOS (13+)
     - macOS (10.15+)
     - Web
     - Windows
     - Linux

3. **Platform-Specific Testing**

   - **macOS/Windows:** Test thread merging compatibility
   - **Android:** Test with new minimum SDK
   - **iOS:** Test with iOS 13+ features
   - **Web:** Test OAuth flows and secure storage

4. **Example App Testing**
   ```bash
   cd example
   flutter run -d <device>
   ```
   - Test login/logout flows
   - Test organization creation
   - Test token refresh
   - Test user profile retrieval

### Phase 6: Documentation Updates

**Priority: MEDIUM | Estimated Time: 2-3 hours**

1. **Update README.md**

   - Update minimum Flutter version requirement
   - Update minimum platform versions
   - Add migration notes if any breaking changes

2. **Update CHANGELOG.md**

   - Document all breaking changes
   - List updated dependencies
   - Note new minimum platform versions

3. **Update Integration Documentation**
   - Update any code examples
   - Update platform-specific setup instructions

### Phase 7: Verification & Cleanup

**Priority: MEDIUM | Estimated Time: 1-2 hours**

1. **Run Dart Analyzer**

   ```bash
   dart analyze
   ```

2. **Run Dart Fix**

   ```bash
   dart fix --dry-run
   dart fix --apply
   ```

3. **Check for Deprecated APIs**

   - Review analyzer warnings
   - Update deprecated API usage

4. **Format Code**
   ```bash
   dart format .
   ```

---

## Risk Assessment

### High Risk Areas

1. **Authentication Flow Compatibility**

   - Risk Level: HIGH
   - Mitigation: Extensive testing on all platforms
   - Fallback: Maintain backward compatibility layer

2. **Secure Storage on Web**

   - Risk Level: MEDIUM
   - Mitigation: Test web storage thoroughly
   - Fallback: Document any limitations

3. **Built Value Serialization**
   - Risk Level: MEDIUM
   - Mitigation: Regenerate all code, run full test suite
   - Fallback: Pin to compatible versions

### Medium Risk Areas

1. **Third-Party Plugin Compatibility**

   - Risk Level: MEDIUM
   - Mitigation: Test all plugin integrations
   - Fallback: Update or replace incompatible plugins

2. **Platform-Specific Native Code**
   - Risk Level: LOW-MEDIUM
   - Mitigation: Test on all platforms
   - Fallback: Update native implementations if needed

### Low Risk Areas

1. **UI/Theme Changes**

   - Risk Level: LOW
   - Mitigation: Visual testing
   - Fallback: Easy to revert theme changes

2. **Linter Updates**
   - Risk Level: LOW
   - Mitigation: Address warnings incrementally
   - Fallback: Suppress non-critical warnings

---

## Testing Checklist

### Automated Tests

- [ ] All unit tests pass (`flutter test`)
- [ ] All widget tests pass
- [ ] All integration tests pass
- [ ] No deprecation warnings
- [ ] No analyzer errors
- [ ] Code coverage maintained/improved

### Platform Testing

#### Android (API 24+)

- [ ] App installs and launches
- [ ] Login flow works
- [ ] Logout flow works
- [ ] Token refresh works
- [ ] User profile retrieval works
- [ ] Organization management works
- [ ] Secure storage works
- [ ] Deep links work

#### iOS (13+)

- [ ] App installs and launches
- [ ] Login flow works
- [ ] Logout flow works
- [ ] Token refresh works
- [ ] User profile retrieval works
- [ ] Organization management works
- [ ] Keychain storage works
- [ ] Universal links work

#### macOS (10.15+)

- [ ] App installs and launches
- [ ] Login flow works
- [ ] Logout flow works
- [ ] Token refresh works
- [ ] User profile retrieval works
- [ ] Organization management works
- [ ] Secure storage works
- [ ] Thread merging compatibility verified

#### Web

- [ ] App loads in browser
- [ ] Login redirect works
- [ ] Callback handling works
- [ ] Token storage works
- [ ] Logout works
- [ ] Session persistence works
- [ ] CORS configuration correct

#### Windows

- [ ] App installs and launches
- [ ] Login flow works
- [ ] Logout flow works
- [ ] Thread merging compatibility verified

#### Linux

- [ ] App installs and launches
- [ ] Login flow works
- [ ] Logout flow works

### Performance Testing

- [ ] App startup time acceptable
- [ ] Authentication flow performance acceptable
- [ ] Memory usage within normal range
- [ ] No memory leaks detected
- [ ] Battery usage acceptable (mobile)

### Security Testing

- [ ] Tokens stored securely
- [ ] Refresh tokens encrypted
- [ ] No sensitive data in logs
- [ ] HTTPS enforced
- [ ] Certificate pinning works (if implemented)

---

## Rollback Strategy

### If Critical Issues Discovered:

1. **Version Pinning**

   - Pin Flutter version in CI/CD
   - Document required Flutter version
   - Create compatibility matrix

2. **Feature Flags**

   - Implement feature flags for new Material 3 features
   - Allow gradual rollout

3. **Git Strategy**
   - Create upgrade branch
   - Keep main branch stable
   - Use feature branches for incremental changes

---

## Timeline Estimate

### Conservative Estimate:

- **Phase 1-2:** 1 week (platform config + dependency updates)
- **Phase 3-4:** 3-4 days (Material 3 + code generation)
- **Phase 5:** 2 weeks (comprehensive testing)
- **Phase 6-7:** 3-4 days (documentation + verification)

**Total: 4-5 weeks for complete, thoroughly tested upgrade**

### Aggressive Estimate:

- **Phase 1-2:** 2-3 days
- **Phase 3-4:** 1-2 days
- **Phase 5:** 1 week
- **Phase 6-7:** 1-2 days

**Total: 2-3 weeks with focused effort**

---

## Success Criteria

### Must Have:

✅ All platform minimum versions updated ✅ All dependencies compatible with Flutter 3.35.6 ✅ All tests passing ✅ No analyzer errors ✅ Authentication flows working on all platforms ✅ Example app working on all platforms ✅ Documentation updated

### Should Have:

✅ Material 3 fully implemented ✅ No deprecation warnings ✅ Improved performance metrics ✅ Updated linting rules applied

### Nice to Have:

✅ Enhanced test coverage ✅ Updated CI/CD pipelines ✅ Performance benchmarks documented

---

## Conclusion

The Kinde Flutter SDK upgrade to Flutter 3.35.6 is achievable but requires careful attention to several areas:

**Immediate Concerns:**

1. Resolve the `_macros` dependency issue preventing `pub outdated`
2. Update Android minimum SDK from 16 to 24 (breaking change for users)
3. Update platform version requirements
4. Migrate from Material 2 to Material 3

**Key Success Factors:**

1. Thorough testing on all supported platforms
2. Careful dependency management
3. Clear communication of breaking changes to users
4. Comprehensive documentation

**Recommendation:** Proceed with upgrade in a feature branch with incremental commits for each phase. Implement thorough testing at each stage before proceeding to the next phase. The upgrade is technically feasible and necessary to maintain compatibility with modern Flutter applications.
