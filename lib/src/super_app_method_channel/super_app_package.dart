
import 'super_app_package_platform_interface.dart';

class SuperAppPackage {
  Future<String?> getPlatformVersion() {
    return SuperAppPackagePlatform.instance.getPlatformVersion();
  }
}
