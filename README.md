# Kinde Flutter SDK

## Overview
Integrate [Kinde](https://kinde.com) authentication with your Flutter app. Simply configure, register, log in, and log out, and the authentication state is securely stored across app restarts.

These instructions assume you already have a Kinde account. You can register for free [here](https://app.kinde.com/register) (no credit card required).

## Install
KindeSDK is available through [pub.dev](https://pub.dev). To install it, simply add the following line to your pubspec.yaml:

    kinde_flutter_sdk: <last-version>

## Configure Kinde
### Set callback URLs
In Kinde, go to <b>Settings</b> > <b>Applications</b>.

View the application details. This is where you get app keys and set the callback URLs.
Add your callback URLs in the relevant fields. For example:
- Allowed callback URLs:
  <your_custom_scheme>://kinde_callback - for example com.kinde.myapp://kinde_callback
- Allowed logout redirect URLs:
  <your_custom_scheme>://kinde_logoutcallback - for example com.kinde.myapp://kinde_logoutcallback

Select `Save`.

### Add environments
If you would like to use our Environments feature as part of your development process. You will need to create them within your Kinde account. In this case you would use the Environment subdomain in the code block above.

## Configure your app
### Android Setup
Go to the `build.gradle` file for your Android app to specify the custom scheme so that there should be a section in it that look similar to the following but replace `<your_custom_scheme>` with the desired value

```
android {
    ...
    defaultConfig {
        ...
        manifestPlaceholders += [
                'appAuthRedirectScheme': '<your_custom_scheme>'
        ]
    }
}
```
### IOS Setup

Go to the `Info.plist` for your iOS/macOS app to specify the custom scheme so that there should be a section in it that look similar to the following but replace `<your_custom_scheme>` with the desired value


```
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string><your_custom_scheme></string>
        </array>
    </dict>
</array>
```

## Integrate with your app
Within the main function, ensure WidgetsFlutterBinding is initialized and then call `initializeSDK` function of KindeFlutterSDK
KindeFlutterSDK.initializeSDK() must be called before using the SDK

- `authDomain`: your Kinde domain
- `authClientId`: you can find this on the App Keys page
- `loginRedirectUri`: callback URL
- `logoutRedirectUri`: logout callback URL
- `audience`: (Optional) An audience is the intended recipient of an access token - for example the API for your application
- `scopes`: (Optional) Scope List

````
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await KindeFlutterSDK.initializeSDK(
    authDomain: <your_kinde_domain>,
    authClientId: <client_id>,
    loginRedirectUri: <login_callback>,
    logoutRedirectUri: <logout_callback>,
    audience: '<audience>',
    scopes = <scope_list>,
  );

  runApp(const MyApp());
}
````

Configuration example:

````
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await KindeFlutterSDK.initializeSDK(
    authDomain: 'myapp.kinde.com',
    authClientId: 'testabc',
    loginRedirectUri: 'com.kinde.myapp://kinde_callback',
    logoutRedirectUri: 'com.kinde.myapp://kinde_logoutcallback',
    audience: 'myapp.kinde.com/api',
    scopes: ["openid", "offline", "email", "profile"],
  );

  runApp(const MyApp());
}
````

## Overriding scope
By default the KindeSDK requests the following scopes:

- profile: Perform an OpenID connect sign-in.
- email: Retrieve the user’s profile.
- offline: Retrieve a Refresh Token for offline access from the application.
- openid: Retrieve the user’s email.

You can override this by passing scope into the initializeSDK() function
````
    await KindeFlutterSDK.initializeSDK(
        ...
        scopes = ["email", "profile"], 
        ...
    )

````

## Audience

An `audience` is the intended recipient of an access token - for example the API for your application. The audience
argument can be passed to the Kinde client to request an audience be added to the provided token.

The audience of a token is the intended recipient of the token.

```
    await KindeFlutterSDK.initializeSDK(
        ...
        audience: 'myapp.kinde.com/api',
        ...
    )
```

For details on how to connect, see [Register an API](https://kinde.com/docs/developer-tools/register-an-api/)

## Kinde Client

````
    final sdk = KindeFlutterSDK.instance;
````

## Login / Register
The Kinde client provides methods for a simple login / register flow.

````
    ...
    final token = await sdk.login();
    // or sdk.login(type: AuthFlowType.pkce) for apply pkce flow
    
    ...
    await sdk.register()
    // or sdk.register(type: AuthFlowType.pkce) for apply pkce flow
    
    ...
````

## Logout
This is implemented in much the same way as logging in or registering. The Kinde SDK client comes with a logout method.
````
    ....
    await sdk.logout()
    ....
````
## Get user information
To access the user information, call one of the `getUser` or `getUserProfileV2` methods.

````
    ...
    kindeSdk.getUser().then((value) {
      print('User: ${value?.firstName ?? ''} ${value?.lastName ?? ''}');
    });
    ...
````

## View users in Kinde
Navigate to the <b>Users</b> page within Kinde to see your newly registered user.

## User Permissions
Once a user has been verified, your application will be returned the JWT token with an array of permissions for that user. You will need to configure your application to read permissions and unlock the respective functions.

[Set roles and permissions](https://kinde.com/docs/user-management/apply-roles-and-permissions-to-users/) at the Business level in Kinde. Here’s an example of permissions.
````
    var permissions = [
        “create:todos”,
        “update:todos”,
        “read:todos”,
        “delete:todos”,
        “create:tasks”,
        “update:tasks”,
        “read:tasks”,
        “delete:tasks”,
    ]
````

## Feature flags
When a user signs in the Access token your product/application receives contains a custom claim called `feature_flags` which is an object detailing the feature flags for that user.
You can set feature flags in your Kinde account. Here’s an example.
````
    feature_flags: {
        theme: {
              "t": "s",
              "v": "pink"
        },
        is_dark_mode: {
              "t": "b",
              "v": true
        },
        competitions_limit: {
              "t": "i",
              "v": 5
        }
    }
````
In order to minimize the payload in the token we have used single letter keys / values where possible. The single letters represent the following:
`t` = type,
`v` = value,
`s` = String,
`b` = Boolean,
`i` = Integer,

````
/**
  * Get a flag from the feature_flags claim of the access_token.
  * @param {String} [code] - The name of the flag.
  * @param {dynamic} [defaultValue] - A fallback value if the flag isn't found.
  * @param {[FlagType?](/src/model/claim/flag.dartt} [type] - The data type of the flag (integer / boolean / string).
  * @return {[Flag?](/src/model/claim/flag.dart} Flag details.
*/
sdk.getFlag(code, defaultValue, flagType);

/* Example usage */

sdk.getFlag("theme");
/*{
//   "code": "theme",
//   "type": "String",
//   "value": "pink",
//   "isDefault": false // whether the fallback value had to be used
*/}

sdk.getFlag("create_competition", false);
/*{
     "code": "create_competition",
     "value": false,
     "isDefault": true // because fallback value had to be used
}*/
````
We also require wrapper functions by type which should leverage `getFlag` above.

We provide helper functions to more easily access feature flags:
- Booleans:
    ````
  /**
  * Get a boolean flag from the feature_flags claim of the access_token.
  * @param {String} code - The name of the flag.
  * @param {bool} [defaultValue] - A fallback value if the flag isn't found.
  * @return {bool}
    **/
    sdk.getBooleanFlag(code, defaultValue);

    /* Example usage */
    sdk.getBooleanFlag("is_dark_mode");
    // true

    sdk.getBooleanFlag("is_dark_mode", false);
    // true

    sdk.getBooleanFlag("new_feature", false);
    // false (flag does not exist so falls back to default)
  ````
- Strings and integers work in the same way as booleans above:
    ````
  /**
  * Get a string flag from the feature_flags claim of the access_token.
  * @param {String} code - The name of the flag.
  * @param {String} [defaultValue] - A fallback value if the flag isn't found.
  * @return {String}
  */
  getStringFlag(code, defaultValue);

  /**
  * Get an integer flag from the feature_flags claim of the access_token.
  * @param {String} code - The name of the flag.
  * @param {int} [defaultValue] - A fallback value if the flag isn't found.
  * @return {int}
  */
  getIntegerFlag(code, defaultValue);
  ````
## Getting claims
We have provided a helper to grab any claim from your id or access tokens. The helper defaults to access tokens:
````
    ...
    sdk.getClaim("aud")
    // {name: "aud", "value": ["api.yourapp.com"]}
    sdk.getClaim("given_name", TokenType.idToken)
    // {name: "given_name", "value": "David"}
    ...
````

## Organizations Control
### Create an organization
To have a new organization created within your application, you will need to add button to your `layout` xml file and handle clicks as follows:

````
    ...
    sdk.createOrg(orgName: "Your Organization")
    ...
````
### Sign up and sign in to organizations
Kinde has a unique code for every organization. You’ll have to pass this code through when you register a new user. Example function below:

````
    ...
   
    sdk.register(GrantType.PKCE, org_code = "your_org_code")
    ...
````
If you want a user to sign into a particular organization, pass this code along with the sign in method:

````
    ...
   
    findViewById<View>(R.id.b_sign_in).setOnClickListener {
        sdk.login(type: AuthFlowType.pkce, org_code: "your_org_code")
    }
    ...
````
Following authentication, Kinde provides a json web token (jwt) to your application.
Along with the standard information we also include the `org_code` and the `permissions` for that organization (this is important as a user can belong to multiple organizations and have different permissions for each).

Example of a returned token:
````
    {
        "aud": [],
        "exp": 1658475930,
        "iat": 1658472329,
        "iss": "https://your_subdomain.kinde.com",
        "jti": "123457890",
        "org_code": "org_1234",
        "permissions": ["read:todos", "create:todos"],
        "scp": ["openid", "profile", "email", "offline"],
        "sub": "kp:123457890"
    }
````
The id_token will also contain an array of organizations that a user belongs to - this is useful if you wanted to build out an organization switcher for example.
````
    {
        ...
        "org_codes": ["org_1234", "org_4567"]
        ...
    }
````
There are two helper functions you can use to extract information:
````
    ...
    sdk.getOrganization()
    // {orgCode: "org_1234"}
    sdk.getUserOrganizations()
    // {orgCodes: ["org_1234", "org_abcd"]}
    ...
````
## Token Storage
Once the user has successfully authenticated, you’ll have a JWT and possibly a refresh token that should be stored securely. To achieve this Kinde SDK stores this data at the app's private folder.

## SDK API Reference
| Property       | Type         | Is required | Default description                                            |
|----------------|--------------|-------------|----------------------------------------------------------------|
| authDomain     | String       | Yes         | your Kinde domain                                              |
| authClientId   | String       | Yes         | you can find this on the App Keys page                         |
| loginRedirect  | String       | Yes         | The url that the user will be returned to after authentication |
| logoutRedirect | String       | Yes         | Where your user will be redirected upon logout                 |
| audience       | String       | No          | API are connected to this application                          |
| scopes         | List<String> | No          | List of scope to override the default ones                     |      

## KindeSDK methods
| Method                 | Description                                                                            | Arguments                                                                      | Usage                                                                                                                               | Sample output                                                                                                                  |
|------------------------|----------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| `login`                | Starts the authorization flow                                                          | `type`: [AuthFlowType?](lib/src/model/auth_flow_type.dart), `orgCode`: String? | `sdk.login(type: AuthFlowType.pkce, orgCode: "your_org_cde")`                                                                       |                                                                                                                                |
| `register`             | Starts the registration flow                                                           | `type`: [AuthFlowType?](lib/src/model/auth_flow_type.dart), `orgCode`: String? | `sdk.register(type: AuthFlowType.pkce, orgCode: "your_org_code")`                                                                   |                                                                                                                                |
| `createOrg`            | Starts the registration flow and creates a new organization for your business          | `type`: [AuthFlowType?](lib/src/model/auth_flow_type.dart), `orgName`: String? | `sdk.createOrg(orgName: "your_organization_name")`; or  `sdk.createOrg(type: AuthFlowType.pkce, orgCode: "your_organization_name")` |                                                                                                                                |
| `logout`               | Logs the user out of Kinde                                                             |                                                                                | `sdk.logout()`                                                                                                                      |                                                                                                                                |
| `isAuthenticated`      | Checks that access token is present                                                    |                                                                                | `sdk.isAuthenticated()`                                                                                                             | `true`                                                                                                                         |
| `getUserDetails`       | Returns the profile for the current user                                               |                                                                                | `sdk.getUserDetails()`                                                                                                              | `{givenName: "Dave", id: "abcdef", familyName: "Smith", email: "dave@smith.com", picture: "coolavatar"}`                       |
| `getClaim`             | Gets a claim from an access or id token                                                | `claim`: String, `tokenType`: [TokenType](lib/src/model/token_type.dart)       | `sdk.getClaim('given_name', tokenType: TokenType.idToken);`                                                                         | `{name: "given_name", "value": "David"}`                                                                                       |
| `getPermissions`       | Returns all permissions for the current user for the organization they are logged into |                                                                                | `sdk.getPermissions()`                                                                                                              | `{orgCode: "org_1234", permissions: ["create:todos", "update:todos", "read:todos""create:todos","update:todos","read:todos"]}` |
| `getPermission`        | Returns the state of a given permission                                                | `permission`: String                                                           | `sdk.getPermission("read:todos")`                                                                                                   | `{orgCode: "org_1234", isGranted: true}`                                                                                       |
| `getUserOrganizations` | Gets an array of all organizations the user has access to                              |                                                                                | `sdk.getUserOrganizations()`                                                                                                        | `{orgCodes: ["org_1234", "org_5678""org1_234","org_5678"]}`                                                                    |
| `getOrganization`      | Get details for the organization your user is logged into                              |                                                                                | `sdk.getOrganization()`                                                                                                             | `{orgCode: "org_1234"}`                                                                                                        |
If you need help connecting to Kinde, please contact us at [support@kinde.com](mailto:support@kinde.com).

## Autogenerated API reference
See autogenerated API reference in [kinde_api](kinde-api/README.md).
