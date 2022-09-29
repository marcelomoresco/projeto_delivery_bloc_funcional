import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:projeto_delivery_bloc/src/infra/repositories/geolocation/geolocation_repository.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository _geolocationRepository;
  StreamSubscription? _geolocationSubscription;
  GeolocationBloc({required GeolocationRepository geolocationRepository})
      : _geolocationRepository = geolocationRepository,
        super(GeolocationLoadingState()) {
    on<LoadGeolocationEvent>(_onLoadLocation);
    on<UpdateGeolocationEvent>(_onUpdateLocation);
  }

  void _onLoadLocation(
      LoadGeolocationEvent event, Emitter<GeolocationState> emit) async {
    _geolocationSubscription?.cancel();
    final Position? position =
        await _geolocationRepository.getCurrentLocation();

    add(UpdateGeolocationEvent(position: position!));
  }

  void _onUpdateLocation(
      UpdateGeolocationEvent event, Emitter<GeolocationState> emit) async {
    emit(GeolocationLoadedState(position: event.position));
  }

  @override
  Future<void> close() {
    _geolocationSubscription?.cancel();
    return super.close();
  }
}
