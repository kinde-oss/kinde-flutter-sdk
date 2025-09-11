# Android OAuth Setup for Kinde Flutter SDK

This guide provides complete instructions for configuring Android OAuth authentication with the Kinde Flutter SDK, including the fix for the common "Failed to authorize: Null intent received" error.

## Overview

The Kinde Flutter SDK uses the AppAuth library for OAuth authentication on Android. Proper configuration requires changes to both your `build.gradle` file and `AndroidManifest.xml` file.

## Step-by-Step Configuration

### Step 1: Configure build.gradle

Open your `android/app/build.gradle` file (or `build.gradle.kts` if using Kotlin DSL) and add the manifest placeholders in the `defaultConfig` section:

**For Groovy DSL (build.gradle):**
```groovy
android {
    defaultConfig {
        applicationId "com.yourcompany.yourapp"
        // ... other configuration

        manifestPlaceholders += [
            'appAuthRedirectScheme': 'your_custom_scheme'
        ]
    }
}
```

**For Kotlin DSL (build.gradle.kts):**
```kotlin
android {
    defaultConfig {
        applicationId = "com.yourcompany.yourapp"
        // ... other configuration

        manifestPlaceholders += mapOf(
            "appAuthRedirectScheme" to "your_custom_scheme"
        )
    }
}
```

Replace `your_custom_scheme` with your chosen custom scheme (e.g., `com.yourcompany.yourapp` or `myapp-auth`).

### Step 2: Configure AndroidManifest.xml

Open your `android/app/src/main/AndroidManifest.xml` file and make the following changes:

#### 2.1 Add Tools Namespace
Add the tools namespace to your manifest tag:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    package="com.yourcompany.yourapp">
```

#### 2.2 Update Main Activity TaskAffinity
Find your main activity (usually `MainActivity`) and add/update the `android:taskAffinity` attribute:

```xml
<activity
    android:name=".MainActivity"
    android:exported="true"
    android:launchMode="singleTop"
    android:theme="@style/LaunchTheme"
    android:taskAffinity="${applicationId}"
    android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
    android:hardwareAccelerated="true"
    android:windowSoftInputMode="adjustResize">

    <!-- Your existing meta-data and intent-filter -->
    <meta-data
        android:name="io.flutter.embedding.android.NormalTheme"
        android:resource="@style/NormalTheme" />
    <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="android.intent.category.LAUNCHER"/>
    </intent-filter>
</activity>
```

#### 2.3 Add RedirectUriReceiverActivity
Add this activity configuration inside the `<application>` tag (after your MainActivity):

```xml
<activity
    android:name="net.openid.appauth.RedirectUriReceiverActivity"
    android:theme="@style/Theme.AppCompat.Translucent.NoTitleBar"
    android:exported="true"
    tools:node="replace">

    <!-- Login callback intent filter -->
    <intent-filter android:autoVerify="true">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="your_custom_scheme" android:host="kinde_callback"/>
    </intent-filter>

    <!-- Logout callback intent filter -->
    <intent-filter android:autoVerify="true">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="your_custom_scheme" android:host="kinde_logoutcallback"/>
    </intent-filter>
</activity>
```

**Important:** Replace `your_custom_scheme` with the same scheme you used in your `build.gradle` file.

### Step 3: Configure Kinde Dashboard

In your Kinde dashboard, configure the following redirect URLs:

1. Go to **Settings > Applications**
2. Select your application
3. In the **Callback URLs** section, add:
   - **Allowed callback URLs**: `your_custom_scheme://kinde_callback`
   - **Allowed logout redirect URLs**: `your_custom_scheme://kinde_logoutcallback`

### Step 4: Choose Your Custom Scheme

Your custom scheme should be:
- **Unique**: Don't use common schemes like `http`, `https`, `mailto`, etc.
- **URL-safe**: Only use lowercase letters, numbers, and hyphens
- **Consistent**: Use the same scheme in build.gradle, AndroidManifest.xml, and Kinde dashboard

**Avoid:**
- Schemes with underscores (`my_app`)
- Generic schemes (`app`, `auth`)
- Schemes that might conflict with other apps

## Complete AndroidManifest.xml Example

Here's a complete example of what your AndroidManifest.xml should look like:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    package="com.yourcompany.yourapp">

    <application
        android:label="Your App Name"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">

        <!-- Main Activity -->
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:taskAffinity="${applicationId}"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">

            <meta-data
                android:name="io.flutter.embedding.android.NormalTheme"
                android:resource="@style/NormalTheme" />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>

        <!-- Kinde OAuth Redirect Activity -->
        <activity
            android:name="net.openid.appauth.RedirectUriReceiverActivity"
            android:theme="@style/Theme.AppCompat.Translucent.NoTitleBar"
            android:exported="true"
            tools:node="replace">

            <intent-filter android:autoVerify="true">
                <action android:name="android.intent.action.VIEW" />
                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.BROWSABLE" />
                <data android:scheme="your_custom_scheme" android:host="kinde_callback"/>
            </intent-filter>

            <intent-filter android:autoVerify="true">
                <action android:name="android.intent.action.VIEW" />
                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.BROWSABLE" />
                <data android:scheme="your_custom_scheme" android:host="kinde_logoutcallback"/>
            </intent-filter>
        </activity>

        <!-- Flutter meta-data -->
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
</manifest>
```

## Troubleshooting

### "Failed to authorize: Null intent received"

This error occurs when the OAuth redirect configuration is incomplete. Ensure you have:

1. ✅ Added `xmlns:tools` namespace to the manifest tag
2. ✅ Set `android:taskAffinity="${applicationId}"` on your main activity
3. ✅ Added the `RedirectUriReceiverActivity` with correct intent filters
4. ✅ Configured `manifestPlaceholders` in build.gradle
5. ✅ Matching redirect URLs in Kinde dashboard

### Build Errors

If you encounter build errors after configuration:

1. Run `flutter clean`
2. Delete the `android/app/build` directory
3. Run `flutter pub get`
4. Try building again with `flutter run`

### App Not Responding After Login

1. Verify redirect URLs in Kinde dashboard match your configuration exactly
2. Check that your custom scheme doesn't conflict with other installed apps
3. Ensure you're properly handling the authentication response in your Flutter code

### Testing Your Configuration

To test if your configuration is working:

1. Build and run your app on an Android device/emulator
2. Trigger the Kinde login flow
3. Complete authentication in the browser/WebView
4. The app should automatically return and complete the login process

## Additional Notes

- The `${applicationId}` and `${appAuthRedirectScheme}` placeholders will be automatically replaced during build time
- The `tools:node="replace"` attribute ensures that the activity configuration replaces any existing ones
- The `android:autoVerify="true"` attribute helps with App Link verification (optional but recommended)
- Make sure your `minSdkVersion` supports the features used (typically 21 or higher)

## Flutter Code Integration

Once your Android configuration is complete, you can initialize the Kinde SDK in your Flutter code:

```dart
await KindeFlutterSDK.initializeSDK(
  authDomain: 'your-domain.kinde.com',
  authClientId: 'your_client_id',
  loginRedirectUri: 'your_custom_scheme://kinde_callback',
  logoutRedirectUri: 'your_custom_scheme://kinde_logoutcallback',
  scopes: ['openid', 'profile', 'email'],
);
```

Remember to replace `your_custom_scheme` with the same scheme you configured in your Android files.
