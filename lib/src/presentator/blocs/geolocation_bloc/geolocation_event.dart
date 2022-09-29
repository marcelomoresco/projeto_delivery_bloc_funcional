part of 'geolocation_bloc.dart';

abstract class GeolocationEvent extends Equatable {
  const GeolocationEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadGeolocationEvent extends GeolocationEvent {}

class UpdateGeolocationEvent extends GeolocationEvent {
  final Position position;
  const UpdateGeolocationEvent({required this.position});

  @override
  // TODO: implement props
  List<Object?> get props => [position];
}
