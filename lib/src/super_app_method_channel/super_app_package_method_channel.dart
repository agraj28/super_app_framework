import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'super_app_package_platform_interface.dart';

/// An implementation of [SuperAppPackagePlatform] that uses method channels.
class MethodChannelSuperAppPackage extends SuperAppPackagePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('super_app_package');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
