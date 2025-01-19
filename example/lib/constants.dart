import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const helpUrl = "https://kinde.com/docs";
const docsUrl = "https://kinde.com/docs/developer-tools/flutter-sdk/";
const appTitle = "KindeAuth";

/// Text Styles
const TextStyle kRobotoText = TextStyle(fontFamily: 'Roboto');
TextStyle kTitleText = kRobotoText.copyWith(
    fontWeight: kFwMedium, color: Colors.black, fontSize: kTitle);

/// Font Sizes
double kTitle = 24.sp;
double kTitleLarge = 32.sp;
double kHeadingOne = 22.sp;
double kHeadingTwo = 20.sp;
double kHeadingThree = 18.sp;
double kBodyLarge = 16.sp;
double kBodyMedium = 15.sp;
double kBodyRegular = 14.sp;
double kBodySmall = 12.sp;
double kCaption = 10.sp;

/// Font Weights
FontWeight kFwBold = FontWeight.w700;

FontWeight kFwMedium = FontWeight.w500;

FontWeight kFwBlack = FontWeight.w900;

// Horizontal Spacing
Widget horizontalSpaceTiny = SizedBox(width: 4.0.w);
Widget horizontalSpaceSmall = SizedBox(width: 8.0.w);
Widget horizontalSpaceRegular = SizedBox(width: 16.0.w);
Widget horizontalSpaceMedium = SizedBox(width: 24.0.w);
Widget horizontalSpaceLarge = SizedBox(width: 48.0.w);
// Vertical Spacing
Widget verticalSpaceTiny = SizedBox(height: 4.0.h);
Widget verticalSpaceSmall = SizedBox(height: 8.0.h);
Widget verticalSpaceRegular = SizedBox(height: 16.0.h);
Widget verticalSpaceMedium = SizedBox(height: 24.0.h);
Widget verticalSpaceLarge = SizedBox(height: 48.0.h);

//Box Decoration
BoxDecoration roundedBoxRegular = BoxDecoration(
    color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(16.r)));

//color
const kColorGrey = Color(0xFF676767);
const kColorLightGrey = Color(0xFFF7F6F6);
