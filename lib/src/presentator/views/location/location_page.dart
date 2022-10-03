import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto_delivery_bloc/src/presentator/blocs/location_bloc/location_bloc.dart';

import '../../blocs/place_autocomplete/autocomplete_bloc.dart';
import '../components/location/custom_search_text.dart';

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
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LocationLoadedState) {
            return Stack(
              children: [
                GoogleMap(
                  myLocationEnabled: true,
                  buildingsEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    context.read<LocationBloc>().add(
                          LocationLoadMapEvent(controller: controller),
                        );
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      state.lat,
                      state.long,
                    ),
                    zoom: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          SizedBox(width: 10),
                          Expanded(child: CustomSearchLocation()),
                        ],
                      ),
                      const _SearchBoxSuggestions(),
                      const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          fixedSize: const Size(200, 40),
                        ),
                        child: const Text('Salvar'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Text('Something went wrong!');
          }
        },
      ),
    );
  }
}

class _SearchBoxSuggestions extends StatelessWidget {
  const _SearchBoxSuggestions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutocompleteBloc, AutocompleteState>(
      builder: (context, state) {
        if (state is AutocompleteLoadingState) {
          return const SizedBox();
        }
        if (state is AutocompleteLoadedState) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: state.placeAutoComplete.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.black.withOpacity(0.6),
                child: ListTile(
                  title: Text(
                    state.placeAutoComplete[index].description,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  ),
                  onTap: () {
                    context.read<LocationBloc>().add(
                          SearchLocation(
                            placeId: state.placeAutoComplete[index].placeId,
                          ),
                        );
                    context.read<AutocompleteBloc>().add(ClearAutocomplete());
                  },
                ),
              );
            },
          );
        } else {
          return const Text('Algo deu muito errado!');
        }
      },
    );
  }
}
