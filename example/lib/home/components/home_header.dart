import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/constants.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader(
      {super.key,
      this.profile,
      this.onLogin,
      this.onLogout,
      this.onRegister,
      this.loading = false});

  final VoidCallback? onLogin;
  final VoidCallback? onLogout;
  final VoidCallback? onRegister;
  final UserProfileV2? profile;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            appTitle,
            style: kTitleText,
          ),
          Expanded(
            child: loading
                ? const CircularProgressIndicator.adaptive()
                : profile == null
                    ? UnloggedHeader(
                        onLogin: onLogin,
                        onRegister: onRegister,
                      )
                    : LoggedHeader(
                        onLogout: onLogout,
                        profile: profile,
                      ),
          ),
        ],
      ),
    );
  }
}

class UnloggedHeader extends StatelessWidget {
  final VoidCallback? onLogin;
  final VoidCallback? onRegister;

  const UnloggedHeader(
      {required this.onLogin, required this.onRegister, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          padding: EdgeInsets.zero,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightElevation: 0,
          elevation: 0,
          onPressed: onLogin,
          child: Text(
            'Sign in',
            style: kRobotoText.copyWith(fontWeight: kFwBold, color: kColorGrey),
          ),
        ),
        MaterialButton(
          elevation: 0,
          padding: EdgeInsets.zero,
          color: Colors.black,
          onPressed: onRegister,
          child: Text(
            'Sign up',
            style:
                kRobotoText.copyWith(fontWeight: kFwBold, color: Colors.white),
          ),
        )
      ],
    );
  }
}

class LoggedHeader extends StatelessWidget {
  final UserProfileV2? profile;
  final VoidCallback? onLogout;

  const LoggedHeader(
      {required this.onLogout, required this.profile, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${profile?.givenName} ${profile?.familyName}',
            overflow: TextOverflow.clip,
            style: kRobotoText.copyWith(fontSize: kHeadingTwo),
          ),
          const SizedBox(height: 10),
          InkWell(
              onTap: onLogout,
              child: const Text('Sign out')),
        ],
      ),
    );
  }
}
