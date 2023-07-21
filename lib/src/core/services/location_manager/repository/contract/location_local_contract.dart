import 'package:flutter_geocoder/geocoder.dart';

import '../../location_manager_public.dart';

abstract class LocationLocalContract {
  Future<List<Address>?> getRecentSearchedAddressesGeocoder(
      String? searchParam);

  Future<List<Address>?> getRecentSearchedLatLngGeocoder(
      double? latitude, double? longitude);

  Future<bool> saveRecentSearchedAddressesGeocoder(
      String? searchParam, List<Address> list);

  Future<bool> saveRecentSearchedLatLngGeocoder(
      double? latitude, double? longitude, List<Address> list);

  Future<List<LocationAddressModel>?> getRecentSearchedAddressesByName(
      String? searchParam);

  Future<bool> saveRecentlySearchedAddress(
      String key, List<LocationAddressModel?>? value);

  Future<List<LocationAddressModel>> getRecentAddressList();

  Future<bool> saveRecentAddress(LocationAddressModel? model);

  Future<List<LocationAddressModel>> getSavedAddressList();

  Future<bool> saveAddress(LocationAddressModel? model);

  Future<bool> deleteListOfSavedAddress(List<int> indexList);

  Future<bool> deleteSavedAddress(int index);

  Future<bool> editSavedAddress(int index, LocationAddressModel? addressModel);
}
