import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_kit/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.loggedIn});

  final bool loggedIn;

  @override
  Widget build(BuildContext context) {
    return loggedIn ? _loggedInContent() : _initialContent();
  }

  Widget _initialContent() {
    return Container(
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
            style:
                kTitleText.copyWith(fontWeight: kFwBlack, color: Colors.white),
          ),
          verticalSpaceMedium,
          MaterialButton(
            elevation: 0,
            color: Colors.white,
            onPressed: () {
              launchUrl(Uri.parse(docsUrl));
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
    );
  }

  Widget _loggedInContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(32.w),
          decoration: roundedBoxRegular,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpaceMedium,
              Text(
                "Woohoo!",
                textAlign: TextAlign.center,
                style: kTitleText.copyWith(color: Colors.white),
              ),
              verticalSpaceMedium,
              Text(
                "Your\nauthentication is\nall sorted.\nBuild the\nimportant stuff.",
                textAlign: TextAlign.center,
                style: kRobotoText.copyWith(
                    fontWeight: kFwBlack,
                    color: Colors.white,
                    fontSize: kTitleLarge),
              ),
            ],
          ),
        ),
        verticalSpaceRegular,
        Text(
          "Next steps for you",
          style: kTitleText,
        ),
      ],
    );
  }
}
