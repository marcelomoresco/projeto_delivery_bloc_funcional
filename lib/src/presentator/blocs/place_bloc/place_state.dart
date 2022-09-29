// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'place_bloc.dart';

abstract class PlaceState extends Equatable {
  const PlaceState();

  @override
  List<Object> get props => [];
}

class PlaceLoadingState extends PlaceState {}

class PlaceLoadedState extends PlaceState {
  final Place place;

  const PlaceLoadedState({
    required this.place,
  });
  @override
  List<Object> get props => [place];
}

class PlaceErrorState extends PlaceState {}
