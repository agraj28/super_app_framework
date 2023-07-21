import 'package:flutter/material.dart';
import 'package:super_app_framework/super_app_framework.dart';
import '../../theme/module_themes/base_theme.dart';

class ChangeThemeState {
  final ThemeData themeData;
  final BaseTheme theme;
  final ThemeType? type;
  bool? isDarkTheme;

  ChangeThemeState({
    required this.themeData,
    required this.theme,
    this.type,
  }) {
    isDarkTheme = themeData.brightness == Brightness.dark;
  }

  factory ChangeThemeState.lightTheme(
      {ThemeModuleType? moduleType, ThemeType? type}) {
    return ChangeThemeState(
      themeData: getModuleLightTheme(moduleType),
      theme: lightTheme(moduleType),
      type: type,
    );
  }

  factory ChangeThemeState.darkTheme(
      {ThemeModuleType? moduleType, ThemeType? type}) {
    return ChangeThemeState(
      themeData: getModuleDarkTheme(moduleType),
      theme: darkTheme(moduleType),
      type: type,
    );
  }
}
