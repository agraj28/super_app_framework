import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'model/location_model.dart';

class LocationExtras {
  static void locationDeviceLog(
      {String? tag, String? domainName, String? message, String? pluginName}) {
    tag ??= 'LocationService';
    domainName ??= 'unknown';
    pluginName ??= 'unknown';
    var description = 'Domain Name -> $domainName ,';
    description += 'Plugin Name -> $pluginName ,';
    description += 'message -> $message';
    if (kDebugMode) {
      // add log from here
    }
  }

  static void locationDeviceLogLocation(
      {String? tag,
      String? domainName,
      LocationAddressModel? model,
      bool isLastKnownLocation = false,
      String? pluginName}) {
    tag ??= 'LocationService';
    domainName ??= 'unknown';
    pluginName ??= 'unknown';
    if (model != null) {
      var map = <String, dynamic>{
        'DomainName': domainName,
        'PluginName': pluginName,
        'isLastKnownLocation': isLastKnownLocation,
      };
      map.addAll(model.toJson());
      var result;
      try {
        result = json.encode(map);
      } on Exception catch (e) {
        print("exception $e");
        result = map.toString();
      }
      if (kDebugMode) {
       // debug log
      } else {
        // prod log
      }
    }
  }
}
