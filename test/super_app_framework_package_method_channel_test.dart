import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_app_framework_package/super_app_framework_package_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelSuperAppFrameworkPackage platform = MethodChannelSuperAppFrameworkPackage();
  const MethodChannel channel = MethodChannel('super_app_framework_package');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
