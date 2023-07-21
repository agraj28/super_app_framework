

import 'package:super_app_framework/src/core/services/location_manager/location_manager_public.dart';

enum LocationTypeAPi {
  common,
  cityApi,
  geocodeType, //only geocoding results, rather than business results.
  addressType, //only geocoding results with a precise address.
  establishmentType, //only business results.
  regionsType, // match locality, sublocality, postal_code, country, administrative_area_level_1, administrative_area_level_2
  citiesType, //match locality or administrative_area_level_3.
}

class LocationServiceDomainHelper {
  static Future<LocationAddressModel?> getLocationByName(
    String locationName,
    String domainName, {
    LocationTypeAPi locationType = LocationTypeAPi.common,
    num? offset,
    num? radius,
    String? language,
    bool? strictbounds,
    String? components,
    String? region,
    double? latitude,
    double? longitude,
    LocationSearchEnum? locationEnum,
  }) async {
    var list = await getLocationByNameList(locationName, domainName,
        offset: offset,
        radius: radius,
        language: language,
        strictbounds: strictbounds,
        components: components,
        region: region,
        latitude: latitude,
        longitude: longitude,
        locationEnum: locationEnum,
        locationType: locationType);
    if ((list?.length ?? 0) > 0) {
      return await LocationServiceManager.getLocationRepository()
          .validateLocation(list!.first, domainName);
    }
    return null;
  }

  static Future<List<LocationAddressModel>?> getLocationByNameList(
    String locationName,
    String domainName, {
    LocationTypeAPi locationType = LocationTypeAPi.common,
    num? offset,
    num? radius,
    String? language,
    bool? strictbounds,
    String? components,
    String? region,
    double? latitude,
    double? longitude,
    LocationSearchEnum? locationEnum,
  }) async {
    List<LocationAddressModel>? list = <LocationAddressModel>[];
    String? types;
    switch (locationType) {
      case LocationTypeAPi.cityApi:
        list = await LocationServiceManager.getLocationRepository()
            .getCity(locationName, domainName);
        break;
      case LocationTypeAPi.geocodeType:
        types = 'geocode';
        break;
      case LocationTypeAPi.addressType:
        types = 'address';
        break;
      case LocationTypeAPi.establishmentType:
        types = 'establishment';
        break;
      case LocationTypeAPi.regionsType:
        types = '(regions)';
        break;
      case LocationTypeAPi.citiesType:
        types = '(cities)';
        break;
      case LocationTypeAPi.common:
      default:
        break;
    }

    if (!((list?.length ?? 0) > 0) && ((types?.length ?? 0) > 0)) {
      list =
          await LocationServiceManager.getLocationRepository().getAddressList(
        locationName,
        domainName,
        offset: offset,
        radius: radius,
        language: language,
        strictbounds: strictbounds,
        components: components,
        region: region,
        latitude: latitude,
        longitude: longitude,
        locationEnum: locationEnum,
        types: types,
      );
    }

    if (!((list?.length ?? 0) > 0)) {
      list =
          await LocationServiceManager.getLocationRepository().getAddressList(
        locationName,
        domainName,
        offset: offset,
        radius: radius,
        language: language,
        strictbounds: strictbounds,
        components: components,
        region: region,
        latitude: latitude,
        longitude: longitude,
        locationEnum: locationEnum,
      );
    }
    return list;
  }
}
