import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const helpUrl = "https://kinde.com/docs";
const docsUrl = "https://kinde.com/docs/developer-tools/flutter-sdk/";
const appTitle = "KindeAuth";

/// Text Styles
const TextStyle kRobotoText = TextStyle(fontFamily: 'Roboto');

/// Font Sizes
double kTitle = 24.sp;
double kTitleLarge = 32.sp;
double kHeadingTwo = 20.sp;
double kBodySmall = 12.sp;

/// Font Weights
FontWeight kFwBold = FontWeight.w700;

FontWeight kFwMedium = FontWeight.w500;

FontWeight kFwBlack = FontWeight.w900;

TextStyle kTitleText = kRobotoText.copyWith(
    fontWeight: kFwMedium, color: Colors.black, fontSize: kTitle);

// Vertical Spacing
Widget get verticalSpaceSmall => SizedBox(height: 8.0.h);
Widget get verticalSpaceRegular => SizedBox(height: 16.0.h);
Widget get verticalSpaceMedium => SizedBox(height: 24.0.h);

//Box Decoration
BoxDecoration roundedBoxRegular = BoxDecoration(
    color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(16.r)));

//color
const kColorGrey = Color(0xFF676767);
