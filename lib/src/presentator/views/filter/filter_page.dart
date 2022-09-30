import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_delivery_bloc/src/domain/entities/category_model.dart';

import '../../../domain/entities/price_model.dart';
import '../../../domain/entities/restaurant_model.dart';
import '../../blocs/filter_bloc/filters_bloc.dart';
import '../components/filter/custom_category_filter.dart';
import '../components/filter/custom_price_filter.dart';

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
      appBar: AppBar(title: const Text("Filter")),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          BlocBuilder<FiltersBloc, FiltersState>(
            builder: (context, state) {
              if (state is FiltersLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FilterLoadedState) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                      backgroundColor: Colors.deepPurple,
                      shape: const RoundedRectangleBorder()),
                  onPressed: () {
                    var categories = state.filter.categoryFilter
                        .where((filter) => filter.value)
                        .map((filter) => filter.category.name)
                        .toList();

                    var price = state.filter.priceFilter
                        .where((filter) => filter.value)
                        .map((filter) => filter.price.price)
                        .toList();
                    List<Restaurant> restaurant = Restaurant.restaurants
                        .where(
                          (restaurant) => categories.any(
                            (category) => restaurant.tags.contains(category),
                          ),
                        )
                        .where(
                          (restaurant) => price.any(
                            (price) => restaurant.priceCategory.contains(price),
                          ),
                        )
                        .toList();

                    Navigator.of(context)
                        .pushNamed('/restaurant-list', arguments: restaurant);
                  },
                  child: const Text(
                    "Filtrar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text("Erro"),
                );
              }
            },
          )
        ]),
      )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Preços",
              style: TextStyle(fontSize: 20),
            ),
            CustomPriceFilter(),
            Text(
              "Categorias",
              style: TextStyle(fontSize: 20),
            ),
            CustomCategoryFilter(),
          ],
        ),
      ),
    );
  }
}
