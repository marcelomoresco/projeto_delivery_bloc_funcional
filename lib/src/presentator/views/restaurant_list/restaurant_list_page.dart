// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projeto_delivery_bloc/src/presentator/views/components/restaurant_card.dart';

import '../../../domain/entities/restaurant_model.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({
    Key? key,
    required this.restaurants,
  }) : super(key: key);

  static const String routeName = '/restaurant-list';

  static Route route({required List<Restaurant> restaurants}) {
    return MaterialPageRoute(
      builder: (context) => RestaurantListPage(restaurants: restaurants),
      settings: const RouteSettings(name: routeName),
    );
  }

  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Restaurantes")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return RestaurantCard(restaurant: restaurants[index]);
            }),
      ),
    );
  }
}
