# Breaking Changes for Flutter 3.35.6 Upgrade

## Critical Breaking Changes

### 1. Android Minimum SDK Version

**Impact:** HIGH - Affects all Android users

**Old Configuration:**

```gradle
minSdkVersion 16  // Android 4.1 (Jelly Bean)
```

**New Configuration:**

```gradle
minSdkVersion 24  // Android 7.0 (Nougat)
```

**User Impact:**

- Apps using kinde_flutter_sdk will no longer support Android versions below 7.0
- Users on Android 4.1 - 6.0 cannot install the app
- Approximately 1-3% of global Android users affected (as of 2025)

**Migration Steps:**

1. Update `android/build.gradle` minSdkVersion
2. Update app's minimum SDK in documentation
3. Notify users in release notes
4. Consider maintaining v1.x for legacy support if needed

---

### 2. iOS Minimum Version

**Impact:** MEDIUM - Affects older iOS devices

**Old Configuration:**

```ruby
s.platform = :ios, '9.0'  # iOS 9 (2015)
```

**New Configuration:**

```ruby
s.platform = :ios, '13.0'  # iOS 13 (2019)
```

**User Impact:**

- Apps using kinde_flutter_sdk will no longer support iOS versions below 13.0
- Affects: iPhone 5s, iPhone 6, iPhone 6 Plus, and older iPads
- Approximately 2-5% of iOS users affected (as of 2025)

**Migration Steps:**

1. Update `ios/kinde_flutter_sdk.podspec` platform version
2. Update Info.plist if needed
3. Update deployment target in Xcode
4. Test on iOS 13 device/simulator

---

### 3. macOS Minimum Version

**Impact:** LOW - Affects older Mac computers

**Old Configuration:**

```ruby
s.platform = :osx, '10.14'  # macOS Mojave (2018)
```

**New Configuration:**

```ruby
s.platform = :osx, '10.15'  # macOS Catalina (2019)
```

**User Impact:**

- Apps will no longer support macOS Mojave
- Macs that cannot upgrade to Catalina will be unsupported
- Small percentage of macOS developers affected

**Migration Steps:**

1. Update `macos/kinde_flutter_sdk.podspec` platform version
2. Update `example/macos/Podfile` platform version
3. Test on macOS 10.15+

---

### 4. Material 3 Theme Changes

**Impact:** MEDIUM - Visual changes for users

**Old Code:**

```dart
theme: ThemeData(
  primarySwatch: Colors.blue,
)
```

**New Code:**

```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  useMaterial3: true,
)
```

**User Impact:**

- Visual appearance of widgets will change
- Follows Material 3 design guidelines
- Better accessibility
- More modern look and feel

**Migration Steps:**

1. Update ThemeData in example app
2. Test visual appearance
3. Update any custom themes in user apps
4. Verify color contrast ratios
5. Test dark mode

---

### 5. Thread Merging on macOS/Windows

**Impact:** LOW - Potential plugin compatibility issues

**Change:**

- Flutter 3.35 merges UI and platform threads by default on desktop platforms

**User Impact:**

- Most users won't notice any difference
- Potential issues with plugins that assume separate threads
- Better performance in most cases

**Migration Steps:**

1. Test thoroughly on macOS
2. Test thoroughly on Windows
3. Verify platform channel calls work correctly
4. Monitor for threading-related crashes

---

## Dependency Breaking Changes

### 1. flutter_lints Update

**Old Version:** ^2.0.0 **New Version:** ^5.0.0

**Changes:**

- More strict linting rules
- New recommended practices
- Additional analysis options

**Migration:**

```bash
# Review warnings
dart analyze

# Apply automatic fixes
dart fix --apply

# Manual fixes may be needed for some rules
```

---

### 2. Gradle & Kotlin Updates

**Old Versions:**

- Gradle Plugin: 7.2.0
- Kotlin: 1.7.10
- Java: 1.8

**New Versions (Production-Stable):**

- Gradle Plugin: 8.5.2 (stable, widely adopted)
- Kotlin: 1.9.24 (mature, production-ready)
- Java: 17 (LTS until 2029)

**Migration:** Required for Android compileSdkVersion 35 compatibility

---

## API Deprecations to Address

### 1. primarySwatch (deprecated)

**Status:** Deprecated in Material 3

**Replacement:**

```dart
// Old
primarySwatch: Colors.blue

// New
colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
```

---

## User Migration Guide

### For Existing Users

If you're upgrading from kinde_flutter_sdk v1.x to v2.x:

#### Step 1: Check Flutter Version

```bash
flutter --version
# Should show Flutter 3.35.6 or higher
```

#### Step 2: Update Platform Minimum Versions

**Android (build.gradle):**

```gradle
android {
    defaultConfig {
        minSdkVersion 24  // Changed from 16
    }
}
```

**iOS (Podfile):**

```ruby
platform :ios, '13.0'  # Changed from '9.0'
```

**macOS (Podfile):**

```ruby
platform :osx, '10.15'  # Changed from '10.14'
```

#### Step 3: Update Dependencies

```bash
flutter pub get
flutter pub upgrade
```

#### Step 4: Update Material Theme (if needed)

```dart
MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    useMaterial3: true,
  ),
)
```

#### Step 5: Test Your App

```bash
flutter test
flutter run
```

---

## FAQ

### Q: Will my app still work on older Android devices?

**A:** No. After upgrading to v2.x, your app will only work on Android 7.0 (API 24) and above. If you need to support older devices, continue using v1.x.

### Q: Can I opt-out of Material 3?

**A:** Yes, temporarily. Set `useMaterial3: false` in your ThemeData. However, Material 3 is the future and Material 2 support will eventually be removed.

### Q: Will the upgrade break my existing users?

**A:** Existing users who have already installed your app will continue to work. However, new installations on older devices will be blocked by the Play Store/App Store.

### Q: How long will v1.x be supported?

**A:** Critical security fixes only. All new features will be in v2.x+.

### Q: Do I need to update my Flutter version?

**A:** Yes, you need Flutter 3.35.6 or higher to use kinde_flutter_sdk v2.x.

### Q: Will my authentication tokens still work?

**A:** Yes, the authentication mechanism is unchanged. Existing tokens will continue to work.

### Q: Do I need to update my Kinde application configuration?

**A:** No, no changes needed on the Kinde side.

---

## Compatibility Matrix

| kinde_flutter_sdk | Flutter | Dart    | Android       | iOS   | macOS  |
| ----------------- | ------- | ------- | ------------- | ----- | ------ |
| 1.x               | 3.0.0+  | 2.17.0+ | 4.1+ (API 16) | 9.0+  | 10.14+ |
| 2.0+              | 3.35.6+ | 3.9.0+  | 7.0+ (API 24) | 13.0+ | 10.15+ |

---

## Support

If you encounter issues during migration:

1. **Check Documentation:** [Kinde Flutter SDK Docs](https://kinde.com/docs/developer-tools/flutter-sdk/)
2. **GitHub Issues:** [kinde-oss/kinde-flutter-sdk/issues](https://github.com/kinde-oss/kinde-flutter-sdk/issues)
3. **Community Slack:** [The Kinde Community](https://thekindecommunity.slack.com)

---

## Recommended Timeline for Users

### Immediate Action Required?

**No.** This is a major version update. You can upgrade when ready.

### Suggested Timeline:

**Week 1-2:**

- Review breaking changes
- Test in development environment
- Update development configurations

**Week 3-4:**

- Test in staging environment
- Gather user feedback if in beta
- Prepare release notes for your app

**Week 5-6:**

- Deploy to production
- Monitor for issues
- Have rollback plan ready

---

## Rollback Instructions

If you need to rollback after upgrading:

### Step 1: Downgrade Package

```yaml
# pubspec.yaml
dependencies:
  kinde_flutter_sdk: ^1.1.1 # Previous version
```

### Step 2: Restore Platform Configs

```bash
git checkout main -- android/build.gradle
git checkout main -- ios/Podfile
git checkout main -- macos/Podfile
```

### Step 3: Clean and Rebuild

```bash
flutter clean
flutter pub get
flutter build apk  # or ios, macos, etc.
```

---

## Change Log Reference

For detailed changes, see:

- [CHANGELOG.md](./CHANGELOG.md)
- [UPGRADE_ASSESSMENT.md](./UPGRADE_ASSESSMENT.md)
- [UPGRADE_CHECKLIST.md](./UPGRADE_CHECKLIST.md)
