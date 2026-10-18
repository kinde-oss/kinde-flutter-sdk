# Kinde Starter Kit - Flutter

The Kinde Starter Kit for Flutter SDK.

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](https://makeapullrequest.com) [![Kinde Docs](https://img.shields.io/badge/Kinde-Docs-eee?style=flat-square)](https://kinde.com/docs/developer-tools) [![Kinde Community](https://img.shields.io/badge/Kinde-Community-eee?style=flat-square)](https://thekindecommunity.slack.com)

## Register an account on Kinde

To get started set up an account on [Kinde](https://app.kinde.com/register).

## Development

### Prerequisites

This SDK is suitable for:
- Flutter 3.44.0 or later.
- Dart 3.12.0 or later.
- iOS 15.0 or later when running the example on iOS.

The SDK itself requires Flutter 3.38.1+ and Dart 3.10+. The example has higher
requirements because it uses go_router 18. Routing remains case-insensitive to
preserve existing deep-link behavior.

The example's iOS minimum is 15.0. This does not change the SDK's iOS 13+
minimum; applications consuming the SDK can use their own deployment targets
with compatible build tooling.

The example now uses flutter_secure_storage 11.2+. Existing Android installations
that did not run the version 10 storage migration may need to log in again.
See the SDK's [upgrade requirements](../README.md#upgrade-requirements).

Follow [the installation instructions for your chosen OS](https://docs.flutter.dev/get-started/install) to install dependencies

### Android Java and Gradle setup

Use JDK 17 to run the example's Android build. Android Gradle Plugin 8.13.2
requires Gradle 8.13 or later; the wrapper is configured to use Gradle 8.13.
Java 25 cannot run Gradle 8.x.

For VS Code, set `java.import.gradle.java.home` in your User Settings
to your JDK 17 home directory (not its `bin` directory). This selects the Gradle
daemon's JVM without changing the Java language server's runtime.
Reload VS Code after changing the setting.

For terminal builds, set `JAVA_HOME` to the same JDK home and add
`$JAVA_HOME/bin` to `PATH`. If Flutter selects a different Java installation,
use `flutter config --jdk-dir="/absolute/path/to/jdk-17"` and verify the selection
with `flutter doctor -v`. Note that this Flutter setting affects other Flutter
projects too.

From `example/android`, run `./gradlew --version` to confirm Gradle 8.13 and
JDK 17, then `./gradlew help` to check project configuration. The latter also
requires Flutter and Android SDK setup, including a `local.properties` file
with the SDK paths.

### Regression tests

From the example directory, use the example's minimum Flutter version or later:

```shell
test -f .env || cp .env.example .env
flutter pub get
flutter analyze --no-pub --no-fatal-infos --no-fatal-warnings
flutter test --no-pub
```

The environment file is required to build the asset bundle, but these tests do
not contact Kinde. They cover route matching, the 404 screen, token persistence,
and scoped token deletion. Secure storage is mocked; test native login, logout,
and upgrades of existing installations separately before release.

### Initial set up

1. Clone the repository to your machine:
```shell
https://github.com/kinde-oss/kinde-flutter-sdk.git
```
2. Go into the project:
```shell
cd flutter-starter-kit
```
3. Install the dependencies:
```shell
flutter pub get

# [iOS] Install iOS dependencies
cd ios
pod install
```

### Setup your local environment

1. In Kinde, go to Settings > Applications.

2. Select View details on your app.

3. Scroll down to the Callback URLs section.

4. Add in the callback URLs for your app, which might look something like this:


```shell
  Allowed callback_URLs: "<your_custom_scheme>://kinde_callback"
  Allowed logout_redirect_URLs: "<your_custom_scheme>://kinde_logoutcallback"
```

Note: The custom scheme can either match your appId/bundleId or be something completely new as long as it's distinct enough. Using the appId/bundleId of your app is quite common but it's not always possible if it contains illegal characters for URI schemes (like underscores) or if you already have another handler for that scheme - so just use something else.

In your main.dart file, 

```shell
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await KindeFlutterSDK.initializeSDK(
      authDomain: dotenv.env['KINDE_AUTH_DOMAIN']!,
      authClientId: dotenv.env['KINDE_AUTH_CLIENT_ID']!,
      loginRedirectUri: dotenv.env['KINDE_LOGIN_REDIRECT_URI']!,
      logoutRedirectUri: dotenv.env['KINDE_LOGOUT_REDIRECT_URI']!,
      audience: dotenv.env['KINDE_AUDIENCE'], //optional
      scopes: ["email","profile","offline","openid"] // optional
  );
}
```
Note: To setup the .env file in your flutter package, check the flutter_dotenv package.

### Environment variables:
Put these variables in your `.env` file. You can find these variables on your Settings > Applications > [Your app] > View details page.

- `KINDE_AUTH_DOMAIN` - your Kinde domain

- `KINDE_CLIENT_ID` - your Kinde client ID

- `KINDE_LOGIN_REDIRECT_URI` - your callback url to redirect to after authentication. Make sure this URL is under your Allowed callback URLs.

- `KINDE_LOGOUT_REDIRECT_URI` - where you want users to be redirected to after logging out. Make sure this URL is under your Allowed logout redirect URLs.

- `KINDE_AUDIENCE (optional)` - the intended recipient of an access token. To fetch this value, go to Settings > Applications > [Your app] > APIs

Below is an example of a `.env` file

```shell
KINDE_AUTH_DOMAIN=https://<your_kinde_subdomain>.kinde.com
KINDE_AUTH_CLIENT_ID=<your_kinde_client_id>
KINDE_LOGIN_REDIRECT_URI=<your_custom_scheme>://kinde_callback
KINDE_LOGOUT_REDIRECT_URI=<your_custom_scheme>://kinde_logoutcallback
KINDE_AUDIENCE=<your_kinde_audience>
```

```shell
KINDE_AUTH_DOMAIN='https://myapp.kinde.com'
KINDE_AUTH_CLIENT_ID='clientid'
KINDE_LOGIN_REDIRECT_URI='com.kinde.myapp://kinde_callback'
KINDE_LOGOUT_REDIRECT_URI='com.kinde.myapp://kinde_logoutcallback'
KINDE_AUDIENCE='myapp.kinde.com/api'
```

### Set your Callback and Logout URLs

Your user will be redirected to Kinde to authenticate. After they have logged in or registered they will be redirected back to your Flutter application.

You need to specify in Kinde which url you would like your user to be redirected to in order to authenticate your app.

On the App Keys page set `Allowed callback URLs` to your deep linking

> Important! This is required for your users to successfully log in to your app.

You will also need to set the url they will be redirected to upon logout. Set the `Allowed logout redirect URLs` to your deep linking.

### Configuration Deep link

#### Android

Open `build.gradle` file in your `app` directory of your android folder and change your scheme:

```groovy
      android { 
    defaultConfig {
    manifestPlaceholders += [
      'appAuthRedirectScheme': '<your_custom_scheme>'
            ]
        }
    }
```
Alternatively, the redirect URI can be directly configured by adding an
intent-filter for AppAuth's RedirectUriReceiverActivity to your
AndroidManifest.xml:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    package="com.example.my_app">
...
<activity
        android:name="net.openid.appauth.RedirectUriReceiverActivity"
        android:theme="@style/Theme.AppCompat.Translucent.NoTitleBar"
        android:exported="true"
        tools:node="replace">
    <intent-filter>
        <action android:name="android.intent.action.VIEW"/>
        <category android:name="android.intent.category.DEFAULT"/>
        <category android:name="android.intent.category.BROWSABLE"/>
        <data android:scheme="<your_custom_scheme>"
              android:host="<your_custom_host>"/>
    </intent-filter>
</activity>
...
```

#### iOS

Please make sure you have configuration URL scheme in `Info.plist`:

```shell
	<key>CFBundleURLTypes</key>
	<array>
		<dict>
			<key>CFBundleTypeRole</key>
			<string>Editor</string>
			<key>CFBundleURLName</key>
			<string>your_custom_host</string>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>your_custom_scheme</string>
			</array>
		</dict>
	</array>

```

### How to start?

#### Start your app
Run the following command to use your application
```shell
flutter run
```

## Documentation

For details on integrating this SDK into your project, head over to the [Kinde docs](https://kinde.com/docs/) and see the [Flutter SDK](https://kinde.com/docs/developer-tools/flutter-sdk/) doc 👍🏼.

## Publishing

The core team handles publishing.

## Contributing

Please refer to Kinde’s [contributing guidelines](https://github.com/kinde-oss/.github/blob/489e2ca9c3307c2b2e098a885e22f2239116394a/CONTRIBUTING.md).

## License

By contributing to Kinde, you agree that your contributions will be licensed under its MIT License.
