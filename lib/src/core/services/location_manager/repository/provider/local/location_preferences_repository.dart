import 'package:flutter_geocoder/geocoder.dart';
import 'package:super_app_framework/src/data_provider/object_store_provider.dart';


import '../../../../../../helpers/extensions.dart';
import '../../../location_manager_public.dart';
import '../../contract/location_local_contract.dart';

class LocationPreferencesRepository implements LocationLocalContract {
  static String tableGeocode = 'TABLE_GEOCODER';
  static String keyLatLngGeocode = 'LAT_LNG_GEOCODE';
  static String keyAddressGeocode = 'ADDRESS_GEOCODE';

  static String tableLocation = 'TABLE_LOCATION';

  static String keySavedAddress = 'SAVED_ADDRESS';
  static String keyRecentAddress = 'RECENT_ADDRESS';
  static String keyRecentSearchedAddress = 'RECENT_SEARCHED_ADDRESS';

  static int maxRecentAddress = 15;

  LocationPreferencesRepository() {
    //TODO version handling for hive data
    //TODO work on cache handling
  }

  @override
  Future<List<Address>?> getRecentSearchedLatLngGeocoder(
      double? latitude, double? longitude) async {
    if (latitude != null && longitude != null) {
      return null;
    }
    var searchParam = latitude.toString() + longitude.toString();
    var map = await _getRecentSearchedGeocode(keyLatLngGeocode);
    if (map != null && map.isNotEmpty && map.containsKey(searchParam)) {
      var list = map[searchParam];
      var addressList = <Address>[];
      for (var address in list) {
        var model = Address.fromMap(address);
        addressList.add(model);
      }
      return addressList;
    } else {
      return null;
    }
  }

  @override
  Future<List<Address>?> getRecentSearchedAddressesGeocoder(
      String? searchParam) async {
    if (!(searchParam == null && searchParam!.hasValidData())) {
      return null;
    }
    var map = await _getRecentSearchedGeocode(keyAddressGeocode);

    if (map != null && map.isNotEmpty && map.containsKey(searchParam)) {
      var list = map[searchParam];
      var addressList = <Address>[];
      for (var address in list) {
        var model = Address.fromMap(address);
        addressList.add(model);
      }
      return addressList;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> _getRecentSearchedGeocode(
      String tableKey) async {
    var response =
        await ObjectStoreProvider().getInstance().readObjects(tableGeocode);

    if (response.isEmpty) return null;

    var map = <String, dynamic>{};
    for (var singleResponse in response) {
      for (var key in singleResponse.keys) {
        if (key!.toUpperCase() == tableKey &&
            singleResponse.values.isNotEmpty) {
          map = Map<String, dynamic>.from(singleResponse[tableKey]);
        }
      }
    }
    return map;
  }

  @override
  Future<bool> saveRecentSearchedAddressesGeocoder(
      String? searchParam, List<Address> list) async {
    return await _saveRecentlySearchedGeocoder(
        keyAddressGeocode, searchParam, list);
  }

  @override
  Future<bool> saveRecentSearchedLatLngGeocoder(
      double? latitude, double? longitude, List<Address> list) async {
    if (latitude != null && longitude != null) {
      return false;
    }
    var searchParam = latitude.toString() + longitude.toString();
    return await _saveRecentlySearchedGeocoder(
        keyLatLngGeocode, searchParam, list);
  }

  Future<bool> _saveRecentlySearchedGeocoder(
      String tableKey, String? key, List<Address>? value) async {
    if (value == null || value.isEmpty || !key!.hasValidData()) {
      return false;
    }

    var addressList = <dynamic>[];
    for (var address in value) {
      addressList.add(address.toMap());
    }

    var map = await _getRecentSearchedGeocode(tableKey);
    map ??= {};
    map.addAll({key: addressList});

    await ObjectStoreProvider()
        .getInstance()
        .updateObjects(tableGeocode, {tableKey: map});
    return true;
  }

  Future<Map<String, dynamic>?> _getRecentSearchedAddresses() async {
    var response =
        await ObjectStoreProvider().getInstance().readObjects(tableLocation);

    if (response.isEmpty) return null;

    var map = <String, dynamic>{};
    for (var singleResponse in response) {
      for (var key in singleResponse.keys) {
        if (key!.toUpperCase() == keyLatLngGeocode &&
            singleResponse.values.isNotEmpty) {
          map = Map<String, dynamic>.from(singleResponse[keyLatLngGeocode]);
        }
      }
    }
    return map;
  }

  List<LocationAddressModel> _jsonToModel(List<dynamic>? list) {
    var result = <LocationAddressModel>[];
    if (list != null && list.isNotEmpty) {
      for (dynamic item in list) {
        if (item != null) {
          result.add(LocationAddressModel.fromJsonOld(item));
        }
      }
    }
    return result;
  }

  List<dynamic> _modelToJson(List<LocationAddressModel?>? list) {
    var result = <dynamic>[];
    if (list != null && list.isNotEmpty) {
      for (var item in list) {
        if (item != null) {
          result.add(item.toJson());
        }
      }
    }
    return result;
  }

  @override
  Future<List<LocationAddressModel>?> getRecentSearchedAddressesByName(
      String? searchParam) async {
    if (!(searchParam != null && searchParam.hasValidData())) {
      return null;
    }
    var map = await _getRecentSearchedAddresses();
    if (map != null && map.isNotEmpty && map.containsKey(searchParam)) {
      return _jsonToModel(map[searchParam]);
    } else {
      return null;
    }
  }

  @override
  Future<bool> saveRecentlySearchedAddress(
      String key, List<LocationAddressModel?>? value) async {
    if (value == null || value.isEmpty || !key.hasValidData()) {
      return false;
    }

    var recentAddress = <String, dynamic>{
      key.trim().toLowerCase(): _modelToJson(value)
    };

    var map = await _getRecentSearchedAddresses();
    map ??= {};
    map.addAll(recentAddress);

    await ObjectStoreProvider()
        .getInstance()
        .updateObjects(tableLocation, {keyRecentSearchedAddress: map});
    return true;
  }

  @override
  Future<List<LocationAddressModel>> getRecentAddressList() async {
    var list = await _getRecentAddressList();
    var result = <LocationAddressModel>[];
    if (list != null && list.isNotEmpty) {
      for (dynamic item in list) {
        if (item != null) {
          result.add(LocationAddressModel.fromJsonOld(item));
        }
      }
    }
    return result;
  }

  Future<List<dynamic>?> _getRecentAddressList() async {
    var response =
        await ObjectStoreProvider().getInstance().readObjects(tableLocation);

    if (response.isEmpty) return null;

    List<dynamic>? list = <dynamic>[];
    for (var singleResponse in response) {
      for (var key in singleResponse.keys) {
        if (key!.toUpperCase() == keyRecentAddress &&
            singleResponse.values.isNotEmpty) {
          list = singleResponse[keyRecentAddress];
        }
      }
    }
    return list;
  }

  @override
  Future<bool> saveRecentAddress(LocationAddressModel? model) async {
    if (model == null) {
      return false;
    }

    dynamic recentAddress = model.toJson();

    var list = await _getRecentAddressList();
    list ??= [];
    if (list.isNotEmpty) {
      list.removeWhere((element) {
        var oldModel = LocationAddressModel.fromJsonOld(element);
        return (oldModel.locationName == model.locationName ||
            (oldModel.latitude == model.latitude &&
                oldModel.longitude == model.longitude));
      });
    }

    if (list.isEmpty) {
      list.add(recentAddress);
    } else if (list.length < maxRecentAddress) {
      list = list.reversed.toList();
      list.add(recentAddress);
      list = list.reversed.toList();
    } else {
      list = list.reversed.toList();
      list.add(recentAddress);
      list = list.reversed.toList();
      list = list.sublist(0, maxRecentAddress);
    }

    await ObjectStoreProvider()
        .getInstance()
        .updateObjects(tableLocation, {keyRecentAddress: list});
    return true;
  }

  @override
  Future<List<LocationAddressModel>> getSavedAddressList() async {
    var list = await _getSavedAddressList();
    var result = <LocationAddressModel>[];
    if (list != null && list.isNotEmpty) {
      for (dynamic item in list) {
        if (item != null) {
          result.add(LocationAddressModel.fromJsonOld(item));
        }
      }
    }
    return result;
  }

  Future<List<dynamic>?> _getSavedAddressList() async {
    var response =
        await ObjectStoreProvider().getInstance().readObjects(tableLocation);

    if (response.isEmpty) return null;

    List<dynamic>? list = <dynamic>[];
    for (var singleResponse in response) {
      for (var key in singleResponse.keys) {
        if (key!.toUpperCase() == keySavedAddress &&
            singleResponse.values.isNotEmpty) {
          list = singleResponse[keySavedAddress];
        }
      }
    }
    return list;
  }

  @override
  Future<bool> saveAddress(LocationAddressModel? model) async {
    if (model == null) {
      return false;
    }

    dynamic savedAddressModel = model.toJson();

    var list = await _getSavedAddressList();
    list ??= [];

    list.add(savedAddressModel);

    await ObjectStoreProvider()
        .getInstance()
        .updateObjects(tableLocation, {keySavedAddress: list});
    return true;
  }

  @override
  Future<bool> deleteListOfSavedAddress(List<int> indexList) async {
    var list = await _getSavedAddressList();
    if (list != null && list.isNotEmpty) {
      var newList = <dynamic>[];
      for (var i = 0; i < list.length; i++) {
        if (!indexList.contains(i)) {
          newList.add(list[i]);
        }
      }
      if (newList.isNotEmpty) {
        await ObjectStoreProvider()
            .getInstance()
            .updateObjects(tableLocation, {keySavedAddress: newList});
      } else {
        await ObjectStoreProvider()
            .getInstance()
            .deleteObjects(tableLocation, keys: [keySavedAddress]);
      }
    }

    return true;
  }

  @override
  Future<bool> deleteSavedAddress(int index) async {
    var list = await _getSavedAddressList();
    if (list != null && list.isNotEmpty) {
      if (list.length == 1) {
        if (index > 0) {
          return false;
        } else {
          await ObjectStoreProvider()
              .getInstance()
              .deleteObjects(tableLocation, keys: [keySavedAddress]);
        }
      } else {
        if (list.length - 1 < index) {
          return false;
        }
        list.removeAt(index);
        await ObjectStoreProvider()
            .getInstance()
            .updateObjects(tableLocation, {keySavedAddress: list});
      }
    }
    return true;
  }

  @override
  Future<bool> editSavedAddress(
      int index, LocationAddressModel? addressModel) async {
    var list = await _getSavedAddressList();
    if (list != null && list.isNotEmpty) {
      if (index > list.length - 1 || addressModel == null) {
        return false;
      } else {
        list[index] = addressModel.toJson();
        await ObjectStoreProvider()
            .getInstance()
            .updateObjects(tableLocation, {keySavedAddress: list});
        return true;
      }
    }
    return false;
  }
}
