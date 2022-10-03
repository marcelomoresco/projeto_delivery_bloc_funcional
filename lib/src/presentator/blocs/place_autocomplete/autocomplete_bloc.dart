// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:projeto_delivery_bloc/src/domain/entities/place_autocomplete_model.dart';
import 'package:projeto_delivery_bloc/src/infra/repositories/places/places_repository.dart';

part 'autocomplete_event.dart';
part 'autocomplete_state.dart';

class AutocompleteBloc extends Bloc<AutocompleteEvent, AutocompleteState> {
  final PlacesRepository _placesRepository;
  StreamSubscription? _placeSubscription;

  AutocompleteBloc({required PlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(AutocompleteLoadingState()) {
    on<LoadAutoCompleteEvent>(_onLoadAutoComplete);
    on<ClearAutocomplete>(_onClearAutocomplete);
  }

  void _onLoadAutoComplete(
      LoadAutoCompleteEvent event, Emitter<AutocompleteState> emit) async {
    _placeSubscription?.cancel();

    final List<PlaceAutoComplete> autocomplete =
        await _placesRepository.getAutoComplete(event.searchInput);

    emit(AutocompleteLoadedState(placeAutoComplete: autocomplete));
  }

  void _onClearAutocomplete(
    ClearAutocomplete event,
    Emitter<AutocompleteState> emit,
  ) async {
    emit(AutocompleteLoadedState(placeAutoComplete: List.empty()));
  }

  @override
  Future<void> close() async {
    _placeSubscription?.cancel();
    super.close();
  }
}
