import 'dart:async';

import 'package:flutter_geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:uuid/uuid.dart';

import '../../../../helpers/extensions.dart';
import '../location_manager_public.dart';
import 'contract/location_local_contract.dart';
import 'location_extras.dart';
import 'model/custom_placemark.dart';
import 'model/location_credentials.dart';
import 'provider/custom/provider/custom_location_repository.dart';
import 'provider/location_repository_provider.dart';

class LocationRepository implements LocationRepositoryContract {
  static late LocationLocalContract _locationPreferencesRepository;
  static late CustomLocationRepository _customLocationRepository;
  static LocationSearchEnum defaultSearchParam = LocationSearchEnum.custom;

  static Uuid? _uuid;
  static String? _sessionToken;
  Timer? _timer;
  static final int _sessionTimeoutInSeconds = 60;
  static late String kgeocodeKey;

  void _clearSessionToken() {
    try {
      _timer?.cancel();
      _timer = null;
    } on Exception {
      _timer = null;
    }
    _sessionToken = null;
  }

  String? _getSessionTokenGenerateIfEmpty() {
    if (!_sessionToken.isNullOrEmpty) {
      _uuid ??= Uuid();
      _sessionToken = _uuid!.v4();
      _timer = Timer(
          Duration(seconds: _sessionTimeoutInSeconds), _clearSessionToken);
    }
    return _sessionToken;
  }

  String? _getSessionToken() {
    return _sessionToken;
  }

  LocationRepository(LocationCredentials? locationCredentials) {
    _locationPreferencesRepository =
        LocationRepositoryProvider.getLocationHiveRepository();
    _customLocationRepository =
        LocationRepositoryProvider.getCustomLocationRepository(
            locationCredentials);
    var credentials = locationCredentials;
    var apiCallMode = defaultSearchParam;
    if (credentials != null &&
        credentials.defaultApi != null &&
        credentials.defaultApi!.trim().isNotEmpty) {
      if (credentials.defaultApi!
          .trim()
          .toLowerCase()
          .contains(LocationSearchEnum.geocoder.getName().toLowerCase())) {
        apiCallMode = LocationSearchEnum.geocoder;
      } else if (credentials.defaultApi!
          .trim()
          .toLowerCase()
          .contains(LocationSearchEnum.custom.getName().toLowerCase())) {
        apiCallMode = LocationSearchEnum.custom;
      }
    }
    defaultSearchParam = apiCallMode;
  }

  String _getKey(
    String? searchParam, {
    num? offset,
    num? radius,
    String? language,
    String? types,
    bool? strictbounds,
    String? region,
    String? components,
    double? latitude,
    double? longitude,
  }) {
    var key = searchParam ?? '';
    if (offset != null) {
      key += offset.toString();
    }
    if (radius != null) {
      key += radius.toString();
    }
    if (language != null && language.length > 0) {
      key += language.trim();
    }
    if (types != null && types.length > 0) {
      key += types.trim();
    }

    if (strictbounds != null) {
      key += strictbounds.toString();
    }
    if (region != null && region.length > 0) {
      key += region.trim();
    }
    if (components != null && components.length > 0) {
      key += components.trim() ?? '';
    }
    if (latitude != null && longitude != null) {
      key += '-$latitude,$longitude';
    }
    return key;
  }

  Future<LocationAddressModel?> getPlacesDetails(
    String placeId, {
    LocationSearchEnum? locationEnum,
  }) async {
    LocationAddressModel? locationAddressModel;

    locationEnum ??= defaultSearchParam;

    switch (locationEnum) {
      case LocationSearchEnum.custom:
        locationAddressModel =
            await _customLocationRepository.getPlacesById(placeId);
        break;
      default:
        break;
    }
    return locationAddressModel;
  }

  @override
  Future<List<LocationAddressModel?>?> getCustomGeocode(
      String? searchParam, String domainName,
      {String language = 'en'}) async {
    if (searchParam != null && searchParam.length > 0) {
      var key = searchParam!.trim();
      if (language.length > 0) {
        key += language;
      }
      var result = await _locationPreferencesRepository
          .getRecentSearchedAddressesByName(key);
      if (!((result?.length ?? 0) > 0)) {
        result = await _customLocationRepository.getGeocode(
          searchParam,
          sessionToken: _getSessionToken(),
        );
        // ignore: unawaited_futures
        _recentSearchedDataUpdate(key, result);
      }
      return result;
    }
    return null;
  }

  @override
  Future<List<LocationAddressModel>?> getCustomRevGeocode(
      double? lat, double? lng, String domainName,
      {String language = 'en'}) async {
    if (lat != null && lng != null) {
      var key = '$lat,$lng';
      if (language.length > 0) {
        key += language;
      }
      var result = await _locationPreferencesRepository
          .getRecentSearchedAddressesByName(key);
      if (!((result?.length ?? 0) > 0)) {
        result = await _customLocationRepository.getReverseGeocode(
          lat,
          lng,
          sessionToken: _getSessionToken(),
        );
        // ignore: unawaited_futures
        _recentSearchedDataUpdate(key, result);
      }
      return result;
    }
    return null;
  }

  @override
  Future<List<LocationAddressModel>?> getAddressList(
    String? searchParam,
    String domainName, {
    String? sessionToken,
    num? offset,
    num? radius,
    String? language,
    String? types,
    bool? strictbounds,
    String? region,
    String? components, // eg: 'country:us|country:uk',
    double? latitude,
    double? longitude,
    LocationSearchEnum? locationEnum,
  }) async {
    List<LocationAddressModel>? result;

    locationEnum ??= defaultSearchParam;
    switch (locationEnum) {
      case LocationSearchEnum.geocoder:
        result = await _getGeocoderAddressList(searchParam);
        break;
      case LocationSearchEnum.custom:
        if (!sessionToken.isNullOrEmpty) {
          sessionToken = _getSessionTokenGenerateIfEmpty();
        }
        var lat, lng;
        lat = latitude;
        lng = longitude;
        if (lat == null || lng == null) {
          var locationData = await LocationServiceManager.getCurrentLocation(
              'getAddressList',
              needLatLngOnly: true);
          if (locationData != null) {
            lat = locationData.latitude;
            lng = locationData.longitude;
          }
        }
        var key = _getKey(
          searchParam,
          offset: offset,
          radius: radius,
          language: language,
          types: types,
          strictbounds: strictbounds ?? false,
          region: region,
          components: components,
          latitude: lat,
          longitude: lng,
        );
        result = await _locationPreferencesRepository
            .getRecentSearchedAddressesByName(key);
        if (!result.hasData()) {
          result = await _customLocationRepository.autocomplete(
            searchParam,
            language: language,
            latitude: lat,
            longitude: lng,
            offset: offset,
            radius: radius,
            types: types,
            strictbounds: strictbounds ?? false,
            region: region,
            components: components,
            sessionToken: sessionToken,
          );
          // ignore: unawaited_futures
          _recentSearchedDataUpdate(key, result);
        }
        LocationExtras.locationDeviceLog(
            domainName: domainName, message: 'Auto complete api');
        break;
    }
    return result;
  }

  // GeoCoder

  static Future<List<Location>?> _locateUserAddress(String address) async {
    try {
      var placeList =
          await locationFromAddress(address, localeIdentifier: 'en');
      return placeList;
    } on Exception catch (e) {
      print('error in location Address $e');
      return null;
    }
  }

  static Future<CustomPlacemark?> locateUserAddress(String address) async {
    if (!address.hasValidData()) {
      return null;
    }
    var placeList = await _locateUserAddress(address);
    if (placeList.hasData()) {
      var location = placeList!.first;
      var place =
          await locateUserUsingLatLng(location.latitude, location.longitude);
      return place;
    } else {
      return null;
    }
  }

  static Future<CustomPlacemark?> locateUserUsingLatLng(
      double latitude, double longitude) async {
    try {
      var placesList = await placemarkFromCoordinates(latitude, longitude,
          localeIdentifier: 'en');
      if (placesList.hasData()) {
        return CustomPlacemark.mapGeoPlacemark(
            placesList.first, latitude, longitude);
      } else {
        return null;
      }
    } on Exception catch (e) {
      print('error in location Address $e');
      return null;
    }
  }

  // GeoCoder

  Future<List<LocationAddressModel>> _getGeocoderAddressList(
      String? searchQuery) async {
    var placeList = await _locateGeocoderAddress(searchQuery);
    var result = <LocationAddressModel>[];
    if (placeList.hasData()) {
      for (var place in placeList!) {
        result.add(LocationAddressModel()
          ..locationName = place.locality
          ..locationAddress = place.subLocality
          ..locationFullAddress = place.addressLine
          ..latitude = place.coordinates.latitude
          ..longitude = place.coordinates.longitude
          ..country = place.countryName
          ..isoCountryCode = place.countryCode);
      }
    }
    return result;
  }

  static Future<Address?> locateGeocoderAddress(String address,
      {bool useGoogleApi = false}) async {
    if (!address.hasValidData()) {
      return null;
    }
    var placeList =
        await _locateGeocoderAddress(address, useGoogleApi: useGoogleApi);
    if (placeList.hasData()) {
      return placeList!.first;
    } else {
      return null;
    }
  }

  static Future<List<Address>?> _locateGeocoderAddress(String? address,
      {bool useGoogleApi = false}) async {
    var placesList = await _locationPreferencesRepository
        .getRecentSearchedAddressesGeocoder(address);
    if (placesList.hasData()) {
      return placesList;
    }
    try {
      var geocode = useGoogleApi && kgeocodeKey.hasValidData()
          ? Geocoder.google(kgeocodeKey, language: 'en')
          : Geocoder.local;
      placesList = await geocode.findAddressesFromQuery(address!);
      await _locationPreferencesRepository.saveRecentSearchedAddressesGeocoder(
          address, placesList);
      return placesList;
    } on Exception catch (e) {
      print('error in location Address $e');
      return null;
    }
  }

  static Future<Address?> locateGeocoderUsingLatLng(
      double? latitude, double? longitude,
      {bool useGoogleAPi = false}) async {
    var placesList = await _locationPreferencesRepository
        .getRecentSearchedLatLngGeocoder(latitude, longitude);
    if (placesList.hasData()) {
      return placesList![0];
    }
    try {
      final coordinates = Coordinates(latitude, longitude);
      var geocode = useGoogleAPi && kgeocodeKey.hasValidData()
          ? Geocoder.google(kgeocodeKey, language: 'en')
          : Geocoder.local;
      var p = await geocode.findAddressesFromCoordinates(coordinates);
      await _locationPreferencesRepository.saveRecentSearchedLatLngGeocoder(
          latitude, longitude, p);
      var place = p.hasData() ? p.first : null;
      return place;
    } on Exception catch (e) {
      print('error in location Address $e');
      return null;
    }
  }

  // Google

  Future<void> _recentSearchedDataUpdate(
      String key, List<LocationAddressModel>? result) async {
    if (result.hasData() && key.hasValidData()) {
      await _locationPreferencesRepository.saveRecentlySearchedAddress(
          key, result);
    }
  }

  @override
  Future<List<LocationAddressModel>> getRecentAddressList() async {
    return await _locationPreferencesRepository.getRecentAddressList();
  }

  @override
  Future<bool> saveRecentAddress(LocationAddressModel? model) async {
    return await _locationPreferencesRepository.saveRecentAddress(model);
  }

  @override
  Future<List<LocationAddressModel>> getSavedAddressList() async {
    return await _locationPreferencesRepository.getSavedAddressList();
  }

  @override
  Future<bool> saveAddress(LocationAddressModel model) async {
    return await _locationPreferencesRepository.saveAddress(model);
  }

  @override
  Future<bool> deleteListOfSavedAddress(List<int> indexList) async {
    return await _locationPreferencesRepository
        .deleteListOfSavedAddress(indexList);
  }

  @override
  Future<bool> deleteSavedAddress(int index) async {
    return await _locationPreferencesRepository.deleteSavedAddress(index);
  }

  @override
  Future<bool> editSavedAddress(
      int index, LocationAddressModel addressModel) async {
    return await _locationPreferencesRepository.editSavedAddress(
        index, addressModel);
  }

  // Only to be called when you don't have lat lng
  Future<LocationAddressModel> _fillLocation(
    LocationAddressModel locationAddressModel,
    String domainName, {
    bool forCaching = true,
    bool usePlaceId = false,
    bool useGoogleApi = false,
    bool preferLocationAddressFirst = false,
  }) async {
    var address = locationAddressModel.locationFullAddress!;
    if (!address.hasValidData()) {
      address = locationAddressModel.locationName!;
      if (address.hasValidData()) {
        address = address +
            (locationAddressModel.locationAddress!.hasValidData()
                ? ' ${locationAddressModel.locationAddress}'
                : '');
      } else {
        address = locationAddressModel.locationAddress!;
      }
    }
    preferLocationAddressFirst =
        preferLocationAddressFirst && address.hasValidData();

    // GeoCoder to be used in case geolocator fail
    // Rare scenario on specific devices
    Address? geoAddress;
    if (useGoogleApi) {
      if (locationAddressModel.latitude != null &&
          locationAddressModel.longitude != null &&
          !preferLocationAddressFirst) {
        geoAddress = await locateGeocoderUsingLatLng(
            locationAddressModel.latitude, locationAddressModel.longitude,
            useGoogleAPi: true);
      } else {
        geoAddress = await locateGeocoderAddress(address, useGoogleApi: true);
      }
      locationAddressModel.updateGeoAddress(geoAddress);
    }
    if (geoAddress != null) {
      locationAddressModel
        ..country = locationAddressModel.country ?? geoAddress.countryName
        ..isoCountryCode =
            locationAddressModel.isoCountryCode ?? geoAddress.countryCode
        ..latitude =
            locationAddressModel.latitude ?? geoAddress.coordinates.latitude
        ..longitude =
            locationAddressModel.longitude ?? geoAddress.coordinates.longitude;
    } else {
      if (defaultSearchParam == LocationSearchEnum.custom) {
        List<LocationAddressModel?>? customPlaceList;
        if (locationAddressModel.latitude != null &&
            locationAddressModel.longitude != null &&
            preferLocationAddressFirst) {
          customPlaceList = await getCustomRevGeocode(
              locationAddressModel.latitude,
              locationAddressModel.longitude,
              domainName);
        } else {
          customPlaceList = await getCustomGeocode(address, domainName);
        }
        if (customPlaceList != null && customPlaceList.hasData()) {
          locationAddressModel
            ..locationName = locationAddressModel.locationName ??
                customPlaceList[0]!.locationName
            ..locationAddress = locationAddressModel.locationAddress ??
                customPlaceList[0]!.locationAddress
            ..locationFullAddress = locationAddressModel.locationFullAddress ??
                customPlaceList[0]!.locationFullAddress
            ..latitude =
                locationAddressModel.latitude ?? customPlaceList[0]!.latitude
            ..longitude =
                locationAddressModel.longitude ?? customPlaceList[0]!.longitude
            ..placesId =
                locationAddressModel.placesId ?? customPlaceList[0]!.placesId;
          locationAddressModel.updateAddressComponents(
              customPlaceList[0]!.getAddressComponents());
          locationAddressModel
            ..country = locationAddressModel
                .getMappedAddressComponents()
                ?.country
                ?.longName
            ..isoCountryCode = locationAddressModel
                .getMappedAddressComponents()
                ?.country
                ?.shortName;
        }
      }

      CustomPlacemark? placemark;
      if (locationAddressModel.latitude != null &&
          locationAddressModel.longitude != null) {
        placemark = await locateUserUsingLatLng(
            locationAddressModel.latitude!, locationAddressModel.longitude!);
      } else {
        placemark = await locateUserAddress(address);
      }
      locationAddressModel.updateGeoPlacemark(placemark);
      if (placemark != null) {
        locationAddressModel
          ..country = (locationAddressModel.country.isNotNull() &&
                  locationAddressModel.country!.hasValidData())
              ? locationAddressModel.country
              : placemark.country
          ..isoCountryCode = (locationAddressModel.isoCountryCode.isNotNull() &&
                  locationAddressModel.isoCountryCode!.hasValidData())
              ? locationAddressModel.isoCountryCode
              : placemark.isoCountryCode
          ..latitude =
              locationAddressModel.latitude ?? placemark.position?.latitude
          ..longitude =
              locationAddressModel.longitude ?? placemark.position?.longitude;
      }
      if (locationAddressModel.latitude != null &&
          locationAddressModel.longitude != null) {
        geoAddress = await locateGeocoderUsingLatLng(
            locationAddressModel.latitude, locationAddressModel.longitude,
            useGoogleAPi: false);
      } else {
        geoAddress = await locateGeocoderAddress(address, useGoogleApi: false);
      }
      locationAddressModel.updateGeoAddress(geoAddress);
      if (geoAddress != null) {
        locationAddressModel
          ..country = (locationAddressModel.country.isNotNull() &&
                  locationAddressModel.country!.hasValidData())
              ? locationAddressModel.country
              : geoAddress.countryName
          ..isoCountryCode = (locationAddressModel.isoCountryCode.isNotNull() &&
                  locationAddressModel.isoCountryCode!.hasValidData())
              ? locationAddressModel.isoCountryCode
              : geoAddress.countryCode
          ..latitude =
              locationAddressModel.latitude ?? geoAddress.coordinates.latitude
          ..longitude = locationAddressModel.longitude ??
              geoAddress.coordinates.longitude;
      }
    }
    return locationAddressModel;
  }

  @override
  Future<LocationAddressModel?> validateLocation(
    LocationAddressModel? locationAddressModel,
    String domainName, {
    bool isExtraInfoNeeded = false,
    bool useGoogleApi = false,
    bool preferLocationAddressFirst = false,
  }) async {
    if (!isExtraInfoNeeded) {
      if (locationAddressModel != null) {
        locationAddressModel.locationName ??= '';
        locationAddressModel.locationAddress ??= '';
        locationAddressModel.locationFullAddress ??= '';
        var hasLocationName =
            (locationAddressModel.locationName ?? '').hasValidData() ||
                (locationAddressModel.locationAddress ?? '').hasValidData() ||
                (locationAddressModel.locationFullAddress ?? '').hasValidData();
        var hasLatLng = locationAddressModel.latitude != null &&
            locationAddressModel.longitude != null;
        if (hasLocationName && hasLatLng) {
          return locationAddressModel;
        } else if (hasLocationName || hasLatLng) {
          isExtraInfoNeeded = true;
        } else {
          LocationExtras.locationDeviceLog(
              domainName: domainName,
              message: 'Validate Location Skipped, api had basic data');
          return locationAddressModel;
        }
      }
    }

    if (locationAddressModel != null && isExtraInfoNeeded) {
      // Case where we have lat and lng, avoiding google api's here
      if (locationAddressModel.latitude != null &&
          locationAddressModel.longitude != null) {
        if (!((locationAddressModel.locationName ?? '').hasValidData()) ||
            !(locationAddressModel.country ?? '').hasValidData() ||
            !(locationAddressModel.isoCountryCode ?? '').hasValidData() ||
            !locationAddressModel.getAddressComponents().hasData()) {
          Address? address;
          if (useGoogleApi) {
            address = await locateGeocoderUsingLatLng(
                locationAddressModel.latitude, locationAddressModel.longitude,
                useGoogleAPi: true);
            locationAddressModel.updateGeoAddress(address);
          }
          if (address != null) {
            locationAddressModel
              ..locationName = locationAddressModel.locationName!.hasValidData()
                  ? locationAddressModel.locationName
                  : (address.locality!.hasValidData()
                      ? address.locality
                      : address.subLocality)
              ..latitude =
                  locationAddressModel.latitude ?? address.coordinates.latitude
              ..longitude = locationAddressModel.longitude ??
                  address.coordinates.longitude
              ..country = locationAddressModel.country!.hasValidData()
                  ? locationAddressModel.country
                  : address.countryName
              ..locationFullAddress =
                  locationAddressModel.locationFullAddress!.hasValidData()
                      ? locationAddressModel.locationFullAddress
                      : address.addressLine
              ..isoCountryCode =
                  locationAddressModel.isoCountryCode!.hasValidData()
                      ? locationAddressModel.isoCountryCode
                      : address.countryCode;
          } else {
            if (defaultSearchParam == LocationSearchEnum.custom) {
              List<LocationAddressModel?>? customPlaceList;
              var address = locationAddressModel.locationFullAddress ?? '';
              if (!address.hasValidData()) {
                address = locationAddressModel.locationName ?? '';
                if (address.hasValidData()) {
                  address = address +
                      ((locationAddressModel.locationAddress ?? '')
                              .hasValidData()
                          ? ' ${locationAddressModel.locationAddress}'
                          : '');
                } else {
                  address = (locationAddressModel.locationAddress ?? '');
                }
              }
              if (preferLocationAddressFirst && address.hasValidData()) {
                customPlaceList = await getCustomGeocode(address, domainName);
              }
              if (customPlaceList == null || !customPlaceList.hasData()) {
                customPlaceList = await getCustomRevGeocode(
                  locationAddressModel.latitude,
                  locationAddressModel.longitude,
                  domainName,
                );
              }
              if (customPlaceList != null && customPlaceList.hasData()) {
                locationAddressModel
                  ..locationName =
                      (locationAddressModel.locationName ?? '').hasValidData()
                          ? locationAddressModel.locationName
                          : customPlaceList[0]!.locationName
                  ..locationAddress =
                      (locationAddressModel.locationAddress ?? '')
                              .hasValidData()
                          ? locationAddressModel.locationAddress
                          : customPlaceList[0]!.locationAddress
                  ..locationFullAddress =
                      (locationAddressModel.locationFullAddress ?? '')
                              .hasValidData()
                          ? locationAddressModel.locationFullAddress
                          : customPlaceList[0]!.locationFullAddress
                  ..latitude = locationAddressModel.latitude ??
                      customPlaceList[0]!.latitude
                  ..longitude = locationAddressModel.longitude ??
                      customPlaceList[0]!.longitude
                  ..placesId = locationAddressModel.placesId ??
                      customPlaceList[0]!.placesId;
                locationAddressModel.updateAddressComponents(
                    customPlaceList[0]!.getAddressComponents());
              }
            }
            var place = await locateUserUsingLatLng(
                locationAddressModel.latitude!,
                locationAddressModel.longitude!);
            locationAddressModel.updateGeoPlacemark(place);
            if (place != null) {
              locationAddressModel
                ..locationName =
                    (locationAddressModel.locationName ?? '').hasValidData()
                        ? locationAddressModel.locationName
                        : (place.locality!.hasValidData()
                            ? place.locality
                            : place.subLocality)
                ..country = (locationAddressModel.country ?? '').hasValidData()
                    ? locationAddressModel.country
                    : place.country
                ..isoCountryCode =
                    (locationAddressModel.isoCountryCode ?? '').hasValidData()
                        ? locationAddressModel.isoCountryCode
                        : place.isoCountryCode;
            }
            address = await locateGeocoderUsingLatLng(
                locationAddressModel.latitude, locationAddressModel.longitude,
                useGoogleAPi: false);
            locationAddressModel.updateGeoAddress(address);
            if (address != null) {
              locationAddressModel
                ..locationName =
                    (locationAddressModel.locationName ?? '').hasValidData()
                        ? locationAddressModel.locationName
                        : (address.locality!.hasValidData()
                            ? address.locality
                            : address.subLocality)
                ..country = (locationAddressModel.country ?? '').hasValidData()
                    ? locationAddressModel.country
                    : address.countryName
                ..locationFullAddress =
                    (locationAddressModel.locationFullAddress ?? '')
                            .hasValidData()
                        ? locationAddressModel.locationFullAddress
                        : address.addressLine
                ..isoCountryCode =
                    (locationAddressModel.isoCountryCode ?? '').hasValidData()
                        ? locationAddressModel.isoCountryCode
                        : address.countryCode;
            }
          }
        }
      } else {
        locationAddressModel = await _fillLocation(
          locationAddressModel,
          domainName,
          forCaching: false,
          useGoogleApi: useGoogleApi,
          preferLocationAddressFirst: preferLocationAddressFirst,
        );
      }
      _clearSessionToken();
    }
    LocationExtras.locationDeviceLog(
        domainName: domainName, message: 'Validate Location was completed');
    return locationAddressModel;
  }

  @override
  Future<List<LocationAddressModel>> validateLocationList(
    List<LocationAddressModel> locationAddressModel,
    String domainName, {
    bool preferLocationAddressFirst = false,
  }) async {
    var updatedResult = <LocationAddressModel>[];
    if (locationAddressModel.hasData()) {
      LocationExtras.locationDeviceLog(
          domainName: domainName,
          message:
              'Multiple Validate location called: ${locationAddressModel.length}');
      for (var location in locationAddressModel) {
        var model = await validateLocation(location, domainName,
            preferLocationAddressFirst: preferLocationAddressFirst);
        if (model != null) {
          updatedResult.add(model);
        }
      }
    }
    return updatedResult;
  }

  @override
  Future<List<LocationAddressModel>?> getCity(
      String searchParam, String domainName) async {
    if (searchParam.hasValidData()) {
      return await _customLocationRepository.getCity(searchParam);
    }
    return [];
  }
}
