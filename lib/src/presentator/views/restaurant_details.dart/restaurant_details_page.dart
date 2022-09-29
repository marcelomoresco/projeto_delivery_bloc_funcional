import 'package:flutter/material.dart';

class RestaurantDetailsPage extends StatelessWidget {
  const RestaurantDetailsPage({super.key});

  static const String routeName = '/restaurant-details';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const RestaurantDetailsPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes do Restaurante")),
      body: Column(),
    );
  }
}
