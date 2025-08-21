# Android OAuth Callback Setup Guide

## 🚨 Issue: "Failed to authorize: Null intent received"

If you're experiencing this error after login on Android, it means your app is missing the proper OAuth callback intent filters in the Android manifest.

## 🔍 Root Cause

The `flutter_appauth` package requires specific intent filters in your `AndroidManifest.xml` to handle OAuth callbacks properly. Without these, Android cannot route the OAuth response back to your app.

## 🛠️ Solution

### Step 1: Update AndroidManifest.xml

Add the following intent filters to your main activity in `android/app/src/main/AndroidManifest.xml`:

```xml
<activity
    android:name=".MainActivity"
    android:exported="true"
    android:launchMode="singleTop"
    android:theme="@style/LaunchTheme"
    android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
    android:hardwareAccelerated="true"
    android:windowSoftInputMode="adjustResize">

    <!-- Main launcher intent filter -->
    <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="android.intent.category.LAUNCHER"/>
    </intent-filter>

    <!-- OAuth Login Callback Intent Filter -->
    <intent-filter>
        <action android:name="android.intent.action.VIEW"/>
        <category android:name="android.intent.category.DEFAULT"/>
        <category android:name="android.intent.category.BROWSABLE"/>
        <data android:scheme="YOUR_APP_SCHEME" android:host="YOUR_CALLBACK_HOST"/>
    </intent-filter>

    <!-- OAuth Logout Callback Intent Filter -->
    <intent-filter>
        <action android:name="android.intent.action.VIEW"/>
        <category android:name="android.intent.category.DEFAULT"/>
        <category android:name="android.intent.category.BROWSABLE"/>
        <data android:scheme="YOUR_APP_SCHEME" android:host="YOUR_LOGOUT_CALLBACK_HOST"/>
    </intent-filter>
</activity>
```

### Step 2: Replace Placeholders

Replace the placeholders with your actual values:

- `YOUR_APP_SCHEME`: Your app's custom scheme (e.g., `com.app.lumen`)
- `YOUR_CALLBACK_HOST`: Your callback host (e.g., `kindecallback`)
- `YOUR_LOGOUT_CALLBACK_HOST`: Your logout callback host (e.g., `kindelogoutcallback`)

### Example Configuration

For an app with scheme `com.app.lumen`:

```xml
<!-- OAuth Login Callback -->
<data android:scheme="com.app.lumen" android:host="kindecallback"/>

<!-- OAuth Logout Callback -->
<data android:scheme="com.app.lumen" android:host="kindelogoutcallback"/>
```

## 🔧 Environment Configuration

Ensure your `.env` file matches your intent filter configuration:

```bash
KINDE_AUTH_DOMAIN=https://your-domain.kinde.com
KINDE_AUTH_CLIENT_ID=your_client_id
KINDE_LOGIN_REDIRECT_URI=YOUR_APP_SCHEME://YOUR_CALLBACK_HOST
KINDE_LOGOUT_REDIRECT_URI=YOUR_APP_SCHEME://YOUR_LOGOUT_CALLBACK_HOST
```

### Example .env

```bash
KINDE_AUTH_DOMAIN=https://lumenmind.kinde.com
KINDE_AUTH_CLIENT_ID=your_actual_client_id
KINDE_LOGIN_REDIRECT_URI=com.app.lumen://kindecallback
KINDE_LOGOUT_REDIRECT_URI=com.app.lumen://kindelogoutcallback
```

## 🎯 Kinde Dashboard Configuration

Make sure your Kinde dashboard has the same callback URLs:

- **Allowed callback URLs**: `com.app.lumen://kindecallback`
- **Allowed logout redirect URLs**: `com.app.lumen://kindelogoutcallback`

## 🧪 Testing

### Step 1: Clean Build

```bash
flutter clean
flutter pub get
```

### Step 2: Build and Install

```bash
flutter build apk --debug
flutter install
```

### Step 3: Test OAuth Flow

1. Launch your app
2. Attempt to login
3. Complete OAuth flow
4. Verify successful redirect back to app
5. Check logs for any errors

## ❌ Common Mistakes

1. **Mismatched Schemes**: Ensure scheme in manifest matches .env file
2. **Missing Intent Filters**: Both login and logout callbacks need intent filters
3. **Wrong Host Values**: Host must match your callback configuration
4. **Case Sensitivity**: Android is case-sensitive, ensure exact matches

## 🔍 Troubleshooting

### Error: "Failed to authorize: Null intent received"

- Verify intent filters are properly configured
- Check scheme and host values match exactly
- Ensure .env file is loaded correctly

### Error: "App not found" during OAuth

- Verify intent filters are in the correct activity
- Check that `android:exported="true"` is set
- Ensure scheme is unique and not conflicting

### Error: "Invalid redirect URI"

- Verify Kinde dashboard configuration matches your .env
- Check for typos in scheme or host values
- Ensure no extra spaces or characters

## 📱 Platform-Specific Notes

### Android

- Intent filters are required for OAuth callbacks
- Scheme must be unique across all installed apps
- Host can be any string that makes sense for your app

### iOS

- iOS uses URL schemes differently
- No additional manifest configuration needed
- Ensure Info.plist has proper URL scheme configuration

## 🚀 Best Practices

1. **Unique Schemes**: Use reverse domain notation (e.g., `com.company.app`)
2. **Descriptive Hosts**: Use meaningful host names (e.g., `oauth_callback`)
3. **Consistent Naming**: Keep scheme and host naming consistent across your app
4. **Testing**: Always test on physical devices, not just emulators

## 📞 Support

If you continue to experience issues:

1. Check the [Kinde Flutter SDK documentation](https://github.com/kinde-oss/kinde-flutter-sdk)
2. Review your intent filter configuration
3. Verify environment variables are loaded correctly
4. Test with a minimal example to isolate the issue

## ✅ Checklist

- [ ] Intent filters added to AndroidManifest.xml
- [ ] Scheme and host values configured correctly
- [ ] .env file matches manifest configuration
- [ ] Kinde dashboard updated with callback URLs
- [ ] App rebuilt and reinstalled
- [ ] OAuth flow tested successfully
- [ ] No "Null intent received" errors

---

**Note**: This guide is for implementing OAuth callbacks in your own app. The example app in this repository is for demonstration purposes only.
