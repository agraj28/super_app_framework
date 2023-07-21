// Get the scope string

import 'dart:io';
import 'package:device_info/device_info.dart';

enum DioClientType { TOKEN_DIO, DEFAULT_DIO, SSL_PINNED_DIO }

enum ThemeModuleType {
  Home,
  Type,
}

enum ThemeType { Dark, Light }

enum NavigationDomains {
  App,
  // ignore: constant_identifier_names
  Common,
  // ignore: constant_identifier_names
  Home,

}

abstract class FontFamily {
  static const String MierA = 'MierA';
  static const String MierB = 'MierB';
  static const String Graphik = 'Graphik';
  static const String cambon = 'Cambon';
  static const String suisse = 'Suisse';
  static const String pilatCondensed = 'PilatCondensed';
  static const String mierBBook = 'MierB-Book';
  static const String ProximaNova = 'ProximaNova';
  static const String ProximaNovaLight = 'ProximaNovaLight';
  static const String ProximaNovaBold = 'ProximaNovaBold';
  static const String roboto = 'Roboto';
}





enum EnumPageIntent {
  App,
  // ignore: constant_identifier_names
  Common,
  // ignore: constant_identifier_names
  Home,
  // ignore: constant_identifier_names
  DefaultPage,

}

enum ScrollDirectionEnum { Idle, Forward, Reverse }


// Get the domain name
NavigationDomains getDomainName(EnumPageIntent enumPageIntent) {
  var navigationDomains = NavigationDomains.Home;
  switch (enumPageIntent) {
    case EnumPageIntent.Home:
      navigationDomains = NavigationDomains.Home;
      break;

    case EnumPageIntent.App:
      navigationDomains = NavigationDomains.App;
      break;
    default:
      navigationDomains = NavigationDomains.Common;
      break;
  }

  return navigationDomains;
}




Future<String> getDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId; // unique ID on Android
  } else {
    return 'Unknown';
  }
}

