
import '../../../../location_manager_public.dart';
import '../entities/custom_city_response.dart';
import '../entities/custom_places.dart';
import '../entities/custom_places_geocode.dart';

class CustomPlaceMapper {
  CustomPlaceMapper._();

  static List<LocationAddressModel> mapCustomCityLocationModel(
      CustomCityResponse response) {
    var list = <LocationAddressModel>[];
    if (response.results != null && response.results!.length > 0) {
      for (var prediction in response.results!) {
        var locationAddress = prediction.name;
        if (prediction.country!.length > 0) {
          locationAddress = '${prediction.name}, ${prediction.country}';
        }
        list.add(LocationAddressModel()
          ..locationName = prediction.name
          ..locationAddress = prediction.country
          ..locationFullAddress = locationAddress
          ..latitude = prediction.latitude
          ..longitude = prediction.longitude
          ..country = prediction.country);
      }
    }
    return list;
  }

  static List<LocationAddressModel> mapCustomLocationModel(
      CustomPlacesResponse response) {
    var list = <LocationAddressModel>[];
    if ((response.predictions?.length ?? 0) > 0) {
      for (var prediction in response.predictions!) {
        list.add(LocationAddressModel()
          ..locationName = prediction.title
          ..locationAddress = prediction.description
          ..locationFullAddress = prediction.description
          ..latitude = prediction.location?.lat
          ..longitude = prediction.location?.lng
          ..types = prediction.types
          ..placesId = prediction.placeId);
      }
    }
    return list;
  }

  static List<LocationAddressModel> mapCustomLocationGeocodeModel(
      CustomPlacesGeocodeResponse response) {
    var list = <LocationAddressModel>[];
    if ((response.results?.length ?? 0) > 0) {
      for (var location in response.results!) {
        var model = mapCustomLocationDetailModel(location);
        if (model != null) {
          list.add(model);
        }
      }
    }
    return list;
  }

  static LocationAddressModel? mapCustomLocationDetailModel(
      CustomAddressResult? response) {
    LocationAddressModel? locationAddressModel;
    if (response != null) {
      locationAddressModel = LocationAddressModel()
        ..locationAddress = response.formattedAddress
        ..locationFullAddress = response.formattedAddress
        ..latitude = response.geometry?.location?.lat
        ..longitude = response.geometry?.location?.lng
        ..types = response.types
        ..placesId = response.placeId;
      if (response.addressComponents != null &&
          response.addressComponents!.length > 0) {
        var addressComponentsList = <LocationAddressComponents>[];
        for (var data in response.addressComponents!) {
          addressComponentsList.add(LocationAddressComponents()
            ..longName = data.longName
            ..shortName = data.shortName
            ..type = data.types);
        }
        locationAddressModel.updateAddressComponents(addressComponentsList);
      }
      if ((locationAddressModel.locationName == null ||
              !(locationAddressModel.locationName!.length > 0)) &&
          locationAddressModel.getAddressComponents() != null &&
          locationAddressModel.getAddressComponents()!.length > 0) {
        locationAddressModel.locationName = locationAddressModel
                .getMappedAddressComponents()!
                .locality
                ?.longName ??
            locationAddressModel
                .getMappedAddressComponents()!
                .postalTown
                ?.longName ??
            locationAddressModel
                .getMappedAddressComponents()!
                .adminAreaLvl2
                ?.longName ??
            locationAddressModel
                .getMappedAddressComponents()!
                .adminAreaLvl1
                ?.longName ??
            locationAddressModel
                .getMappedAddressComponents()!
                .country
                ?.longName;

        if (response.addressComponents != null &&
            response.addressComponents!.isNotEmpty) {
          locationAddressModel.locationName ??=
              response.addressComponents![0].longName;
        }
      }
    }
    return locationAddressModel;
  }
}
