import 'dart:core';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:package_info/package_info.dart';

class SystemInfoHelpers {
  String tag = 'AnalyticsService';

  SystemInfoHelpers._privateConstructor();

  static final SystemInfoHelpers getInstance =
      SystemInfoHelpers._privateConstructor();

  late DeviceInfo _deviceInfo;
  String? _buildNumber, _appVersionName, _appId;

  Future<void> init() async {
    var packageInfo = await PackageInfo.fromPlatform();
    _buildNumber = packageInfo.buildNumber; // 255 AKA version code
    _appVersionName = packageInfo.version; //1.0.1
    _appId = packageInfo.packageName; //com.iamplus.mafplus
    _deviceInfo = await _getDeviceInfo();
  }

  String get deviceId => _deviceInfo.id;

  String get deviceModel => _deviceInfo.model;

  String get devicePlatform => _deviceInfo.platform;

  String get deviceLocale => _deviceInfo.locale;

  String? get buildNumber => _buildNumber;

  String? get appVersionName => _appVersionName;
  String? get osVersion => _deviceInfo.osVersion;

  String? get appId => _appId;

  Future<DeviceInfo> _getDeviceInfo() async {
    var locale = await Devicelocale.currentLocale ?? 'en-us';
    locale =
        locale.toLowerCase().replaceAll('_', '-'); // formatting string locale
    if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      return DeviceInfo(iosInfo.identifierForVendor, iosInfo.model, 'IOS',
          locale, iosInfo.systemVersion.toString());
    } else {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      return DeviceInfo(androidInfo.androidId, androidInfo.model, 'Android',
          locale, androidInfo.version.release.toString());
    }
  }
}

class DeviceInfo {
  final String id, model, platform, locale, osVersion;

  DeviceInfo(this.id, this.model, this.platform, this.locale, this.osVersion);
}
