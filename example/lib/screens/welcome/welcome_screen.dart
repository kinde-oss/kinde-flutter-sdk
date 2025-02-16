import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_kit/constants.dart';
import 'package:flutter_starter_kit/screens/widgets/page_footer.dart';
import 'package:flutter_starter_kit/state/app_state_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  padding: EdgeInsets.zero,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightElevation: 0,
                  elevation: 0,
                  onPressed: AppStateManager.instance.signIn,
                  child: Text(
                    'Sign in',
                    style: kRobotoText.copyWith(
                        fontWeight: kFwBold, color: kColorGrey),
                  ),
                ),
                MaterialButton(
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  color: Colors.black,
                  onPressed: AppStateManager.instance.signUp,
                  child: Text(
                    'Sign up',
                    style: kRobotoText.copyWith(
                        fontWeight: kFwBold, color: Colors.white),
                  ),
                )
              ],
            ),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      verticalSpaceMedium,
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(32.w),
                        decoration: roundedBoxRegular,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            verticalSpaceMedium,
                            Text(
                              "Let's Start\nauthenticating\nwith KindeAuth",
                              textAlign: TextAlign.center,
                              style: kRobotoText.copyWith(
                                  fontWeight: kFwBlack,
                                  color: Colors.white,
                                  fontSize: kTitleLarge),
                            ),
                            verticalSpaceMedium,
                            Text(
                              "Configure your app",
                              textAlign: TextAlign.center,
                              style: kTitleText.copyWith(
                                  fontWeight: kFwBlack, color: Colors.white),
                            ),
                            verticalSpaceMedium,
                            MaterialButton(
                              elevation: 0,
                              color: Colors.white,
                              onPressed: () {
                                final url = Uri.parse(docsUrl);
                                canLaunchUrl(url).then((isCan) {
                                  if (isCan) {
                                    launchUrl(url);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Could not open documentation')),
                                    );
                                  }
                                });
                              },
                              child: Text(
                                'Go to docs',
                                textAlign: TextAlign.center,
                                style: kRobotoText.copyWith(
                                    fontWeight: kFwBlack,
                                    color: Colors.black,
                                    fontSize: kHeadingTwo),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const PageFooter(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
