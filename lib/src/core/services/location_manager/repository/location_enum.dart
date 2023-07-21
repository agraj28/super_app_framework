enum LocationSearchEnum { geocoder, custom }

extension LocationSearchEnumX on LocationSearchEnum {
  String getName() {
    switch (this) {
      case LocationSearchEnum.geocoder:
        return 'geocoder';
      case LocationSearchEnum.custom:
        return 'custom';
    }
  }
}
