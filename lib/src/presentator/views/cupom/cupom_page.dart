import 'package:flutter/material.dart';

class CupomPage extends StatelessWidget {
  const CupomPage({super.key});

  static const String routeName = '/cupom';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const CupomPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cupom")),
      body: Column(),
    );
  }
}
