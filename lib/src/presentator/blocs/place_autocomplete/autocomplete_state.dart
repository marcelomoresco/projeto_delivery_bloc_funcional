// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'autocomplete_bloc.dart';

abstract class AutocompleteState extends Equatable {
  const AutocompleteState();

  @override
  List<Object> get props => [];
}

class AutocompleteLoadingState extends AutocompleteState {}

class AutocompleteLoadedState extends AutocompleteState {
  final List<PlaceAutoComplete> placeAutoComplete;

  const AutocompleteLoadedState({
    required this.placeAutoComplete,
  });

  @override
  List<Object> get props => [placeAutoComplete];
}

class AutocompleteErrorState extends AutocompleteState {}
