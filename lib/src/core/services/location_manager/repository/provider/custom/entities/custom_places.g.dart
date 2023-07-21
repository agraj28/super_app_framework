// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_places.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomPlacesResponse _$CustomPlacesResponseFromJson(Map<String, dynamic> json) {
  return CustomPlacesResponse(
    predictions: (json['predictions'] as List<dynamic>?)
        ?.map((e) => Predictions.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] as String?,
    fromCache: json['from_cache'] as bool?,
  );
}

Map<String, dynamic> _$CustomPlacesResponseToJson(
        CustomPlacesResponse instance) =>
    <String, dynamic>{
      'predictions': instance.predictions,
      'status': instance.status,
      'from_cache': instance.fromCache,
    };

Predictions _$PredictionsFromJson(Map<String, dynamic> json) {
  return Predictions(
    json['title'] as String?,
    json['description'] as String?,
    json['place_id'] as String?,
    json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
    (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$PredictionsToJson(Predictions instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'place_id': instance.placeId,
      'location': instance.location?.toJson(),
      'types': instance.types,
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
