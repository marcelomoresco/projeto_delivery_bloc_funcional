import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto_delivery_bloc/src/infra/repositories/geolocation/geolocation_repository.dart';
import 'package:projeto_delivery_bloc/src/infra/repositories/places/places_repository.dart';

import '../../../domain/entities/place_model.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final PlacesRepository _placesRepository;
  final GeolocationRepository _geolocationRepository;
  StreamSubscription? _placesSubscription;
  StreamSubscription? _geolocationSubscription;

  LocationBloc(
      {required PlacesRepository placesRepository,
      required GeolocationRepository geolocationRepository})
      : _placesRepository = placesRepository,
        _geolocationRepository = geolocationRepository,
        super(LocationLoadingState()) {
    on<LocationLoadMapEvent>(_onLoadMapEvent);
    on<SearchLocation>(_onSearchLocationEvent);
  }

  void _onLoadMapEvent(
    LocationLoadMapEvent event,
    Emitter<LocationState> emit,
  ) async {
    final Position position = await _geolocationRepository.getCurrentLocation();

    emit(LocationLoadedState(
      controller: event.controller,
      lat: position.latitude,
      long: position.longitude,
    ));
  }

  void _onSearchLocationEvent(
    SearchLocation event,
    Emitter<LocationState> emit,
  ) async {
    final state = this.state as LocationLoadedState;
    final Place place = await _placesRepository.getPlace(event.placeId);

    state.controller!.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(place.lat, place.long),
      ),
    );

    emit(LocationLoadedState(
        controller: state.controller, lat: place.lat, long: place.long));
  }

  @override
  Future<void> close() {
    _geolocationSubscription?.cancel();
    _placesSubscription?.cancel();
    return super.close();
  }
}
