import 'package:flutter/material.dart';

class DeliveryTimePage extends StatelessWidget {
  const DeliveryTimePage({super.key});

  static const String routeName = '/delivery-time';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const DeliveryTimePage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Delivery Time")),
      body: Column(),
    );
  }
}
