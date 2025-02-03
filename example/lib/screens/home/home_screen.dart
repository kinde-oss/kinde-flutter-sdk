import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_kit/constants.dart';
import 'package:flutter_starter_kit/screens/routes.dart';
import 'package:flutter_starter_kit/screens/widgets/page_footer.dart';
import 'package:flutter_starter_kit/state/app_state_manager.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static MaterialPageRoute get pageRoute =>
      MaterialPageRoute(builder: (context) => const HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Future<UserProfileV2?> future;

  @override
  void initState() {
    super.initState();
    future = AppStateManager.instance.checkIsUserLogged();
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
            InkWell(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FutureBuilder<UserProfileV2?>(
                    future: future,
                    builder: (context, asyncSnapshot) {
                      if (asyncSnapshot.connectionState ==
                          ConnectionState.done) {
                        final user = asyncSnapshot.data;
                        if (user == null) {
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.WELCOME);
                          });
                        } else {
                          return Text(
                            '${user.givenName} ${user.familyName}',
                            overflow: TextOverflow.clip,
                            style: kRobotoText.copyWith(fontSize: kHeadingTwo),
                          );
                        }
                      }
                      return CircularProgressIndicator.adaptive();
                    },
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                      onTap: AppStateManager.instance.signOut,
                      child: const Text('Sign out')),
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      verticalSpaceMedium,
                      Column(
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
                      ),
                      const PageFooter(),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
