import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_kit/constants.dart';
import 'package:flutter_starter_kit/encrypted_box.dart';
import 'package:flutter_starter_kit/home/components/home_body.dart';
import 'package:flutter_starter_kit/home/components/home_footer.dart';
import 'package:flutter_starter_kit/home/components/home_header.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var kindeClient = KindeFlutterSDK.instance;

  final ValueNotifier<bool> _loading = ValueNotifier(false);
  final ValueNotifier<UserProfileV2?> _profile = ValueNotifier(null);
  final ValueNotifier<bool> _loggedIn = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    ///if user not logged, refresh access and refresh token
    kindeClient.isAuthenticate().then((isAuthenticated) async {
      if (!isAuthenticated) {
        final accessToken = await EncryptedBox.instance.returnAccessToken();
        _loggedIn.value = accessToken != null;
      } else {
        _loggedIn.value = true;
      }

      if (_loggedIn.value) {
        await _getProfile();
      }
    }, onError: (e) {
      debugPrint('Authentication error: $e');
      _loggedIn.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.viewPaddingOf(context).top,
            left: 16.w,
            right: 16.w,
            bottom: MediaQuery.viewPaddingOf(context).bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListenableBuilder(
                listenable: Listenable.merge([_loading, _profile]),
                builder: (context, _) {
                  return HomeHeader(
                      profile: _profile.value,
                      loading: _loading.value,
                      onLogin: _signIn,
                      onLogout: _signOut,
                      onRegister: _signUp);
                }),
            Expanded(
              child: SizedBox(
                child: ValueListenableBuilder(
                    valueListenable: _loggedIn,
                  builder: (context, isLoggedIn, __) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          verticalSpaceMedium,
                          HomeBody(loggedIn: isLoggedIn),
                          const HomeFooter(),
                        ],
                      ),
                    );
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _signIn() {
    kindeClient.login(type: AuthFlowType.pkce).then((token) async {
      if (token != null) {
        await EncryptedBox.instance.saveToken(token);
        _loggedIn.value = true;
        _getProfile();
      }
    });
  }

  _signOut() {
    kindeClient.logout().then((value) {
      _loggedIn.value = false;
      _profile.value = null;
      EncryptedBox.instance.clear();
    });
  }

  _signUp() {
    kindeClient.register().then((_) async {
      try {
        await kindeClient.register();
        final accessToken = await EncryptedBox.instance.returnAccessToken();
        if (accessToken != null) {
          _loggedIn.value = true;
          await _getProfile();
        }
      } catch (e) {
        debugPrint('Registration error: $e');
        // Consider showing an error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: ${e.toString()}')),
        );
      }
    });
  }

  _getProfile() {
    _loading.value = true;
    kindeClient.getUserProfileV2().then((profile) async {
      _profile.value = profile;
    }).whenComplete(() => _loading.value = false);
  }
}
