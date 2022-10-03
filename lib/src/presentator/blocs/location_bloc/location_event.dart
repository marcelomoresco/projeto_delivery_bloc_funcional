// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class LocationLoadMapEvent extends LocationEvent {
  final GoogleMapController? controller;
  const LocationLoadMapEvent({
    this.controller,
  });

  @override
  List<Object?> get props => [controller];
}

class SearchLocation extends LocationEvent {
  final String placeId;

  const SearchLocation({required this.placeId});

  @override
  List<Object?> get props => [placeId];
}
