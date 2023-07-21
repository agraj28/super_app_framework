import 'package:json_annotation/json_annotation.dart';

part 'custom_places_geocode.g.dart';

@JsonSerializable()
class CustomPlacesGeocodeResponse {
  @JsonKey(name: 'html_attributions')
  List<dynamic>? htmlAttributions;

  @JsonKey(name: 'results')
  List<CustomAddressResult>? results;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'from_cache')
  bool? fromCache;

  CustomPlacesGeocodeResponse({
    this.htmlAttributions,
    this.results,
    this.status,
    this.fromCache,
  });

  factory CustomPlacesGeocodeResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$CustomPlacesGeocodeResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CustomPlacesGeocodeResponseToJson(this);

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

@JsonSerializable()
class CustomPlacesDetailResponse {
  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'result')
  CustomAddressResult? result;

  @JsonKey(name: 'from_cache')
  bool? fromCache;

  CustomPlacesDetailResponse({
    this.result,
    this.status,
    this.fromCache,
  });

  factory CustomPlacesDetailResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$CustomPlacesDetailResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CustomPlacesDetailResponseToJson(this);

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

@JsonSerializable()
class CustomAddressResult {
  @JsonKey(name: 'address_components')
  List<AddressComponents>? addressComponents;

  @JsonKey(name: 'adr_address')
  String? adrAddress;

  @JsonKey(name: 'formatted_address')
  String? formattedAddress;

  @JsonKey(name: 'geometry')
  Geometry? geometry;

  @JsonKey(name: 'icon')
  String? icon;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'place_id')
  String? placeId;

  @JsonKey(name: 'plus_code')
  PlusCode? plusCode;

  @JsonKey(name: 'reference')
  String? reference;

  @JsonKey(name: 'scope')
  String? scope;

  @JsonKey(name: 'types')
  List<String>? types;

  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'utc_offset')
  int? utcOffset;

  @JsonKey(name: 'vicinity')
  String? vicinity;

  CustomAddressResult(
    this.addressComponents,
    this.adrAddress,
    this.formattedAddress,
    this.geometry,
    this.icon,
    this.name,
    this.placeId,
    this.plusCode,
    this.reference,
    this.scope,
    this.types,
    this.url,
    this.utcOffset,
    this.vicinity,
  );

  factory CustomAddressResult.fromJson(Map<String, dynamic> srcJson) =>
      _$CustomAddressResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CustomAddressResultToJson(this);
}

@JsonSerializable()
class AddressComponents {
  @JsonKey(name: 'long_name')
  String? longName;

  @JsonKey(name: 'short_name')
  String? shortName;

  @JsonKey(name: 'types')
  List<String>? types;

  AddressComponents(
    this.longName,
    this.shortName,
    this.types,
  );

  factory AddressComponents.fromJson(Map<String, dynamic> srcJson) =>
      _$AddressComponentsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AddressComponentsToJson(this);
}

@JsonSerializable()
class Geometry {
  @JsonKey(name: 'location')
  Location? location;

  @JsonKey(name: 'viewport')
  Viewport? viewport;

  Geometry(
    this.location,
    this.viewport,
  );

  factory Geometry.fromJson(Map<String, dynamic> srcJson) =>
      _$GeometryFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GeometryToJson(this);
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

@JsonSerializable()
class Viewport {
  @JsonKey(name: 'northeast')
  Northeast? northeast;

  @JsonKey(name: 'southwest')
  Southwest? southwest;

  Viewport(
    this.northeast,
    this.southwest,
  );

  factory Viewport.fromJson(Map<String, dynamic> srcJson) =>
      _$ViewportFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ViewportToJson(this);
}

@JsonSerializable()
class Northeast {
  @JsonKey(name: 'lat')
  double? lat;

  @JsonKey(name: 'lng')
  double? lng;

  Northeast(
    this.lat,
    this.lng,
  );

  factory Northeast.fromJson(Map<String, dynamic> srcJson) =>
      _$NortheastFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NortheastToJson(this);
}

@JsonSerializable()
class Southwest {
  @JsonKey(name: 'lat')
  double? lat;

  @JsonKey(name: 'lng')
  double? lng;

  Southwest(
    this.lat,
    this.lng,
  );

  factory Southwest.fromJson(Map<String, dynamic> srcJson) =>
      _$SouthwestFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SouthwestToJson(this);
}

@JsonSerializable()
class PlusCode {
  @JsonKey(name: 'compound_code')
  String? compoundCode;

  @JsonKey(name: 'global_code')
  String? globalCode;

  PlusCode(
    this.compoundCode,
    this.globalCode,
  );

  factory PlusCode.fromJson(Map<String, dynamic> srcJson) =>
      _$PlusCodeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PlusCodeToJson(this);
}
