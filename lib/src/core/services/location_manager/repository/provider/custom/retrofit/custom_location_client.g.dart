// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_location_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CustomLocationClient implements CustomLocationClient {
  _CustomLocationClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CustomPlacesResponse> getAutoComplete(apiKey,
      {input,
      location,
      language,
      offset,
      radius,
      types,
      strictbounds,
      region,
      components,
      sessionToken}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'input': input,
      r'location': location,
      r'language': language,
      r'offset': offset,
      r'radius': radius,
      r'types': types,
      r'strictbounds': strictbounds,
      r'region': region,
      r'components': components,
      r'sessionToken': sessionToken
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CustomPlacesResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'apiKey': apiKey},
                extra: _extra)
            .compose(_dio.options, '/search',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CustomPlacesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CustomPlacesGeocodeResponse> getGeocode(apiKey,
      {address, language, sessionToken}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'address': address,
      r'language': language,
      r'sessionToken': sessionToken
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CustomPlacesGeocodeResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'apiKey': apiKey},
                extra: _extra)
            .compose(_dio.options, '/geocode',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CustomPlacesGeocodeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CustomPlacesGeocodeResponse> getRevGeocode(apiKey,
      {location, language, sessionToken}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'location': location,
      r'language': language,
      r'sessionToken': sessionToken
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CustomPlacesGeocodeResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'apiKey': apiKey},
                extra: _extra)
            .compose(_dio.options, '/revgeocode',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CustomPlacesGeocodeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CustomPlacesDetailResponse> getPlaceById(apiKey, placeId,
      {language, sessionToken}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'place_id': placeId,
      r'language': language,
      r'sessionToken': sessionToken
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CustomPlacesDetailResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'apiKey': apiKey},
                extra: _extra)
            .compose(_dio.options, '/details',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CustomPlacesDetailResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CustomCityResponse> getCity(apiKey, {address}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'input': address};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CustomCityResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'apiKey': apiKey},
                extra: _extra)
            .compose(_dio.options, '/city',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CustomCityResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
