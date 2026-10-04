# Kinde Flutter SDK
The Kinde SDK For Flutter

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](https://makeapullrequest.com) [![Kinde Docs](https://img.shields.io/badge/Kinde-Docs-eee?style=flat-square)](https://kinde.com/docs/developer-tools) [![Kinde Community](https://img.shields.io/badge/Kinde-Community-eee?style=flat-square)](https://thekindecommunity.slack.com)

## Documentation

For details on integrating this SDK into your project, head over to the [Kinde docs](https://kinde.com/docs/) and see the [Flutter SDK](https://kinde.com/docs/developer-tools/flutter-sdk/) doc 👍🏼.

## Upgrade requirements

- Flutter 3.38.1 or later and Dart 3.10 or later.
- Android API 24+, iOS 13+, and macOS 10.15+.
- The example uses go_router 18 and requires Flutter 3.44+ and Dart 3.12+.

This SDK uses flutter_secure_storage 11.2+. Android data encrypted with legacy
algorithms or EncryptedSharedPreferences must have been migrated by running a
version of the app using flutter_secure_storage 10 before upgrading. Users who
skip that intermediate version may lose their saved session and need to log in
again. Account data on Kinde is not deleted by this local storage upgrade.

If your app also stores other secrets using flutter_secure_storage, review the
[upstream migration notes](https://github.com/mogol/flutter_secure_storage/blob/flutter_secure_storage-v11.2.0/flutter_secure_storage/CHANGELOG.md)
before upgrading: logging in again does not restore unrelated encrypted data.
Test upgrading an existing installation, logging in, restarting the app,
refreshing tokens, and logging out on your supported platforms.

## Publishing

The core team handles publishing.

## Contributing
Please refer to Kinde’s [contributing guidelines](https://github.com/kinde-oss/.github/blob/489e2ca9c3307c2b2e098a885e22f2239116394a/CONTRIBUTING.md).

## License

By contributing to Kinde, you agree that your contributions will be licensed under its MIT License.
