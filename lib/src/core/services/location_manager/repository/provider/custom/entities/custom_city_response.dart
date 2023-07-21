import 'package:json_annotation/json_annotation.dart';

part 'custom_city_response.g.dart';

@JsonSerializable()
class CustomCityResponse extends Object {
  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'results')
  List<Results>? results;

  CustomCityResponse(
    this.status,
    this.results,
  );

  factory CustomCityResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$CustomCityResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CustomCityResponseToJson(this);
}

@JsonSerializable()
class Results extends Object {
  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'latitude')
  double? latitude;

  @JsonKey(name: 'longitude')
  double? longitude;

  @JsonKey(name: 'country')
  String? country;

  Results(
    this.name,
    this.latitude,
    this.longitude,
    this.country,
  );

  factory Results.fromJson(Map<String, dynamic> srcJson) =>
      _$ResultsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
