import 'package:json_annotation/json_annotation.dart';

part 'custom_places.g.dart';

@JsonSerializable()
class CustomPlacesResponse {
  @JsonKey(name: 'predictions')
  List<Predictions>? predictions;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'from_cache')
  bool? fromCache;

  CustomPlacesResponse({
    this.predictions,
    this.status,
    this.fromCache,
  });

  factory CustomPlacesResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$CustomPlacesResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CustomPlacesResponseToJson(this);

  static const okay = 'OK';
  static const zeroResults = 'ZERO_RESULTS';
  static const overQueryLimit = 'OVER_QUERY_LIMIT';
  static const requestDenied = 'REQUEST_DENIED';
  static const invalidRequest = 'INVALID_REQUEST';
  static const unknownErrorStatus = 'UNKNOWN_ERROR';
  static const notFound = 'NOT_FOUND';
  static const maxWaypointsExceeded = 'MAX_WAYPOINTS_EXCEEDED';
  static const maxRouteLengthExceeded = 'MAX_ROUTE_LENGTH_EXCEEDED';

  bool get isOkay => status == okay;

  bool get hasNoResults => status == zeroResults;

  bool get isOverQueryLimit => status == overQueryLimit;

  bool get isDenied => status == requestDenied;

  bool get isInvalid => status == invalidRequest;

  bool get unknownError => status == unknownErrorStatus;

  bool get isNotFound => status == notFound;
}

@JsonSerializable(explicitToJson: true)
class Predictions extends Object {
  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'place_id')
  String? placeId;

  @JsonKey(name: 'location')
  Location? location;

  @JsonKey(name: 'types')
  List<String>? types;

  Predictions(
    this.title,
    this.description,
    this.placeId,
    this.location,
    this.types,
  );

  factory Predictions.fromJson(Map<String, dynamic> srcJson) =>
      _$PredictionsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PredictionsToJson(this);
}

@JsonSerializable()
class Location {
  @JsonKey(name: 'lat')
  double? lat;

  @JsonKey(name: 'lng')
  double? lng;

  Location(
    this.lat,
    this.lng,
  );

  factory Location.fromJson(Map<String, dynamic> srcJson) =>
      _$LocationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
