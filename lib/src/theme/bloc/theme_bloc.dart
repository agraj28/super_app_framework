import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_app_framework/src/theme/main_themes/dark_theme.dart';
import 'package:super_app_framework/super_app_framework.dart';

import '../module_themes/super_app_dark_theme.dart';
import 'change_theme_event.dart';
import 'change_theme_state.dart';

class ThemeBlocSingleton {
  static final instance = ThemeBlocSingleton._();
  ThemeBlocSingleton._();

  final ThemeBloc themeBloc = ThemeBloc();
}

ThemeBloc themeBloc = ThemeBlocSingleton.instance.themeBloc;

class ThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  static ThemeBloc of(BuildContext context) =>
      BlocProvider.of<ThemeBloc>(context);
  ThemeModuleType? moduleType;
  ThemeType? themeType;

  ThemeBloc({this.moduleType, this.themeType})
      : super(ChangeThemeState(themeData: AppDarkTheme().darkTheme, theme: SuperAppDarkThemeColors()));

  void onLightThemeChange() {
    print("moduleType ${moduleType}");
    add(LightTheme(moduleType, ThemeType.Light));
  }

  void onDarkThemeChange({bool isInterimTheme = false}) {
    add(DarkTheme(moduleType, ThemeType.Dark, isInterimTheme));
  }

  void onDecideThemeChange(
      {ThemeModuleType? moduleType,
      ThemeType? themeType}) {
    themeBloc.add(DecideTheme(moduleType, themeType));
  }

  @override
  Stream<ChangeThemeState> mapEventToState(ChangeThemeEvent event) async* {
    print("Modül type is ${event.type}");
    if (event is DecideTheme) {
      var optionValue = await getOption();
      if (event.themeType != null) {
        optionValue = event.themeType == ThemeType.Dark ? 0 : 1;
      }
      print("optionValue is $optionValue");
      if (optionValue == 0) {
        yield ChangeThemeState.darkTheme(
          moduleType: event.type,
        );
      } else if (optionValue == 1) {
        yield ChangeThemeState.lightTheme(
          moduleType: event.type,
        );
      }
    }
    if (event is LightTheme) {
      yield ChangeThemeState.lightTheme(
        moduleType: event.type,
      );
      try {
        // Don't save for the interim theme

          await _saveOptionValue(1);

      } on Exception catch (_) {
        throw Exception('Could not persist change');
      }
    }

    if (event is DarkTheme) {
      yield ChangeThemeState.darkTheme(
        moduleType: moduleType,
      );
      try {

          await _saveOptionValue(0);

      } on Exception catch (_) {
        throw Exception('Could not persist change');
      }
    }
  }

  Future<Null> _saveOptionValue(int optionValue) async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.setInt('theme_option', optionValue);
  }

  Future<int> getOption() async {
    var preferences = await SharedPreferences.getInstance();

    int option = preferences.get('theme_option') as int? ?? 0;
    return option;
  }

  Future<ThemeType> getThemeType() async {
    var option = await getOption();
    return ThemeType.values[option];
  }

  /// Which,
  ///
  /// Notify all domain themes, when we change theme [dark or light]
  void notifyThemeChange() {
    Future.delayed(Duration(milliseconds: 500), () {
      // require delay,
      themeBloc.onDecideThemeChange();
    });
  }
}
