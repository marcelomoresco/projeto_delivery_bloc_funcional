// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'autocomplete_bloc.dart';

abstract class AutocompleteEvent extends Equatable {
  const AutocompleteEvent();

  @override
  List<Object> get props => [];
}

class LoadAutoCompleteEvent extends AutocompleteEvent {
  final String searchInput;

  LoadAutoCompleteEvent({
    this.searchInput = '',
  });

  @override
  List<Object> get props => [searchInput];
}

class ClearAutocomplete extends AutocompleteEvent {}
