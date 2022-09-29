import 'package:geolocator/geolocator.dart';

abstract class IBaseGeolocationRepository {
  Future<Position?> getCurrentLocation() async {}
}
