import 'package:super_app_framework/src/core/services/location_manager/repository/model/location_credentials.dart';

import '../contract/location_local_contract.dart';

import 'custom/provider/custom_location_repository.dart';
import 'local/location_preferences_repository.dart';

class LocationRepositoryProvider {
  static CustomLocationRepository getCustomLocationRepository(
      LocationCredentials? locationCredentials) {
    return CustomLocationRepository(locationCredentials);
  }

  static LocationLocalContract getLocationHiveRepository() {
    return LocationPreferencesRepository();
  }
}
