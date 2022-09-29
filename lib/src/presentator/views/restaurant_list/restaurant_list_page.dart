import 'package:flutter/material.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({super.key});

  static const String routeName = '/restaurant-list';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const RestaurantListPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listas dos Restaurante")),
      body: Column(),
    );
  }
}
