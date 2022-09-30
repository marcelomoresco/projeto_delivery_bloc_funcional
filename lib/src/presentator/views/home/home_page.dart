// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:projeto_delivery_bloc/src/domain/entities/category_model.dart';
import 'package:projeto_delivery_bloc/src/domain/entities/restaurant_model.dart';

import '../../../domain/entities/promo_model.dart';
import '../components/category/category_box.dart';
import '../components/restaurant/food_search_box.dart';
import '../components/home/promobox_custom.dart';
import '../components/restaurant/restaurant_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const HomePage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {},
        ),
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Localização Atual",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                "Jaragua do Sul, Sc",
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ]),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 125,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Promo.promos.length,
                    itemBuilder: (context, index) {
                      return PromoBox(
                        promo: Promo.promos[index],
                      );
                    },
                  ),
                ),
              ),
              const FoodSearchBox(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Category.categories.length,
                    itemBuilder: (context, index) {
                      return CategoryBox(category: Category.categories[index]);
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Mais Avaliados",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: Restaurant.restaurants.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RestaurantCard(
                        restaurant: Restaurant.restaurants[index],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
