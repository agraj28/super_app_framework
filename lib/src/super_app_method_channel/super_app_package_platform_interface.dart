import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'super_app_package_method_channel.dart';

abstract class SuperAppPackagePlatform extends PlatformInterface {
  /// Constructs a SuperAppPackagePlatform.
  SuperAppPackagePlatform() : super(token: _token);

  static final Object _token = Object();

  static SuperAppPackagePlatform _instance = MethodChannelSuperAppPackage();

  /// The default instance of [SuperAppPackagePlatform] to use.
  ///
  /// Defaults to [MethodChannelSuperAppPackage].
  static SuperAppPackagePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SuperAppPackagePlatform] when
  /// they register themselves.
  static set instance(SuperAppPackagePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
