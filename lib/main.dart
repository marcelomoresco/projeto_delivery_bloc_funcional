import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_delivery_bloc/src/infra/repositories/geolocation/geolocation_repository.dart';
import 'package:projeto_delivery_bloc/src/infra/repositories/places/places_repository.dart';
import 'package:projeto_delivery_bloc/src/presentator/blocs/cart_bloc/cart_bloc.dart';
import 'package:projeto_delivery_bloc/src/presentator/blocs/filter_bloc/filters_bloc.dart';
import 'package:projeto_delivery_bloc/src/presentator/blocs/location_bloc/location_bloc.dart';
import 'package:projeto_delivery_bloc/src/presentator/blocs/place_autocomplete/autocomplete_bloc.dart';
import 'package:projeto_delivery_bloc/src/presentator/config/routes/app_router.dart';
import 'package:projeto_delivery_bloc/src/presentator/views/home/home_page.dart';
import 'package:projeto_delivery_bloc/src/presentator/views/location/location_page.dart';

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
          BlocProvider<LocationBloc>(
            create: (context) => LocationBloc(
                placesRepository: context.read<PlacesRepository>(),
                geolocationRepository: context.read<GeolocationRepository>())
              ..add(
                const LocationLoadMapEvent(),
              ),
          ),
          BlocProvider<AutocompleteBloc>(
            create: (_) => AutocompleteBloc(
              placesRepository: context.read<PlacesRepository>(),
            )..add(LoadAutoCompleteEvent()),
          ),
          BlocProvider<FiltersBloc>(
            create: (_) => FiltersBloc()
              ..add(
                FiltersLoadEvent(),
              ),
          ),
          BlocProvider<CartBloc>(
            create: (_) => CartBloc()
              ..add(
                LoadCartEvent(),
              ),
          ),
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
