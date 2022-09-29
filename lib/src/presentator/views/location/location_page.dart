import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../blocs/geolocation_bloc/geolocation_bloc.dart';
import '../../blocs/place_autocomplete/autocomplete_bloc.dart';
import '../../blocs/place_bloc/place_bloc.dart';
import '../components/custom_search_text.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const LocationPage(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<PlaceBloc, PlaceState>(
      builder: (context, state) {
        if (state is PlaceLoadingState) {
          return Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: BlocBuilder<GeolocationBloc, GeolocationState>(
                  builder: (context, state) {
                    if (state is GeolocationLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GeolocationLoadedState) {
                      return GoogleMap(
                        myLocationEnabled: true,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(state.position.latitude,
                              state.position.longitude),
                          zoom: 5,
                        ),
                      );
                    } else {
                      return const Text("Algo deu errado.........");
                    }
                  },
                ),
              ),
              SaveButtonWidget(),
              Location(),
            ],
          );
        } else if (state is PlaceLoadedState) {
          return Stack(
            children: [
              GoogleMap(
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(state.place.lat, state.place.long),
                ),
              ),
              const SaveButtonWidget(),
              const Location(),
            ],
          );
        } else {
          return const Center(
            child: Text("Erro ao carregar a página!"),
          );
        }
      },
    ));
  }
}

class Location extends StatelessWidget {
  const Location({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      left: 20,
      right: 20,
      child: Column(
        children: [
          const CustomSearchLocation(),
          BlocBuilder<AutocompleteBloc, AutocompleteState>(
            builder: (context, state) {
              if (state is AutocompleteLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is AutocompleteLoadedState) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: state.placeAutoComplete.isNotEmpty
                        ? Colors.white
                        : Colors.transparent,
                  ),
                  child: ListView.builder(
                    itemCount: state.placeAutoComplete.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          state.placeAutoComplete[index].description,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        onTap: () {
                          context.read<PlaceBloc>().add(LoadPlaceEvent(
                              placeId: state.placeAutoComplete[index].placeId));
                        },
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text("Algo está bem errado......."),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      left: 20,
      right: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
          onPressed: () {},
          child: const Text("Salvar"),
        ),
      ),
    );
  }
}
