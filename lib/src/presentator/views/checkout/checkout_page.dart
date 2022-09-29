import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const CheckoutPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      body: Column(),
    );
  }
}
