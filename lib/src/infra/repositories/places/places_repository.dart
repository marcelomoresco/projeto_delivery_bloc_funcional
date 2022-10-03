import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto_delivery_bloc/src/infra/repositories/places/base_places_repository.dart';

import '../../../domain/entities/place_autocomplete_model.dart';
import '../../../domain/entities/place_model.dart';

class PlacesRepository extends IBasePlacesRepository {
  final String key = 'SUA CHAVE!!';
  final String types = 'geocode';

  @override
  Future<List<PlaceAutoComplete>> getAutoComplete(String searchInput) async {
    final String api_url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key';

    var response = await http.get(Uri.parse(api_url));
    var json = jsonDecode(response.body);
    var result = json["predictions"] as List;

    return result.map((place) => PlaceAutoComplete.fromJson(place)).toList();
  }

  @override
  Future<Place> getPlace(String placeId) async {
    final String api_url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';

    var response = await http.get(Uri.parse(api_url));
    var json = jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;

    return Place.fromJson(results);
  }
}
