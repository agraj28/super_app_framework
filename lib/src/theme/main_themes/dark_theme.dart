import 'package:flutter/material.dart';


import '../../theme/module_themes/base_theme.dart';
import '../module_themes/super_app_theme_color_constant/theme_colors.dart';

class AppDarkTheme extends BaseTheme {
  static final AppDarkTheme _instance = AppDarkTheme._();

  AppDarkTheme._();

  factory AppDarkTheme() => _instance;

  @override
  Color get primaryColor => LightThemeColors.primaryColor;

  @override
  Color get accentColor => LightThemeColors.accentColor;

  @override
  Brightness get brightness => Brightness.dark;

  @override
  ThemeData get darkTheme {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      brightness: brightness,
      primaryColor: DarkThemeColors.primaryColor,
      primaryColorDark: DarkThemeColors.primaryColorDark,
      primaryColorLight: DarkThemeColors.primaryColorLight,
      canvasColor: DarkThemeColors.primaryColorDark.withOpacity(0.4),
      // Card background
      disabledColor: DarkThemeColors.zoomInOutTextColor,
      dialogBackgroundColor: Colors.grey.shade200.withOpacity(0.2),
      backgroundColor: DarkThemeColors.backgroundColor,
      highlightColor: DarkThemeColors.shimmerReceiverBackColor,
      splashColor: DarkThemeColors.shimmerSenderBackColor,
      hoverColor: DarkThemeColors.shimmerReceiverHighlightColor,
      focusColor: DarkThemeColors.shimmerSenderHighlightColor,
      scaffoldBackgroundColor: DarkThemeColors.scaffoldBackgroundColor,
      cardColor: DarkThemeColors.newsCardBackgroundColor,
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: LightThemeColors.primaryButtonColor),
      buttonTheme:
          ButtonThemeData(buttonColor: LightThemeColors.primaryButtonColor),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: DarkThemeColors.accentColor),
    );
  }

  @override
  Color? get darkAccentColor => null;

  @override
  Color? get darkPrimaryColor => null;

  @override
  ThemeData? get lightTheme => null;
}
