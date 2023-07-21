import 'package:super_app_framework/super_app_framework.dart';

class FrameworkServiceHelper {
  FrameworkServiceHelper._privateConstructor();

  Map<NavigationDomains?, DomainConfig?> domainConfigList =
      <NavigationDomains?, DomainConfig?>{};
  static final FrameworkServiceHelper getInstance =
      FrameworkServiceHelper._privateConstructor();

  void setupDomainConfig(
      {NavigationDomains? domain, DomainConfig? domainConfig}) {
    domainConfigList[domain] = domainConfig;
  }

  Map<String, dynamic>? getCredentials({NavigationDomains? domain}) {
    return domainConfigList[domain]?.credentials;
  }
}
