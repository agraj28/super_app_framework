import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static bool mock = false;
  static SharedPreferences? prefs;
  static Geolocator? geolocator;
  static Location? location;
  static LocationData? currentLocation;
  static bool isInitialized = false;

  static Future initialize() async {
    if (mock || isInitialized) {
      return;
    }
    try {
      if (!mock) {
        prefs = await SharedPreferences.getInstance();
      }
      location = await Location();
      geolocator = await Geolocator();
      isInitialized = true;
      // add log
    } catch (e) {
      print("Error initializing LocalStorage ${e.toString()}");
    }
  }

  static clearPref() async {
    if (!isInitialized) {
      initialize();
    }
    prefs!.clear();
  }

  static void setString(String key, String value) {
    if (!isInitialized) {
      initialize();
    }
    prefs!.setString(key, value);
  }

  static String? getString(String key) {
    if (!isInitialized) {
      initialize();
    }
    return prefs!.getString(key);
  }

  static void setBool(String key, bool value) {
    if (!isInitialized) {
      initialize();
    }
    prefs!.setBool(key, value);
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    // add log
    if (!isInitialized) {
      initialize();
    }
    return prefs!.getBool(key) ?? defaultValue;
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    if (!isInitialized) {
      initialize();
    }
    return prefs!.setStringList(key, value);
  }

  static List<String> getStringList(String key) {
    if (!isInitialized) {
      initialize();
    }
    return prefs!.getStringList(key) ?? [];
  }
}
