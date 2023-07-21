// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationAddressModel _$LocationAddressModelFromJson(Map<String, dynamic> json) {
  return LocationAddressModel(
    savedName: json['savedName'] as String?,
    locationName: json['locationName'] as String?,
    locationAddress: json['locationAddress'] as String?,
    locationFullAddress: json['locationFullAddress'] as String?,
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    notes: json['notes'] as String?,
    placesId: json['placesId'] as String?,
    types: (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    isoCountryCode: json['isoCountryCode'] as String?,
    country: json['country'] as String?,
    carrefourAreaCode: json['carrefourAreaCode'] as String?,
  );
}

Map<String, dynamic> _$LocationAddressModelToJson(
        LocationAddressModel instance) =>
    <String, dynamic>{
      'savedName': instance.savedName,
      'locationName': instance.locationName,
      'locationAddress': instance.locationAddress,
      'locationFullAddress': instance.locationFullAddress,
      'notes': instance.notes,
      'placesId': instance.placesId,
      'types': instance.types,
      'isoCountryCode': instance.isoCountryCode,
      'country': instance.country,
      'carrefourAreaCode': instance.carrefourAreaCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

LocationAddressComponents _$LocationAddressComponentsFromJson(
    Map<String, dynamic> json) {
  return LocationAddressComponents(
    longName: json['longName'] as String?,
    shortName: json['shortName'] as String?,
    type: (json['type'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$LocationAddressComponentsToJson(
        LocationAddressComponents instance) =>
    <String, dynamic>{
      'longName': instance.longName,
      'shortName': instance.shortName,
      'type': instance.type,
    };
