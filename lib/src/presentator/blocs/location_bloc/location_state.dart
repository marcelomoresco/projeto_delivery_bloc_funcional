part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class LocationLoadingState extends LocationState {}

class LocationLoadedState extends LocationState {
  final GoogleMapController? controller;
  final double lat;
  final double long;

  LocationLoadedState({
    this.controller,
    required this.lat,
    required this.long,
  });

  @override
  List<Object?> get props => [controller, lat, long];
}
