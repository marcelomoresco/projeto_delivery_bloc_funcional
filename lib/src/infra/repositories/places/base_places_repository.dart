import 'package:geolocator/geolocator.dart';
import 'package:projeto_delivery_bloc/src/domain/entities/place_autocomplete_model.dart';

import '../../../domain/entities/place_model.dart';

abstract class IBasePlacesRepository {
  Future<List<PlaceAutoComplete>?> getAutoComplete(String searchInput) async {}

  Future<Place?> getPlace(String placeId) async {}
}
