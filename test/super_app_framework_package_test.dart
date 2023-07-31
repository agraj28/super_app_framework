import 'package:flutter_test/flutter_test.dart';
import 'package:super_app_framework_package/super_app_framework_package.dart';
import 'package:super_app_framework_package/super_app_framework_package_platform_interface.dart';
import 'package:super_app_framework_package/super_app_framework_package_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSuperAppFrameworkPackagePlatform
    with MockPlatformInterfaceMixin
    implements SuperAppFrameworkPackagePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SuperAppFrameworkPackagePlatform initialPlatform = SuperAppFrameworkPackagePlatform.instance;

  test('$MethodChannelSuperAppFrameworkPackage is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSuperAppFrameworkPackage>());
  });

  test('getPlatformVersion', () async {
    SuperAppFrameworkPackage superAppFrameworkPackagePlugin = SuperAppFrameworkPackage();
    MockSuperAppFrameworkPackagePlatform fakePlatform = MockSuperAppFrameworkPackagePlatform();
    SuperAppFrameworkPackagePlatform.instance = fakePlatform;

    expect(await superAppFrameworkPackagePlugin.getPlatformVersion(), '42');
  });
}
