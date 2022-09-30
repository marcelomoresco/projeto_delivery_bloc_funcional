import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_delivery_bloc/src/infra/repositories/geolocation/geolocation_repository.dart';
import 'package:projeto_delivery_bloc/src/infra/repositories/places/places_repository.dart';
import 'package:projeto_delivery_bloc/src/presentator/blocs/filter_bloc/filters_bloc.dart';
import 'package:projeto_delivery_bloc/src/presentator/blocs/geolocation_bloc/geolocation_bloc.dart';
import 'package:projeto_delivery_bloc/src/presentator/blocs/place_autocomplete/autocomplete_bloc.dart';
import 'package:projeto_delivery_bloc/src/presentator/blocs/place_bloc/place_bloc.dart';
import 'package:projeto_delivery_bloc/src/presentator/config/routes/app_router.dart';
import 'package:projeto_delivery_bloc/src/presentator/views/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
            create: (_) => GeolocationRepository()),
        RepositoryProvider<PlacesRepository>(create: (_) => PlacesRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<GeolocationBloc>(
              create: (_) => GeolocationBloc(
                  geolocationRepository: context.read<GeolocationRepository>())
                ..add(
                  LoadGeolocationEvent(),
                )),
          BlocProvider<AutocompleteBloc>(
            create: (_) => AutocompleteBloc(
              placesRepository: context.read<PlacesRepository>(),
            )..add(LoadAutoCompleteEvent()),
          ),
          BlocProvider<PlaceBloc>(
            create: (_) => PlaceBloc(
              placesRepository: context.read<PlacesRepository>(),
            ),
          ),
          BlocProvider<FiltersBloc>(
            create: (_) => FiltersBloc()
              ..add(
                FiltersLoadEvent(),
              ),
          )
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomePage.routeName,
        ),
      ),
    );
  }
}
