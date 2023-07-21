
import 'package:super_app_framework/src/core/services/location_manager/repository/model/location_credentials.dart';
import 'package:super_app_framework/src/core/services/location_manager/repository/provider/custom/entities/custom_places.dart';
import 'package:super_app_framework/super_app_framework.dart';
import '../../../model/location_model.dart';
import '../../location_api_service_manager.dart';
import '../entities/custom_city_response.dart';
import '../entities/custom_places_geocode.dart';
import '../mapper/custom_places_mapper.dart';
import '../retrofit/custom_location_client.dart';

class CustomLocationRepository {
  late CustomLocationClient _googleClient;
  LocationCredentials? _credentials;

  final String _apiFailKey = 'Something went wrong';

  CustomLocationRepository(LocationCredentials? locationCredentials) {
    final dio = LocationApiServiceManager.instance.getDioClient();
    LocationApiServiceManager.instance
        .getCacheInterceptorManager()
        .attachCacheInterceptor(dio,
            forceRefresh: false,
            maxAge: Duration(hours: 1),
            maxStale: Duration(days: 1));
    // baseUrl
    _googleClient = CustomLocationClient(dio,
        baseUrl: "");
    _credentials = locationCredentials;
  }

  Future<List<LocationAddressModel>?> autocomplete(
    String? input, {
    double? latitude,
    double? longitude,
    String? language = 'en',
    num? offset,
    num? radius,
    String? types,
    bool? strictbounds,
    String? region,
    String? components,
    String? sessionToken,
  }) async {
    CustomPlacesResponse response;
    var location = '';
    if (latitude != null && longitude != null) {
      location = '$latitude,$longitude';
    } else {
      location = '0,0';
    }
    try {
      response = await _googleClient.getAutoComplete(
        _credentials?.apiKey ?? _apiFailKey,
        input: input,
        language: language,
        location: location,
        offset: offset,
        radius: radius,
        types: types,
        strictbounds: strictbounds,
        region: region,
        components: components,
        sessionToken: sessionToken,
      );
      if (response.isOkay && response.predictions.hasData()) {
        return CustomPlaceMapper.mapCustomLocationModel(response);
      }
    } on Exception catch (err) {
      print("error $err");
    }
    return null;
  }

  Future<List<LocationAddressModel>?> getGeocode(
    String address, {
    String language = 'en',
    String? sessionToken,
  }) async {
    CustomPlacesGeocodeResponse response;
    try {
      response = await _googleClient.getGeocode(
        _credentials?.apiKey ?? _apiFailKey,
        address: address,
        language: language,
        sessionToken: sessionToken,
      );
      if (response.isOkay && response.results.hasData()) {
        return CustomPlaceMapper.mapCustomLocationGeocodeModel(response);
      }
    } on Exception catch (err) {
     print("exception $err");
    }
    return null;
  }

  Future<List<LocationAddressModel>?> getReverseGeocode(
    double? latitude,
    double? longitude, {
    String language = 'en',
    String? sessionToken,
  }) async {
    CustomPlacesGeocodeResponse response;
    var location = '';
    if (latitude != null && longitude != null) {
      location = '$latitude,$longitude';
    } else {
      return null;
    }
    try {
      response = await _googleClient.getRevGeocode(
        _credentials?.apiKey ?? _apiFailKey,
        language: language,
        location: location,
        sessionToken: sessionToken,
      );
      if (response.isOkay && response.results.hasData()) {
        return CustomPlaceMapper.mapCustomLocationGeocodeModel(response);
      }
    } on Exception catch (err) {
     print("exception $err");
    }
    return null;
  }

  Future<LocationAddressModel?> getPlacesById(
    String placeId, {
    String language = 'en',
    String? sessionToken,
  }) async {
    CustomPlacesDetailResponse response;
    try {
      response = await _googleClient.getPlaceById(
        _credentials?.apiKey ?? _apiFailKey,
        placeId,
        language: language,
        sessionToken: sessionToken,
      );
      if (response.isOkay && response.result != null) {
        return CustomPlaceMapper.mapCustomLocationDetailModel(response.result);
      }
    } on Exception catch (err) {
      print("exception $err");
    }
    return null;
  }

  Future<List<LocationAddressModel>?> getCity(String address) async {
    CustomCityResponse response;
    try {
      response = await _googleClient.getCity(
        _credentials?.apiKey ?? _apiFailKey,
        address: address,
      );
      if (response.results.hasData()) {
        return CustomPlaceMapper.mapCustomCityLocationModel(response);
      }
    } on Exception catch (err) {
      print("exception $err");
    }
    return null;
  }
}
