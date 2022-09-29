import 'package:geolocator/geolocator.dart';

import 'base_geolocation_repository.dart';

class GeolocationRepository extends IBaseGeolocationRepository {
  GeolocationRepository();
  @override
  Future<Position?> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
