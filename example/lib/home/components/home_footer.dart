import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appTitle,
            style: kTitleText,
          ),
          verticalSpaceSmall,
          RichText(
            text: TextSpan(
                text: 'Visit our ',
                style: kTitleText.copyWith(fontSize: kHeadingTwo),
                children: [
                  TextSpan(
                      text: 'help center',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse(helpUrl));
                        })
                ]),
          ),
          verticalSpaceSmall,
          Text(
            '© 2022 KindeAuth, Inc. All rights reserved',
            style: kRobotoText.copyWith(
                fontWeight: kFwMedium, color: kColorGrey, fontSize: kBodySmall),
          ),
        ],
      ),
    );
  }
}
