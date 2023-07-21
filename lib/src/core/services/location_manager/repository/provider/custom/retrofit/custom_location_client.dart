import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:super_app_framework/src/core/services/location_manager/repository/provider/custom/entities/custom_places.dart';
import 'package:super_app_framework/src/core/services/location_manager/repository/provider/custom/entities/custom_places_geocode.dart';

import '../entities/custom_city_response.dart';

part 'custom_location_client.g.dart';

@RestApi()
abstract class CustomLocationClient {
  factory CustomLocationClient(Dio dio, {String? baseUrl}) =
      _CustomLocationClient;

  static const String apiKeyHeader = 'apiKey';

  static const _pathSearch = '/search';
  static const _pathGeocode = '/geocode';
  static const _pathRevGeocode = '/revgeocode';
  static const _pathDetails = '/details';
  static const _pathCity = '/city';

  static const String _keyPlaceId = 'place_id';
  static const String _keyAddress = 'address';
  static const String _keyInput = 'input';
  static const String _keyLanguage = 'language';
  static const String _location = 'location';
  static const String _keyRadius = 'radius';
  static const String _keyTypes = 'types';
  static const String _keyStrictBounds = 'strictbounds';
  static const String _keyOffset = 'offset';
  static const String _keyRegion = 'region';
  static const String _keyComponents = 'components';
  static const String _keySessionToken = 'sessionToken';

  @GET(_pathSearch)
  Future<CustomPlacesResponse> getAutoComplete(
    @Header(apiKeyHeader) String apiKey, {
    @Query(_keyInput) String? input,
    @Query(_location) String? location,
    @Query(_keyLanguage) String? language,
    @Query(_keyOffset) num? offset,
    @Query(_keyRadius) num? radius,
    @Query(_keyTypes) String? types,
    @Query(_keyStrictBounds) bool? strictbounds,
    @Query(_keyRegion) String? region,
    @Query(_keyComponents) String? components,
    @Query(_keySessionToken) String? sessionToken,
  });

  @GET(_pathGeocode)
  Future<CustomPlacesGeocodeResponse> getGeocode(
    @Header(apiKeyHeader) String apiKey, {
    @Query(_keyAddress) String? address,
    @Query(_keyLanguage) String? language,
    @Query(_keySessionToken) String? sessionToken,
  });

  @GET(_pathRevGeocode)
  Future<CustomPlacesGeocodeResponse> getRevGeocode(
    @Header(apiKeyHeader) String apiKey, {
    @Query(_location) String? location,
    @Query(_keyLanguage) String? language,
    @Query(_keySessionToken) String? sessionToken,
  });

  @GET(_pathDetails)
  Future<CustomPlacesDetailResponse> getPlaceById(
    @Header(apiKeyHeader) String apiKey,
    @Query(_keyPlaceId) String placeId, {
    @Query(_keyLanguage) String? language,
    @Query(_keySessionToken) String? sessionToken,
  });

  @GET(_pathCity)
  Future<CustomCityResponse> getCity(
    @Header(apiKeyHeader) String apiKey, {
    @Query(_keyInput) String? address,
  });
}
