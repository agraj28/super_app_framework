import 'package:flutter/material.dart';

class LightThemeColors {
  static Color primaryColor = Color(0xff000C3D);
  static Color primaryColorDark = Colors.white;
  static Color primaryButtonColor = Color(0xFF306AFF);
  static Color primaryColorLight = Color(0xFF00D3A2);
  static Color accentColor = Color(0xff000C3D);
  static Color backgroundColor = appBackgroundColor;
  static Color zoomInOutTextColor = Colors.black.withOpacity(0.4);
  static Color scaffoldBackgroundColor = appBackgroundColor;
  static Color selectedTextColor = Colors.black;
  static Color secondaryTextColor =
  LightThemeColors.zoomInOutTextColor.withOpacity(0.7);
  static Color highlightedTextColor = Color.fromARGB(255, 255, 92, 92);
  static Color shimmerReceiverBackColor = Colors.white;
  static Color shimmerReceiverHighlightColor =
  Color.fromARGB(255, 221, 223, 221);
  static Color shimmerSenderHighlightColor = Color.fromARGB(255, 230, 232, 230);

  static Color newsBackgroundColor = primaryColorDark;
  static Color newsCardBackgroundColor = backgroundColor;

  static Color alarmSecondartTextColor = Color(0xFFFE535E);

  static Color calenderAccentColor = Color(0xFF306AFF);
  static Color calenderButtonBorderColor = Colors.transparent;
  static Color calenderButtonFillColor = calenderAccentColor.withOpacity(0.08);

  static const Color appBackgroundColor = Color(0xFFF2F2F2);
  static Color homeCardBackgroundColor = Color(0xFFFAFAFA);
  static Color homeCardShadowColor = Colors.black.withOpacity(0.1);

  //Flights
  static const Color flightPrimaryColor = const Color(0xFF000C3D);
  static const Color flightAccentColor = const Color(0xFF000C3D);
  static const Color flightButtonColor = const Color(0xFF000000);
  static Color flightBackgroundColor = const Color(0xFFF2F2F2);

  // Hotels
  static Color hotelAccentColor = Color(0xFF306AFF);
  static Color hotelPrimaryColor = Color(0xFF000000);
  static Color hotelBackgroundColor = Color(0xFFF9F9F9);

  // emails
  static Color emailBackgroundColor = appBackgroundColor;
}

class DarkThemeColors {
  static Color primaryColor = Colors.white;
  static Color primaryColorDark = Colors.black;
  static Color primaryButtonColor = Color(0xFF306AFF);
  static Color primaryColorLight = Color(0xFF14F4C0);
  static Color accentColor = Color(0xff000C3D);
  static Color backgroundColor = appBackgroundColor;
  static Color zoomInOutTextColor = Colors.white.withOpacity(0.7);
  static Color scaffoldBackgroundColor = appBackgroundColor;

  static Color selectedTextColor = Colors.white;
  static Color secondaryTextColor =
  DarkThemeColors.zoomInOutTextColor.withOpacity(0.7);
  static Color highlightedTextColor = Color.fromARGB(255, 255, 92, 92);
  static Color shimmerReceiverBackColor = Color.fromARGB(255, 19, 19, 21);
  static Color shimmerReceiverHighlightColor = Color.fromARGB(255, 49, 49, 51);
  static Color shimmerSenderBackColor = Color.fromARGB(255, 60, 57, 58);
  static Color shimmerSenderHighlightColor = Color.fromARGB(255, 90, 87, 88);

  static Color newsBackgroundColor = Color(0xFF37373D);
  static Color newsCardBackgroundColor = Color(0xFF27272D);

  static Color calenderAccentColor = Color(0xFF306AFF);
  static Color calenderButtonBorderColor = calenderAccentColor;
  static Color calenderButtonFillColor = Colors.transparent;

  static Color alarmBackgroundColor = Color.fromARGB(255, 23, 21, 22);
  static Color alarmSecondaryTextColor = Colors.white.withOpacity(0.6);

  static Color parkingBackgroundColor =
  Color.fromARGB(255, 23, 21, 22); //#171516

  static const Color appBackgroundColor = Color(0xFF0F1015);
  static Color homeCardBackgroundColor = Color(0xFF1B191A);
  static Color homeCardShadowColor = Colors.black;

  //Flights
  static const Color flightPrimaryColor = const Color(0xFF000C3D);
  static const Color flightAccentColor = const Color(0xFF000C3D);
  static const Color flightButtonColor = const Color(0xFFffffff);
  static Color flightBackgroundColor = appBackgroundColor;

  // Hotels
  static Color hotelAccentColor = Color(0xFF306AFF);
  static Color hotelPrimaryColor = Color(0xFFE8E8EB);
  static Color hotelBackgroundColor = Color(0xFF171516);

  // emails
  static Color emailBackgroundColor = appBackgroundColor;
}

// Common widgets colors
const Color kColorAlert = Color(0xFFFE5C5C);
const Color kColorDisabledPrimary = Color(0xAA00619E);
const Color kColorEnabledPrimary = Color(0xFF00619E);
const Color kColorDisabledWhite = Colors.white30;

// App module colors
const Color kColorGreen = Colors.green;

const Color kColorTextField = Color(0xFF000C3D);

const Color kColorGreyCB = Color(0xFF000C3D);

// Login module colors
const Color kColorRed = Colors.red;

// Calendar module colors
const Color kColorCreateEventPink = Color(0xFFFE535E);
const Color kColorGreenStatus = Color(0xFF00D028);
const Color kColorDarkBlueStatus = Color(0xFF0276FF);
const Color kColorRedBorder = Color(0xFFFE4B4B);
const Color kColorSwitchInactive = Color(0xFF7D7B7C);

class WeatherPageColors {
  static const Color primaryBackground = Color.fromARGB(255, 36, 36, 43);
  static const Color dailyprimaryBackground = Color.fromARGB(124, 36, 36, 43);
  static const Color primaryText = Color.fromARGB(255, 255, 255, 255);
}

class MusicPageColors {
  static const Color greenColor = Color(0xffCCFF00);
  static const Color trackNotActiveColor = Color(0xffFFFFFF99);
  static const Color musicBgColor = Color(0xff262324);
}

const Color kColorPrimary = Color(0xFF00619e);
const Color kColorAccent = Color(0xFF0A9CFB);
const Color kColorSecondary = Color(0xFF314959);
const Color kColorWhite = Colors.white;
const Color kColorBlack = Colors.black;
//const Color kColorRed = Colors.black;
const Color kColorLightBlue = Color(0xFF4A90E2);
const Color kColorMediumBlue = Color(0xFF5A93FF);
//const Color kColorDisabledPrimary = Color(0xAA00619e);
//const Color kColorDisabledWhite = Colors.white30;
//const Color kColorAlert = Color(0xFFF85359);
const Color kColorDarkGrey = Color(0xFF262324);
const Color kColorLightYellow = Color(0xFFFFC081);
const Color kColorDarkYellow = Color(0xFFFFC502);

class NewAppColor {
  static const Color primaryBackground = Color.fromARGB(255, 0, 0, 0);
  static const Color secondaryBackground = Color.fromARGB(255, 255, 255, 255);
  static const Color ternaryBackground = Color(0xFF262324);
  static const Color primaryElement = Color.fromARGB(255, 0, 0, 0);
  static const Color secondaryElement = Color.fromARGB(255, 255, 255, 255);
  static const Color accentElement = Color.fromARGB(255, 204, 255, 0);
  static const Color primaryText = Color.fromARGB(255, 0, 0, 0);
  static const Color secondaryText = Color.fromARGB(255, 255, 255, 255);
  static const Color accentText = Color.fromARGB(255, 128, 128, 128);
}

class AppColors {
  static const Color ternaryBackground = Color.fromARGB(255, 36, 36, 43);
  static const Color secondaryBackground = Color.fromARGB(255, 0, 0, 0);
  static const Color primaryBackground = Color.fromARGB(255, 0, 0, 0);
  static const Color primaryElement = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryElement = Color.fromARGB(255, 167, 167, 170);
  static const Color primaryText = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryText = Color.fromARGB(255, 252, 81, 146);
  static const Color weatherprimaryText = Color.fromARGB(255, 255, 255, 255);
  static const Color threadReceiverBackground = Color.fromARGB(255, 19, 19, 21);
  static const Color threadSenderBackground = Color.fromARGB(255, 60, 57, 58);
  static const Color emailSplashBackground = Color.fromARGB(255, 191, 150, 14);
  static const Color divider = Color.fromARGB(25, 255, 255, 255);
}

// Currently used by IM module, not movies module.
class MoviePageColors {
  static const Color faded = const Color(0xFF686C87);
  static const Color highlight = const Color(0xFFFE9923);
  static const Color iconColor = const Color(0xff306AFF);
}
