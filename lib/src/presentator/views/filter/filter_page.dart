import 'package:flutter/material.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  static const String routeName = '/filter';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const FilterPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filter")),
      body: Column(),
    );
  }
}
