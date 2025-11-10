# Changelog

## 2.0.0

**Release Date:** November 10, 2025

### ⚠️ Breaking Changes

#### Platform Requirements

- **Android:** Minimum SDK version raised from API 16 (Android 4.1) to API 24 (Android 7.0)
- **iOS:** Minimum version raised from 9.0 to 13.0
- **macOS:** Minimum version raised from 10.14 to 10.15
- **Flutter:** Now requires Flutter 3.35.6+ (previously 3.0.0+)
- **Dart:** Now requires Dart 3.9.2+ (previously 2.17.0+)

#### Build Tools (Android)

- Gradle Plugin updated to 8.5.2 (previously 7.2.0)
- Kotlin updated to 1.9.24 (previously 1.7.10)
- Java updated to 17 LTS (previously 1.8)

#### Material Design

- Example app now uses Material 3 design language
- Set `useMaterial3: false` in your `ThemeData` if you need to opt out

### ✨ New Features

- **Background Token Refresh:** Tokens now automatically refresh 10 seconds before expiry, eliminating unexpected "session expired" errors
- **Token Validation Caching:** Authentication checks are now 10-20x faster through intelligent caching
- **Enhanced Enums:** Error codes now use type-safe enums instead of string constants
- **Pattern Matching:** Codebase modernized with Dart 3.0 switch expressions

### 🐛 Bug Fixes

- Fixed macOS build warnings related to deployment targets
- Fixed Android namespace declarations for Gradle 8.x compatibility
- Improved error handling for malformed tokens

### 📈 Performance Improvements

- Token validation now 10-50x faster (5-10ms → 0.1-1ms)
- Reduced codebase complexity (-86 lines)
- Improved memory management for background operations

### 🚀 Migration Guide

1. Update Flutter to 3.35.6 or higher
2. Update `pubspec.yaml` to use `kinde_flutter_sdk: ^2.0.0`
3. Update platform minimum versions:
   - Android: Set `minSdkVersion 24` in `android/build.gradle`
   - iOS: Set `platform :ios, '13.0'` in `ios/Podfile`
   - macOS: Set `platform :osx, '10.15'` in `macos/Podfile`
4. Run `flutter clean && flutter pub get`
5. Test your application on all target platforms

For detailed migration instructions, see [BREAKING_CHANGES.md](docs/guides/BREAKING_CHANGES.md)

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
