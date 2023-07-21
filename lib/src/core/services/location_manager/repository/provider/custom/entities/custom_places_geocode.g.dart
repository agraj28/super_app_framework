// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_places_geocode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomPlacesGeocodeResponse _$CustomPlacesGeocodeResponseFromJson(
    Map<String, dynamic> json) {
  return CustomPlacesGeocodeResponse(
    htmlAttributions: json['html_attributions'] as List<dynamic>?,
    results: (json['results'] as List<dynamic>?)
        ?.map((e) => CustomAddressResult.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] as String?,
    fromCache: json['from_cache'] as bool?,
  );
}

Map<String, dynamic> _$CustomPlacesGeocodeResponseToJson(
        CustomPlacesGeocodeResponse instance) =>
    <String, dynamic>{
      'html_attributions': instance.htmlAttributions,
      'results': instance.results,
      'status': instance.status,
      'from_cache': instance.fromCache,
    };

CustomPlacesDetailResponse _$CustomPlacesDetailResponseFromJson(
    Map<String, dynamic> json) {
  return CustomPlacesDetailResponse(
    result: json['result'] == null
        ? null
        : CustomAddressResult.fromJson(json['result'] as Map<String, dynamic>),
    status: json['status'] as String?,
    fromCache: json['from_cache'] as bool?,
  );
}

Map<String, dynamic> _$CustomPlacesDetailResponseToJson(
        CustomPlacesDetailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
      'from_cache': instance.fromCache,
    };

CustomAddressResult _$CustomAddressResultFromJson(Map<String, dynamic> json) {
  return CustomAddressResult(
    (json['address_components'] as List<dynamic>?)
        ?.map((e) => AddressComponents.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['adr_address'] as String?,
    json['formatted_address'] as String?,
    json['geometry'] == null
        ? null
        : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
    json['icon'] as String?,
    json['name'] as String?,
    json['place_id'] as String?,
    json['plus_code'] == null
        ? null
        : PlusCode.fromJson(json['plus_code'] as Map<String, dynamic>),
    json['reference'] as String?,
    json['scope'] as String?,
    (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    json['url'] as String?,
    json['utc_offset'] as int?,
    json['vicinity'] as String?,
  );
}

Map<String, dynamic> _$CustomAddressResultToJson(
        CustomAddressResult instance) =>
    <String, dynamic>{
      'address_components': instance.addressComponents,
      'adr_address': instance.adrAddress,
      'formatted_address': instance.formattedAddress,
      'geometry': instance.geometry,
      'icon': instance.icon,
      'name': instance.name,
      'place_id': instance.placeId,
      'plus_code': instance.plusCode,
      'reference': instance.reference,
      'scope': instance.scope,
      'types': instance.types,
      'url': instance.url,
      'utc_offset': instance.utcOffset,
      'vicinity': instance.vicinity,
    };

AddressComponents _$AddressComponentsFromJson(Map<String, dynamic> json) {
  return AddressComponents(
    json['long_name'] as String?,
    json['short_name'] as String?,
    (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$AddressComponentsToJson(AddressComponents instance) =>
    <String, dynamic>{
      'long_name': instance.longName,
      'short_name': instance.shortName,
      'types': instance.types,
    };

Geometry _$GeometryFromJson(Map<String, dynamic> json) {
  return Geometry(
    json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    json['viewport'] == null
        ? null
        : Viewport.fromJson(json['viewport'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GeometryToJson(Geometry instance) => <String, dynamic>{
      'location': instance.location,
      'viewport': instance.viewport,
    };

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    (json['lat'] as num?)?.toDouble(),
    (json['lng'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Viewport _$ViewportFromJson(Map<String, dynamic> json) {
  return Viewport(
    json['northeast'] == null
        ? null
        : Northeast.fromJson(json['northeast'] as Map<String, dynamic>),
    json['southwest'] == null
        ? null
        : Southwest.fromJson(json['southwest'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ViewportToJson(Viewport instance) => <String, dynamic>{
      'northeast': instance.northeast,
      'southwest': instance.southwest,
    };

Northeast _$NortheastFromJson(Map<String, dynamic> json) {
  return Northeast(
    (json['lat'] as num?)?.toDouble(),
    (json['lng'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$NortheastToJson(Northeast instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Southwest _$SouthwestFromJson(Map<String, dynamic> json) {
  return Southwest(
    (json['lat'] as num?)?.toDouble(),
    (json['lng'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$SouthwestToJson(Southwest instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

PlusCode _$PlusCodeFromJson(Map<String, dynamic> json) {
  return PlusCode(
    json['compound_code'] as String?,
    json['global_code'] as String?,
  );
}

Map<String, dynamic> _$PlusCodeToJson(PlusCode instance) => <String, dynamic>{
      'compound_code': instance.compoundCode,
      'global_code': instance.globalCode,
    };
