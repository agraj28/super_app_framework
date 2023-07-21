import 'package:flutter/material.dart';
import '../../theme/module_themes/base_theme.dart';
import '../module_themes/super_app_theme_color_constant/theme_colors.dart';

class AppLightTheme extends BaseTheme {
  static final AppLightTheme _instance = AppLightTheme._();

  AppLightTheme._();

  factory AppLightTheme() => _instance;

  @override
  Color get primaryColor => LightThemeColors.primaryColor;

  @override
  Color get accentColor => LightThemeColors.accentColor;

  @override
  Brightness get brightness => Brightness.light;

  @override
  ThemeData get lightTheme {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      brightness: brightness,
      primaryColor: primaryColor,
      primaryColorDark: LightThemeColors.primaryColorDark,
      primaryColorLight: LightThemeColors.primaryColorLight,
      canvasColor: LightThemeColors.primaryColorDark, // Card background
      disabledColor: LightThemeColors.zoomInOutTextColor,
      dialogBackgroundColor: Colors.grey.shade200.withOpacity(0.2),
      backgroundColor: LightThemeColors.backgroundColor,
      highlightColor: LightThemeColors.primaryColorDark.withOpacity(0.5),
      hoverColor: LightThemeColors.primaryColor.withOpacity(0.7),
      splashColor: LightThemeColors.primaryColorDark.withOpacity(0.5),
      focusColor: LightThemeColors.primaryColor.withOpacity(0.7),
      scaffoldBackgroundColor: LightThemeColors.scaffoldBackgroundColor,
      cardColor: LightThemeColors.newsCardBackgroundColor,
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: LightThemeColors.primaryButtonColor),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
    );
  }

  @override
  Color? get darkAccentColor => null;

  @override
  Color? get darkPrimaryColor => null;

  @override
  ThemeData? get darkTheme => null;
}
