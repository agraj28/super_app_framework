// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_city_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomCityResponse _$CustomCityResponseFromJson(Map<String, dynamic> json) {
  return CustomCityResponse(
    json['status'] as String?,
    (json['results'] as List<dynamic>?)
        ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CustomCityResponseToJson(CustomCityResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results(
    json['name'] as String?,
    (json['latitude'] as num?)?.toDouble(),
    (json['longitude'] as num?)?.toDouble(),
    json['country'] as String?,
  );
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'country': instance.country,
    };
