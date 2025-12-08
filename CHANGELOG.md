# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2025-12-08

### Added

- Self-serve portal API for authenticated user account management
  - New `SelfServePortalApi` class with `generatePortalUrl` method
  - Support for portal navigation targeting via `subnav` parameter
  - Return URL configuration for post-portal redirects
  - New `PortalLink` model for portal URL responses
- Token caching and automatic refresh functionality
  - Secure token persistence across application sessions using Flutter Secure Storage
  - Background token refresh with configurable buffer (10 seconds before expiry)
  - Automatic state restoration on application restart
  - Platform-specific secure storage implementation (Android EncryptedSharedPreferences, iOS Keychain, Web IndexedDB)
- Billing and monetization parameters
  - `planInterest` parameter for pricing plan specification in authentication flows
  - `pricingTableKey` parameter for pricing table integration
  - Support in `login()`, `register()`, and `createOrg()` methods
- Comprehensive error handling system
  - Enhanced `KindeError` class with detailed error context
  - Expanded `KindeErrorCode` enum with descriptive error codes
  - 186 additional unit tests for error handling scenarios
- Platform modernization support
  - Flutter 3.35.6 compatibility
  - Dart 3.9.2 language feature support (pattern matching, enhanced null safety, records)
  - Updated Android toolchain (Kotlin 1.9.24, Gradle 8.0, AGP 8.5.2)
  - Updated iOS and macOS platform configurations

### Changed

- Upgraded Dart SDK requirement from `>=2.17.0 <3.0.0` to `>=3.9.2 <4.0.0`
- Upgraded Flutter SDK requirement from `>=3.0.0` to `>=3.35.6`
- Updated core dependencies:
  - `flutter_appauth` from ^7.0.0 to ^8.0.3
  - `flutter_secure_storage` from ^8.0.0 to ^9.0.0
  - `path_provider` from ^2.0.15 to ^2.1.4
  - `dio` from ^5.0.0 to ^5.7.0
  - `mockito` from ^5.4.2 to ^5.4.4
  - `shared_preferences` from ^2.3.1 to ^2.3.2
  - `pubspec_parse` from ^1.2.1 to ^1.3.0
  - `built_value` from ^8.9.5 to ^8.9.2
- Updated development dependencies:
  - `flutter_lints` from ^2.0.0 to ^3.0.0
  - `built_value_generator` from `>=8.4.0 <9.0.0` to ^8.9.2
  - `build_runner` from `any` to ^2.4.13
  - `test` from ^1.16.0 to ^1.25.8
- Android platform modernization:
  - Kotlin version from 1.7.10 to 1.9.24
  - Gradle from 7.5 to 8.0
  - Android Gradle Plugin from 7.2.0 to 8.5.2
  - compileSdkVersion from 31 to 34
  - Java from 1.8 to 17 LTS
  - Migrated to Gradle's declarative plugins DSL
- Enhanced authentication flow with improved null safety and pattern matching
- Improved storage abstraction with `KindeSecureStorageInterface`
- Modernized code patterns to utilize Dart 3.x language features

### Removed

- Hive and Hive Flutter dependencies (replaced with Flutter Secure Storage)
- Optional `id_token_hint` parameter from logout requests to prevent URI length errors
- Unnecessary documentation files and comment artifacts

### Fixed

- Fixed HTTP 414 URI Too Long error during logout on mobile platforms (issue #40)
  - Removed optional `id_token_hint` parameter per OIDC specification
  - Implemented direct HTTP logout for mobile platforms
- Fixed macOS build target compatibility issues
- Fixed Android Gradle migration compatibility
- Fixed example application scheme configurations across all platforms
- Corrected iOS minimum version requirements
- Fixed typo in `generatePortalUrl` parameter documentation

### Breaking Changes

**Platform Requirements**

- Android minimum SDK version increased from 16 (Android 4.1) to 24 (Android 7.0)
  - Update `android/app/build.gradle` to set `minSdkVersion 24`
- iOS minimum version increased from 9.0 to 13.0
  - Update `ios/Podfile` to set `platform :ios, '13.0'`
- macOS minimum version increased from 10.14 to 10.15
  - Update `macos/Podfile` to set `platform :osx, '10.15'`

**SDK Requirements**

- Dart SDK requirement changed from `>=2.17.0 <3.0.0` to `>=3.9.2 <4.0.0`
- Flutter SDK requirement changed from `>=3.0.0` to `>=3.35.6`
- Ensure Flutter 3.35.6 or later is installed before upgrading

**Storage Changes**

- Removed Hive dependency in favor of Flutter Secure Storage
- SDK tokens are automatically migrated on first launch
- Applications with custom Hive storage implementations must migrate manually

### Migration Guide

**Step 1: Update Platform Configurations**

Android - Update `android/app/build.gradle`:

```gradle
android {
    compileSdkVersion 34
    defaultConfig {
        minSdkVersion 24
        targetSdkVersion 34
    }
}
```

iOS - Update `ios/Podfile`:

```ruby
platform :ios, '13.0'
```

macOS - Update `macos/Podfile`:

```ruby
platform :osx, '10.15'
```

**Step 2: Update Flutter and Dependencies**

```bash
flutter upgrade
flutter pub upgrade
flutter pub get
```

**Step 3: Test Application**

Verify all authentication flows function correctly:

- Login and registration
- Token refresh and persistence
- Logout functionality
- Session management across application restarts

### Security

- Enhanced secure storage implementation with platform-specific encryption
- Improved token handling and refresh mechanisms
- Updated to latest stable versions of security-critical dependencies

### Deprecated

None

---

## 1.1.1

- New release

## 1.1.0

- Added missing built_collection dependency
- Fixed package validation issues
- Updated dependencies

## 1.0.3

- Added support for lang, connectionId and loginHunt auth params

## 1.0.2

- Removed unsupported platforms (web and desktop)

## 1.0.1

- Fix error with https

## 1.0.0

- First release

---

For more information, visit the [Kinde Flutter SDK documentation](https://kinde.com/docs/developer-tools/flutter-sdk/).
