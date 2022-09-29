import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projeto_delivery_bloc/src/infra/repositories/places/places_repository.dart';

import '../../../domain/entities/place_model.dart';

part 'place_event.dart';
part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final PlacesRepository _placesRepository;
  StreamSubscription? _placesSubscription;

  PlaceBloc({required PlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(PlaceLoadingState()) {
    on<LoadPlaceEvent>(_onLoadPlace);
  }

  void _onLoadPlace(LoadPlaceEvent event, Emitter<PlaceState> emit) async {
    emit(PlaceLoadingState());
    try {
      _placesSubscription?.cancel();

      final Place place = await _placesRepository.getPlace(event.placeId);
      emit(PlaceLoadedState(place: place));
    } catch (e) {
      emit(PlaceErrorState());
    }
  }

  @override
  Future<void> close() {
    _placesSubscription?.cancel();
    return super.close();
  }
}
