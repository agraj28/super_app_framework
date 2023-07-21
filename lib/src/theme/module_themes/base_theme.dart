import 'package:flutter/material.dart';
import '../../../super_app_framework.dart';
import '../../theme/main_themes/dark_theme.dart';
import '../../theme/main_themes/light_theme.dart';
import 'super_app_light_theme.dart';
import 'super_app_dark_theme.dart';

abstract class BaseTheme {
  Brightness? brightness;

  Color get primaryColor;

  Color? get darkPrimaryColor;

  Color? get accentColor;

  Color? get darkAccentColor;

  ThemeData? get lightTheme;

  ThemeData? get darkTheme;

  Color? get colorBackgroundButtonDeactivated => null;
  Color? get colorBackgroundButtonPrimary => null;
  Color? get colorBackgroundButtonSecondary => null;
  Color? get colorBackgroundContent => null;
  Color? get colorBackgroundErrorStrong => null;
  Color? get colorBackgroundErrorWeak => null;
  Color? get colorBackgroundImg1 => null;
  Color? get colorBackgroundImg10 => null;
  Color? get colorBackgroundImg11 => null;
  Color? get colorBackgroundImg12 => null;
  Color? get colorBackgroundImg14 => null;
  Color? get colorBackgroundImg13 => null;
  Color? get colorBackgroundImg15 => null;
  Color? get colorBackgroundImg16 => null;
  Color? get colorBackgroundImg17 => null;
  Color? get colorBackgroundImg18 => null;
  Color? get colorBackgroundImg19 => null;
  Color? get colorBackgroundImg2 => null;
  Color? get colorBackgroundImg20 => null;
  Color? get colorBackgroundImg3 => null;
  Color? get colorBackgroundImg4 => null;
  Color? get colorBackgroundImg5 => null;
  Color? get colorBackgroundImg6 => null;
  Color? get colorBackgroundImg7 => null;
  Color? get colorBackgroundImg8 => null;
  Color? get colorBackgroundImg9 => null;
  Color? get colorBackgroundLoaderStrong => null;
  Color? get colorBackgroundLoaderWeak => null;
  Color? get colorBackgroundNavDefault => null;
  Color? get colorBackgroundNavIcon => null;
  Color? get colorBackgroundNavOnImg => null;
  Color? get colorBackgroundNavTabbar => null;
  Color? get colorBackgroundPage => null;
  Color? get colorBackgroundSuccessStrong => null;
  Color? get colorBackgroundSuccessWeak => null;
  Color? get colorBackgroundWarningStrong => null;
  Color? get colorBackgroundWarningWeak => null;
  Color? get colorBackgroundWidgetBackground => null;
  Color? get colorBackgroundWidgetForeground => null;
  Color? get colorBrandSharePrimary => null;
  Color? get colorContentDeactivated => null;
  Color? get colorContentError => null;
  Color? get colorContentLink => null;
  Color? get colorContentMuted => null;
  Color? get colorContentOnImgDeactivated => null;
  Color? get colorContentOnImgPrimary => null;
  Color? get colorContentOnImgSecondary => null;
  Color? get colorContentPrimary => null;
  Color? get colorContentSecondary => null;
  Color? get colorContentSuccess => null;
  Color? get colorContentTertiary => null;
  Color? get colorContentWarning => null;
  Color? get colorLineSeperatorStrong => null;
  Color? get colorLineSeperatorWeak => null;
  Color? get colorBackgroundNavTabbarElevated => null;
  Color? get colorNeuralWhite100 => null;
  Color? get colorNeuralBlack100 => null;
  LinearGradient? get gradientGradientAsr => null;
  LinearGradient? get gradientGradientOnbgBottom2top => null;
  LinearGradient? get gradientGradientOnbgTop2bottom => null;
  LinearGradient? get gradientGradientOnimgBottom2top => null;
  LinearGradient? get gradientGradientOnimgTop2bottom => null;
}

ThemeData getModuleLightTheme(ThemeModuleType? moduleType) {
  switch (moduleType) {

    default:
      return AppLightTheme().lightTheme;
  }
}

ThemeData getModuleDarkTheme(ThemeModuleType? moduleType) {
  switch (moduleType) {

    default:
      return AppDarkTheme().darkTheme;
  }
}

BaseTheme lightTheme(ThemeModuleType? moduleType) {
  return SuperAppLightThemeColors();
}

BaseTheme darkTheme(ThemeModuleType? moduleType) {
  return SuperAppDarkThemeColors();
}