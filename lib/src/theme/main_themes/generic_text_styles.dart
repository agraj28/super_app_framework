import 'package:flutter/material.dart';
import 'package:super_app_framework/super_app_framework.dart';

extension CustomTextStyles on TextTheme {
  // generic text styles

  TextStyle textStyleButtonSmaller() {
    return TextStyle(
      fontFamily: 'Whitney Book',
      fontSize: 15.0,
    );
  }

  TextStyle genericTextStyle(
          {double? fontSize,
          Color? color,
          FontWeight? weight,
          String? family}) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: weight ?? null,
        fontFamily: family ?? null,
      );

  // Module name styles
  TextStyle moduleNameTextStyle({double? fontSize, Color? color}) => TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
      );

  TextStyle get progressStyle => TextStyle(
        fontSize: 16,
      );

  TextStyle dayNameStyle({double? fontSize, Color? color}) => TextStyle(
        color: color,
        fontFamily: FontFamily.MierB,
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
      );

  TextStyle dayNumberStyle({double? fontSize, Color? color}) => TextStyle(
        color: color,
        fontFamily: FontFamily.MierB,
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
      );

  TextStyle monthTitleStyle({double? fontSize, Color? color}) => TextStyle(
        color: color,
        fontFamily: FontFamily.MierB,
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
        letterSpacing: 0.156,
      );
  TextStyle yearTitleStyle({double? fontSize, Color? color}) => TextStyle(
        color: color,
        fontFamily: FontFamily.MierB,
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
        letterSpacing: 0.156,
      );

  TextStyle cancelButtonStyle({double? fontSize, required Color color}) =>
      TextStyle(
        fontFamily: FontFamily.MierA,
        fontWeight: FontWeight.w400,
        color: color.withOpacity(0.6),
        fontSize: fontSize,
      );

  // HomePage styles
  TextStyle genericHomePageStyle(
          {double? fontSize, Color? color, FontWeight? fontWeight}) =>
      TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight ?? null,
      );

  // Onboarding Pages Styles
  TextStyle onboardingW600Style({double? fontSize, Color? color}) =>
      TextStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.w600);

  TextStyle onboardingW400Style({double? fontSize, Color? color}) =>
      TextStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.w400);

  TextStyle onboardingW400HintStyle({double? fontSize, Color? color}) =>
      TextStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.w400);
  TextStyle onboardingW200Style({double? fontSize, Color? color}) =>
      TextStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.w200);
}
