import 'package:flutter/material.dart';
import 'package:super_app_framework/src/theme/main_themes/theme_colors.dart';
import 'base_theme.dart';
import 'super_app_theme_color_constant/super_app_light_theme_enum.dart';

class SuperAppLightThemeColors implements BaseTheme {
  @override
  Brightness? brightness = Brightness.light;

  @override
  Color get primaryColor => LightThemeColors.primaryColor;

  @override
  Color get accentColor => Color(0xFFFF005C);

  @override
  Color get darkAccentColor => Color(0xFFFF1E5C);

  @override
  Color get darkPrimaryColor => DarkThemeColors.primaryColor;

  @override
  ThemeData? get darkTheme => throw UnimplementedError();

  @override
  ThemeData get lightTheme => ThemeData.light().copyWith(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      highlightColor: Color(0xFFFC6262),
      dividerColor: primaryColor.withOpacity(0.4),
      backgroundColor: LightThemeColors.appBackgroundColor,
      scaffoldBackgroundColor: LightThemeColors.appBackgroundColor,
      cardColor: Colors.white,
      hintColor: Color(0xFFFA58B4C),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor));

  @override
  Color? get colorBackgroundButtonDeactivated => SuperAppLightTheme.colorBackgroundButtonDeactivated;

  @override
  Color? get colorBackgroundButtonPrimary => SuperAppLightTheme.colorBackgroundButtonPrimary;

  @override
  Color? get colorBackgroundButtonSecondary => SuperAppLightTheme.colorBackgroundButtonSecondary;

  @override
  Color? get colorBackgroundContent => SuperAppLightTheme.colorBackgroundContent;

  @override
  Color? get colorBackgroundErrorStrong => SuperAppLightTheme.colorBackgroundErrorStrong;

  @override
  Color? get colorBackgroundErrorWeak => SuperAppLightTheme.colorBackgroundErrorWeak;

  @override
  Color? get colorBackgroundImg1 => SuperAppLightTheme.colorBackgroundImg1;

  @override
  Color? get colorBackgroundImg10 => SuperAppLightTheme.colorBackgroundImg10;

  @override
  Color? get colorBackgroundImg11 => SuperAppLightTheme.colorBackgroundImg11;

  @override
  Color? get colorBackgroundImg12 => SuperAppLightTheme.colorBackgroundImg12;

  @override
  Color? get colorBackgroundImg13 => SuperAppLightTheme.colorBackgroundImg13;

  @override
  Color? get colorBackgroundImg14 => SuperAppLightTheme.colorBackgroundImg14;

  @override
  Color? get colorBackgroundImg15 => SuperAppLightTheme.colorBackgroundImg15;

  @override
  Color? get colorBackgroundImg16 => SuperAppLightTheme.colorBackgroundImg16;

  @override
  Color? get colorBackgroundImg17 => SuperAppLightTheme.colorBackgroundImg17;

  @override
  Color? get colorBackgroundImg18 => SuperAppLightTheme.colorBackgroundImg18;

  @override
  Color? get colorBackgroundImg19 => SuperAppLightTheme.colorBackgroundImg19;

  @override
  Color? get colorBackgroundImg2 => SuperAppLightTheme.colorBackgroundImg2;

  @override
  Color? get colorBackgroundImg20 => SuperAppLightTheme.colorBackgroundImg20;

  @override
  Color? get colorBackgroundImg3 => SuperAppLightTheme.colorBackgroundImg3;

  @override
  Color? get colorBackgroundImg4 => SuperAppLightTheme.colorBackgroundImg4;

  @override
  Color? get colorBackgroundImg5 => SuperAppLightTheme.colorBackgroundImg5;

  @override
  Color? get colorBackgroundImg6 => SuperAppLightTheme.colorBackgroundImg6;

  @override
  Color? get colorBackgroundImg7 => SuperAppLightTheme.colorBackgroundImg7;

  @override
  Color? get colorBackgroundImg8 => SuperAppLightTheme.colorBackgroundImg8;

  @override
  Color? get colorBackgroundImg9 => SuperAppLightTheme.colorBackgroundImg9;

  @override
  Color? get colorBackgroundLoaderStrong => SuperAppLightTheme.colorBackgroundLoaderStrong;

  @override
  Color? get colorBackgroundLoaderWeak => SuperAppLightTheme.colorBackgroundLoaderWeak;

  @override
  Color? get colorBackgroundNavDefault => SuperAppLightTheme.colorBackgroundNavDefault;

  @override
  Color? get colorBackgroundNavIcon => SuperAppLightTheme.colorBackgroundNavIcon;

  @override
  Color? get colorBackgroundNavOnImg => SuperAppLightTheme.colorBackgroundNavOnImg;

  @override
  Color? get colorBackgroundNavTabbar => SuperAppLightTheme.colorBackgroundNavTabbar;

  @override
  Color? get colorBackgroundPage => SuperAppLightTheme.colorBackgroundPage;

  @override
  Color? get colorBackgroundSuccessStrong => SuperAppLightTheme.colorBackgroundSuccessStrong;

  @override
  Color? get colorBackgroundSuccessWeak => SuperAppLightTheme.colorBackgroundSuccessWeak;

  @override
  Color? get colorBackgroundWarningStrong => SuperAppLightTheme.colorBackgroundWarningStrong;

  @override
  Color? get colorBackgroundWarningWeak => SuperAppLightTheme.colorBackgroundWarningWeak;

  @override
  Color? get colorBackgroundWidgetBackground => SuperAppLightTheme.colorBackgroundWidgetBackground;

  @override
  Color? get colorBackgroundWidgetForeground => SuperAppLightTheme.colorBackgroundWidgetForeground;

  @override
  Color? get colorBrandSharePrimary => SuperAppLightTheme.colorBrandSharePrimary;

  @override
  Color? get colorContentDeactivated => SuperAppLightTheme.colorContentDeactivated;

  @override
  Color? get colorContentError => SuperAppLightTheme.colorContentError;

  @override
  Color? get colorContentLink => SuperAppLightTheme.colorContentLink;

  @override
  Color? get colorContentMuted => SuperAppLightTheme.colorContentMuted;

  @override
  Color? get colorContentOnImgDeactivated => SuperAppLightTheme.colorContentOnImgDeactivated;

  @override
  Color? get colorContentOnImgPrimary => SuperAppLightTheme.colorContentOnImgPrimary;

  @override
  Color? get colorContentOnImgSecondary => SuperAppLightTheme.colorContentOnImgSecondary;

  @override
  Color? get colorContentPrimary => SuperAppLightTheme.colorContentPrimary;

  @override
  Color? get colorContentSecondary => SuperAppLightTheme.colorContentSecondary;

  @override
  Color? get colorContentSuccess => SuperAppLightTheme.colorContentSuccess;

  @override
  Color? get colorContentTertiary => SuperAppLightTheme.colorContentTertiary;

  @override
  Color? get colorContentWarning => SuperAppLightTheme.colorContentWarning;

  @override
  Color? get colorLineSeperatorStrong => SuperAppLightTheme.colorLineSeperatorStrong;
@override 
Color? get colorBackgroundNavTabbarElevated=>SuperAppLightTheme.colorBackgroundNavTabbarElevated;
  @override
  Color? get colorLineSeperatorWeak => SuperAppLightTheme.colorLineSeperatorWeak;

  @override
  LinearGradient? get gradientGradientAsr => SuperAppLightTheme.gradientGradientAsr;

  @override
  LinearGradient? get gradientGradientOnbgBottom2top => SuperAppLightTheme.gradientGradientOnbgBottom2top;

  @override
  LinearGradient? get gradientGradientOnbgTop2bottom => SuperAppLightTheme.gradientGradientOnbgTop2bottom;

  @override
  LinearGradient? get gradientGradientOnimgBottom2top => SuperAppLightTheme.gradientGradientOnimgBottom2top;

  @override
  LinearGradient? get gradientGradientOnimgTop2bottom => SuperAppLightTheme.gradientGradientOnimgTop2bottom;

  @override
  Color? get colorNeuralBlack100 => SuperAppLightTheme.colorNeutralBlack100;

  @override
  Color? get colorNeuralWhite100 => SuperAppLightTheme.colorNeutralWhite100;
}
