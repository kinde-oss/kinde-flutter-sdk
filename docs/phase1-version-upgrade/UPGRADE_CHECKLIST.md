# Flutter 3.35.6 Upgrade - Implementation Checklist

## Pre-Upgrade Tasks

- [ ] Create backup branch: `git checkout -b backup/pre-flutter-3.35-upgrade`
- [ ] Create upgrade branch: `git checkout -b feature/flutter-3.35-upgrade`
- [ ] Document current test results baseline
- [ ] Notify team of upcoming changes

---

## Phase 1: Dependency Resolution (CRITICAL)

### Fix \_macros Package Issue

- [ ] Update `built_value` to latest version
- [ ] Update `built_value_generator` to latest version
- [ ] Run `flutter clean`
- [ ] Run `flutter pub get`
- [ ] Verify `flutter pub outdated` works

### Update Main SDK Dependencies (`pubspec.yaml`)

```yaml
dependencies:
  # Keep existing versions, verify compatibility
  flutter_appauth: ^8.0.3 # TODO: Test
  hive: ^2.2.3 # TODO: Test
  flutter_secure_storage: ^9.0.0 # UPDATE
  path_provider: ^2.1.4 # UPDATE
  dio: ^5.7.0 # UPDATE
  mockito: ^5.4.4 # UPDATE
  shared_preferences: ^2.3.2 # UPDATE
  oauth2: ^2.0.2 # Keep
  jose: ^0.3.4 # Keep
  pubspec_parse: ^1.3.0 # UPDATE
  built_value: ^8.9.2 # UPDATE
  built_collection: ^5.1.1 # Keep
  http_mock_adapter: ^0.6.1 # Keep

dev_dependencies:
  flutter_lints: ^3.0.0 # UPDATE (or ^4.0.0 - stable versions)
  built_value_generator: ^8.9.2 # UPDATE
  build_runner: ^2.4.13 # PIN VERSION
  test: ^1.25.8 # UPDATE
```

- [ ] Update each dependency
- [ ] Run `flutter pub get` after each update
- [ ] Run tests after each update to identify breaking changes

### Update Example App Dependencies (`example/pubspec.yaml`)

```yaml
dependencies:
  url_launcher: ^6.3.1 # UPDATE
  hive: ^2.2.3 # Keep
  flutter_secure_storage: ^9.0.0 # UPDATE
  jwt_decoder: ^2.0.1 # Keep
  flutter_dotenv: ^5.2.1 # UPDATE
  cupertino_icons: ^1.0.8 # UPDATE
  flutter_screenutil: ^5.9.3 # Keep
  go_router: ^14.6.2 # Keep

dev_dependencies:
  flutter_lints: ^4.0.0 # UPDATE (already in use, stable)
```

- [ ] Update each dependency
- [ ] Run `flutter pub get`
- [ ] Test example app compiles

---

## Phase 2: Android Platform Updates

### Update `android/build.gradle`

- [ ] Line 5: Update Kotlin version (REVISED for stability)

  ```gradle
  ext.kotlin_version = '1.9.24'  // Was: 1.7.10 (Production-stable)
  ```

- [ ] Line 12: Update Gradle plugin version (REVISED for stability)

  ```gradle
  classpath 'com.android.tools.build:gradle:8.5.2'  // Was: 7.2.0 (Production-stable)
  ```

- [ ] Line 28: Update compile SDK version (REVISED for stability)

  ```gradle
  compileSdkVersion 34  // Was: 31 (Conservative choice - 35 optional for future)
  ```

- [ ] Line 45: Update minimum SDK version (BREAKING CHANGE)

  ```gradle
  minSdkVersion 24  // Was: 16
  ```

- [ ] Lines 32-37: Update Java compatibility

  ```gradle
  compileOptions {
      sourceCompatibility JavaVersion.VERSION_17  // Was: VERSION_1_8
      targetCompatibility JavaVersion.VERSION_17  // Was: VERSION_1_8
  }

  kotlinOptions {
      jvmTarget = '17'  // Was: '1.8'
  }
  ```

- [ ] Verify namespace declaration is present (should be on line 29)

### Test Android Build

- [ ] Run `flutter clean`
- [ ] Run `cd android && ./gradlew clean`
- [ ] Run `flutter build apk --debug`
- [ ] Test on Android 7.0+ device/emulator
- [ ] Verify app installs and launches

---

## Phase 3: iOS Platform Updates

### Update `ios/kinde_flutter_sdk.podspec`

- [ ] Line 19: Update minimum iOS version
  ```ruby
  s.platform = :ios, '13.0'  # Was: '9.0'
  ```

### Update Example iOS Podfile (Already Correct)

- [ ] Verify `example/ios/Podfile` line 2: `platform :ios, '13.0'` ✅

### Test iOS Build

- [ ] Run `cd ios && pod deintegrate`
- [ ] Run `pod install`
- [ ] Run `flutter clean`
- [ ] Run `flutter build ios --debug --no-codesign`
- [ ] Test on iOS 13+ device/simulator
- [ ] Verify app launches and auth flow works

---

## Phase 4: macOS Platform Updates

### Update `macos/kinde_flutter_sdk.podspec`

- [ ] Line 20: Update minimum macOS version
  ```ruby
  s.platform = :osx, '10.15'  # Was: '10.14'
  ```

### Update `example/macos/Podfile`

- [ ] Line 1: Update minimum macOS version
  ```ruby
  platform :osx, '10.15'  # Was: '10.14'
  ```

### Test macOS Build

- [ ] Run `cd macos && pod deintegrate`
- [ ] Run `pod install`
- [ ] Run `flutter clean`
- [ ] Run `flutter build macos --debug`
- [ ] Test on macOS 10.15+
- [ ] Verify thread merging compatibility
- [ ] Test auth flow works

---

## Phase 5: Material 3 Migration

### Update Example App Theme

- [ ] Update `example/lib/main.dart` lines 81-83:
  ```dart
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    useMaterial3: true,
  ),
  ```

### Visual Testing

- [ ] Test on Android - verify UI looks correct
- [ ] Test on iOS - verify UI looks correct
- [ ] Test on macOS - verify UI looks correct
- [ ] Test on Web - verify UI looks correct
- [ ] Test on Windows - verify UI looks correct
- [ ] Check dark mode support
- [ ] Verify all widgets render correctly
- [ ] Check text contrast ratios
- [ ] Verify button appearances
- [ ] Check dialog appearances

---

## Phase 6: Code Generation

### Regenerate Built Value Code

- [ ] Run `flutter clean`
- [ ] Run `flutter pub get`
- [ ] Run `dart run build_runner clean`
- [ ] Run `dart run build_runner build --delete-conflicting-outputs`
- [ ] Verify no errors in generated files
- [ ] Check for any deprecation warnings
- [ ] Commit generated files

### Verify Serialization

- [ ] Check `lib/src/serializers.g.dart` is up to date
- [ ] Test API request/response serialization
- [ ] Test token serialization/deserialization
- [ ] Test organization model serialization

---

## Phase 7: Testing - Unit Tests

### Run Full Test Suite

- [ ] Run `flutter test --coverage`
- [ ] Verify all 78 tests pass
- [ ] Check test coverage percentage
- [ ] Review any new warnings

### Fix Failing Tests

For each failing test:

- [ ] Identify root cause
- [ ] Update test or implementation
- [ ] Document breaking changes
- [ ] Re-run tests

### Update Test Dependencies

- [ ] Update mockito mocks if needed
- [ ] Update test helpers
- [ ] Add tests for new functionality

---

## Phase 8: Integration Testing - Android

### Android Setup

- [ ] Install on physical device running Android 7.0
- [ ] Install on physical device running Android 14+
- [ ] Install on emulator (API 24)
- [ ] Install on emulator (API 35)

### Android Test Scenarios

- [ ] App installs successfully
- [ ] App launches without crashes
- [ ] Login button works
- [ ] OAuth redirect works
- [ ] Token received and stored
- [ ] User profile displayed
- [ ] Logout button works
- [ ] Token refresh works automatically
- [ ] Register flow works
- [ ] Create organization works
- [ ] Deep links work correctly
- [ ] App survives background/foreground
- [ ] App survives orientation changes
- [ ] Secure storage persists across restarts
- [ ] Performance is acceptable
- [ ] No memory leaks

---

## Phase 9: Integration Testing - iOS

### iOS Setup

- [ ] Install on physical device running iOS 13
- [ ] Install on physical device running iOS 18+
- [ ] Install on simulator (iOS 13)
- [ ] Install on simulator (iOS 18)

### iOS Test Scenarios

- [ ] App installs successfully
- [ ] App launches without crashes
- [ ] Login button works
- [ ] OAuth redirect works
- [ ] ASWebAuthenticationSession works
- [ ] Token received and stored
- [ ] User profile displayed
- [ ] Logout button works
- [ ] Token refresh works automatically
- [ ] Register flow works
- [ ] Create organization works
- [ ] Universal links work correctly
- [ ] App survives background/foreground
- [ ] App survives orientation changes
- [ ] Keychain storage persists across restarts
- [ ] Performance is acceptable
- [ ] No memory leaks

---

## Phase 10: Integration Testing - macOS

### macOS Setup

- [ ] Build for macOS 10.15
- [ ] Build for macOS 15+

### macOS Test Scenarios

- [ ] App installs successfully
- [ ] App launches without crashes
- [ ] Login button works
- [ ] OAuth redirect works
- [ ] ASWebAuthenticationSession works
- [ ] Token received and stored
- [ ] User profile displayed
- [ ] Logout button works
- [ ] Token refresh works automatically
- [ ] Register flow works
- [ ] Create organization works
- [ ] App survives background/foreground
- [ ] Secure storage persists across restarts
- [ ] Thread merging causes no issues
- [ ] Performance is acceptable
- [ ] No memory leaks

---

## Phase 11: Integration Testing - Web

### Web Setup

- [ ] Test in Chrome (latest)
- [ ] Test in Safari (latest)
- [ ] Test in Firefox (latest)
- [ ] Test in Edge (latest)

### Web Test Scenarios

- [ ] App loads successfully
- [ ] Login redirect works
- [ ] OAuth callback processing works
- [ ] State parameter verified
- [ ] Token received and stored in localStorage/sessionStorage
- [ ] User profile displayed
- [ ] Logout works
- [ ] Page refresh preserves session
- [ ] Token refresh works automatically
- [ ] Register flow works
- [ ] Create organization works
- [ ] Browser back button handled correctly
- [ ] CORS configuration correct
- [ ] No console errors
- [ ] Performance is acceptable

---

## Phase 12: Integration Testing - Windows

### Windows Setup

- [ ] Build for Windows 10
- [ ] Build for Windows 11

### Windows Test Scenarios

- [ ] App installs successfully
- [ ] App launches without crashes
- [ ] Login button works
- [ ] OAuth redirect works
- [ ] Token received and stored
- [ ] User profile displayed
- [ ] Logout button works
- [ ] Token refresh works automatically
- [ ] Thread merging causes no issues
- [ ] Performance is acceptable

---

## Phase 13: Integration Testing - Linux

### Linux Setup

- [ ] Build for Ubuntu 22.04+
- [ ] Build for other major distros (optional)

### Linux Test Scenarios

- [ ] App installs successfully
- [ ] App launches without crashes
- [ ] Login button works
- [ ] OAuth redirect works
- [ ] Token received and stored
- [ ] User profile displayed
- [ ] Logout button works
- [ ] Token refresh works automatically
- [ ] Performance is acceptable

---

## Phase 14: Code Quality

### Run Static Analysis

- [ ] Run `dart analyze` - zero errors
- [ ] Run `dart analyze` - review warnings
- [ ] Run `dart format --set-exit-if-changed .`
- [ ] Fix all formatting issues

### Apply Automatic Fixes

- [ ] Run `dart fix --dry-run` - review changes
- [ ] Run `dart fix --apply`
- [ ] Review and commit fixes
- [ ] Run tests again

### Manual Code Review

- [ ] Review all deprecated API usage
- [ ] Replace deprecated APIs
- [ ] Update to new best practices
- [ ] Remove any dead code
- [ ] Update comments and documentation

---

## Phase 15: Documentation Updates

### Update README.md

- [ ] Update minimum Flutter version requirement
- [ ] Update minimum platform versions:
  - Android 7.0 (API 24) minimum
  - iOS 13.0 minimum
  - macOS 10.15 minimum
- [ ] Add migration guide section
- [ ] Update installation instructions
- [ ] Update code examples
- [ ] Add troubleshooting section

### Update CHANGELOG.md

- [ ] Add new version entry
- [ ] List all breaking changes:
  - Minimum Android SDK: 16 → 24
  - Minimum iOS: 9.0 → 13.0
  - Minimum macOS: 10.14 → 10.15
  - Material 3 migration
- [ ] List updated dependencies
- [ ] List bug fixes (if any)
- [ ] List new features (if any)

### Update pubspec.yaml Version

- [ ] Bump SDK version to reflect breaking changes
- [ ] Consider semantic versioning (2.0.0?)
- [ ] Update description if needed

### Update Platform-Specific Documentation

- [ ] Update Android integration docs
- [ ] Update iOS integration docs
- [ ] Update macOS integration docs
- [ ] Update Web integration docs
- [ ] Update Windows integration docs
- [ ] Update Linux integration docs

### Create Migration Guide

- [ ] Create MIGRATION.md
- [ ] Document step-by-step upgrade process
- [ ] Include code examples for breaking changes
- [ ] Add FAQs section
- [ ] Include troubleshooting tips

---

## Phase 16: Final Verification

### Build Verification

- [ ] Clean build Android: `flutter build apk --release`
- [ ] Clean build iOS: `flutter build ios --release`
- [ ] Clean build macOS: `flutter build macos --release`
- [ ] Clean build Web: `flutter build web --release`
- [ ] Clean build Windows: `flutter build windows --release`
- [ ] Clean build Linux: `flutter build linux --release`

### Performance Benchmarks

- [ ] Measure app startup time (Android)
- [ ] Measure app startup time (iOS)
- [ ] Measure auth flow time
- [ ] Measure memory usage
- [ ] Compare with pre-upgrade baseline
- [ ] Document any significant changes

### Security Verification

- [ ] Verify tokens stored securely
- [ ] Verify refresh tokens encrypted
- [ ] Check for sensitive data in logs
- [ ] Verify HTTPS enforcement
- [ ] Test certificate validation
- [ ] Review secure storage implementation

---

## Phase 17: Release Preparation

### Version Control

- [ ] Commit all changes with clear messages
- [ ] Squash commits if needed
- [ ] Create pull request
- [ ] Request code review
- [ ] Address review comments

### Pre-Release Testing

- [ ] Beta test with internal team
- [ ] Beta test with external testers (optional)
- [ ] Collect and address feedback
- [ ] Fix any critical issues

### Release Notes

- [ ] Write user-facing release notes
- [ ] Highlight breaking changes
- [ ] Include migration instructions
- [ ] List new features/improvements
- [ ] Thank contributors

### Package Preparation

- [ ] Run `flutter pub publish --dry-run`
- [ ] Fix any pub.dev warnings
- [ ] Verify package score
- [ ] Check package size

---

## Phase 18: Release

### GitHub Release

- [ ] Merge to main branch
- [ ] Create git tag (e.g., v2.0.0)
- [ ] Push tag to GitHub
- [ ] Create GitHub release
- [ ] Attach release notes
- [ ] Mark as pre-release if needed

### Pub.dev Publishing

- [ ] Run `flutter pub publish`
- [ ] Verify package appears on pub.dev
- [ ] Check package page looks correct
- [ ] Verify documentation renders correctly

### Announcement

- [ ] Post to Kinde community Slack
- [ ] Update Kinde documentation site
- [ ] Tweet/social media announcement (if applicable)
- [ ] Update any external references

---

## Post-Release Monitoring

### Week 1 After Release

- [ ] Monitor GitHub issues
- [ ] Monitor pub.dev analytics
- [ ] Check for crash reports
- [ ] Respond to user questions
- [ ] Address critical bugs immediately

### Month 1 After Release

- [ ] Review adoption metrics
- [ ] Collect user feedback
- [ ] Plan hotfix releases if needed
- [ ] Document lessons learned

---

## Rollback Plan (If Needed)

### If Critical Issues Found

- [ ] Document the issue
- [ ] Assess severity
- [ ] Decide: hotfix or rollback
- [ ] If rollback needed:
  - [ ] Revert main branch to previous version
  - [ ] Create new patch release
  - [ ] Publish rollback version
  - [ ] Update pub.dev
  - [ ] Notify users
  - [ ] Fix issues in feature branch
  - [ ] Re-test thoroughly
  - [ ] Attempt release again

---

## Success Metrics

### Technical Metrics

- [ ] All tests pass (100%)
- [ ] Zero analyzer errors
- [ ] Fewer than 10 analyzer warnings
- [ ] Test coverage > 70%
- [ ] Pub.dev score > 120
- [ ] Build succeeds on all platforms

### Quality Metrics

- [ ] No P0/P1 bugs reported in first week
- [ ] < 5 P2 bugs reported in first month
- [ ] Positive community feedback
- [ ] Smooth migration for existing users

---

## Notes Section

### Issues Encountered

_Document any issues you encounter during the upgrade:_

```
Issue: [Description]
Solution: [How you fixed it]
Time spent: [Estimate]
```

### Helpful Resources

- Flutter 3.35 Release Notes: https://docs.flutter.dev/release/whats-new
- Flutter Breaking Changes: https://docs.flutter.dev/release/breaking-changes
- Material 3 Migration: https://docs.flutter.dev/release/breaking-changes/material-3-migration
- Dart 3.9 Release Notes: https://dart.dev/guides/whats-new

### Time Tracking

| Phase     | Estimated Time | Actual Time | Notes |
| --------- | -------------- | ----------- | ----- |
| Phase 1   | 2-4h           |             |       |
| Phase 2   | 1-2h           |             |       |
| Phase 3   | 1-2h           |             |       |
| Phase 4   | 1-2h           |             |       |
| Phase 5   | 2-3h           |             |       |
| Phase 6   | 1-2h           |             |       |
| Phase 7   | 4-6h           |             |       |
| Phase 8   | 4-6h           |             |       |
| Phase 9   | 4-6h           |             |       |
| Phase 10  | 2-3h           |             |       |
| Phase 11  | 3-4h           |             |       |
| Phase 12  | 2-3h           |             |       |
| Phase 13  | 2-3h           |             |       |
| Phase 14  | 2-3h           |             |       |
| Phase 15  | 2-3h           |             |       |
| Phase 16  | 1-2h           |             |       |
| Phase 17  | 2-3h           |             |       |
| Phase 18  | 1-2h           |             |       |
| **Total** | **40-60h**     |             |       |
