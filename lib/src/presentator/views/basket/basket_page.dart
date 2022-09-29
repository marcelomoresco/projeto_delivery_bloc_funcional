import 'package:flutter/material.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  static const String routeName = '/basket';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const BasketPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Basket")),
      body: Column(),
    );
  }
}
