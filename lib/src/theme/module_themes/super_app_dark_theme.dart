import 'package:flutter/material.dart';
import 'package:super_app_framework/src/theme/main_themes/theme_colors.dart';
import 'package:super_app_framework/src/theme/module_themes/super_app_theme_color_constant/super_app_dark_theme_enum.dart';
import 'package:super_app_framework/super_app_framework.dart';
import 'base_theme.dart';

class SuperAppDarkThemeColors implements BaseTheme {
  @override
  Brightness? brightness;

  @override
  Color get accentColor => Color(0xFF306AFF);

  @override
  Color get primaryColor => DarkThemeColors.primaryColor;

  @override
  Color get darkAccentColor => Color(0xFF306AFF);

  @override
  Color get darkPrimaryColor => DarkThemeColors.primaryColor;

  @override
  ThemeData get darkTheme => ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      primaryColor: darkPrimaryColor,
      highlightColor: Color(0xFFFC6262),
      dividerColor: primaryColor.withOpacity(0.4),
      backgroundColor: DarkThemeColors.appBackgroundColor,
      scaffoldBackgroundColor: DarkThemeColors.appBackgroundColor,
      cardColor: Colors.white.withOpacity(0.05),
      hintColor: darkPrimaryColor,
      colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: darkAccentColor));

  @override
  ThemeData? get lightTheme => throw UnimplementedError();

  @override
  Color? get colorBackgroundButtonDeactivated => SuperAppDarkTheme.colorBackgroundButtonDeactivated;

  @override
  Color? get colorBackgroundButtonPrimary => SuperAppDarkTheme.colorBackgroundButtonPrimary;

  @override
  Color? get colorBackgroundButtonSecondary => SuperAppDarkTheme.colorBackgroundButtonSecondary;

  @override
  Color? get colorBackgroundContent => SuperAppDarkTheme.colorBackgroundContent;

  @override
  Color? get colorBackgroundErrorStrong => SuperAppDarkTheme.colorBackgroundErrorStrong;

  @override
  Color? get colorBackgroundErrorWeak => SuperAppDarkTheme.colorBackgroundErrorWeak;

  @override
  Color? get colorBackgroundImg1 => SuperAppDarkTheme.colorBackgroundImg1;

  @override
  Color? get colorBackgroundImg10 => SuperAppDarkTheme.colorBackgroundImg10;

  @override
  Color? get colorBackgroundImg11 => SuperAppDarkTheme.colorBackgroundImg11;

  @override
  Color? get colorBackgroundImg12 => SuperAppDarkTheme.colorBackgroundImg12;

  @override
  Color? get colorBackgroundImg13 => SuperAppDarkTheme.colorBackgroundImg13;
@override 
Color? get colorBackgroundNavTabbarElevated=>SuperAppDarkTheme.colorBackgroundNavTabbarElevated;
  @override
  Color? get colorBackgroundImg14 => SuperAppDarkTheme.colorBackgroundImg14;

  @override
  Color? get colorBackgroundImg15 => SuperAppDarkTheme.colorBackgroundImg15;

  @override
  Color? get colorBackgroundImg16 => SuperAppDarkTheme.colorBackgroundImg16;

  @override
  Color? get colorBackgroundImg17 => SuperAppDarkTheme.colorBackgroundImg17;

  @override
  Color? get colorBackgroundImg18 => SuperAppDarkTheme.colorBackgroundImg18;

  @override
  Color? get colorBackgroundImg19 => SuperAppDarkTheme.colorBackgroundImg19;

  @override
  Color? get colorBackgroundImg2 => SuperAppDarkTheme.colorBackgroundImg2;

  @override
  Color? get colorBackgroundImg20 => SuperAppDarkTheme.colorBackgroundImg20;

  @override
  Color? get colorBackgroundImg3 => SuperAppDarkTheme.colorBackgroundImg3;

  @override
  Color? get colorBackgroundImg4 => SuperAppDarkTheme.colorBackgroundImg4;

  @override
  Color? get colorBackgroundImg5 => SuperAppDarkTheme.colorBackgroundImg5;

  @override
  Color? get colorBackgroundImg6 => SuperAppDarkTheme.colorBackgroundImg6;

  @override
  Color? get colorBackgroundImg7 => SuperAppDarkTheme.colorBackgroundImg7;

  @override
  Color? get colorBackgroundImg8 => SuperAppDarkTheme.colorBackgroundImg8;

  @override
  Color? get colorBackgroundImg9 => SuperAppDarkTheme.colorBackgroundImg9;

  @override
  Color? get colorBackgroundLoaderStrong => SuperAppDarkTheme.colorBackgroundLoaderStrong;

  @override
  Color? get colorBackgroundLoaderWeak => SuperAppDarkTheme.colorBackgroundLoaderWeak;

  @override
  Color? get colorBackgroundNavDefault => SuperAppDarkTheme.colorBackgroundNavDefault;

  @override
  Color? get colorBackgroundNavIcon => SuperAppDarkTheme.colorBackgroundNavIcon;

  @override
  Color? get colorBackgroundNavOnImg => SuperAppDarkTheme.colorBackgroundNavOnImg;

  @override
  Color? get colorBackgroundNavTabbar => SuperAppDarkTheme.colorBackgroundNavTabbar;

  @override
  Color? get colorBackgroundPage => SuperAppDarkTheme.colorBackgroundPage;

  @override
  Color? get colorBackgroundSuccessStrong => SuperAppDarkTheme.colorBackgroundSuccessStrong;

  @override
  Color? get colorBackgroundSuccessWeak => SuperAppDarkTheme.colorBackgroundSuccessWeak;

  @override
  Color? get colorBackgroundWarningStrong => SuperAppDarkTheme.colorBackgroundWarningStrong;

  @override
  Color? get colorBackgroundWarningWeak => SuperAppDarkTheme.colorBackgroundWarningWeak;

  @override
  Color? get colorBackgroundWidgetBackground => SuperAppDarkTheme.colorBackgroundWidgetBackground;

  @override
  Color? get colorBackgroundWidgetForeground => SuperAppDarkTheme.colorBackgroundWidgetForeground;

  @override
  Color? get colorBrandSharePrimary => SuperAppDarkTheme.colorBrandSharePrimary;

  @override
  Color? get colorContentDeactivated => SuperAppDarkTheme.colorContentDeactivated;

  @override
  Color? get colorContentError => SuperAppDarkTheme.colorContentError;

  @override
  Color? get colorContentLink => SuperAppDarkTheme.colorContentLink;

  @override
  Color? get colorContentMuted => SuperAppDarkTheme.colorContentMuted;

  @override
  Color? get colorContentOnImgDeactivated => SuperAppDarkTheme.colorContentOnImgDeactivated;

  @override
  Color? get colorContentOnImgPrimary => SuperAppDarkTheme.colorContentOnImgPrimary;

  @override
  Color? get colorContentOnImgSecondary => SuperAppDarkTheme.colorContentOnImgSecondary;

  @override
  Color? get colorContentPrimary => SuperAppDarkTheme.colorContentPrimary;

  @override
  Color? get colorContentSecondary => SuperAppDarkTheme.colorContentSecondary;

  @override
  Color? get colorContentSuccess => SuperAppDarkTheme.colorContentSuccess;

  @override
  Color? get colorContentTertiary => SuperAppDarkTheme.colorContentTertiary;

  @override
  Color? get colorContentWarning => SuperAppDarkTheme.colorContentWarning;

  @override
  Color? get colorLineSeperatorStrong => SuperAppDarkTheme.colorLineSeperatorStrong;

  @override
  Color? get colorLineSeperatorWeak => SuperAppDarkTheme.colorLineSeperatorWeak;

  @override
  LinearGradient? get gradientGradientAsr => SuperAppDarkTheme.gradientGradientAsr;

  @override
  LinearGradient? get gradientGradientOnbgBottom2top => SuperAppDarkTheme.gradientGradientOnbgBottom2top;

  @override
  LinearGradient? get gradientGradientOnbgTop2bottom => SuperAppDarkTheme.gradientGradientOnbgTop2bottom;

  @override
  LinearGradient? get gradientGradientOnimgBottom2top => SuperAppDarkTheme.gradientGradientOnimgBottom2top;

  @override
  LinearGradient? get gradientGradientOnimgTop2bottom => SuperAppDarkTheme.gradientGradientOnimgTop2bottom;

  @override
  Color? get colorNeuralBlack100 => SuperAppDarkTheme.colorNeutralBlack100;

  @override
  Color? get colorNeuralWhite100 => SuperAppDarkTheme.colorNeutralWhite100;
}
