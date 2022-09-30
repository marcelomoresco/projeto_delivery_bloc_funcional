import 'package:flutter/material.dart';
import 'package:projeto_delivery_bloc/src/presentator/views/components/restaurant/restaurant_tags.dart';

import '../../../../domain/entities/restaurant_model.dart';

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantInformation({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RestaurantTags(restaurant: restaurant),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${restaurant.distance}km De Distância & R\$ ${restaurant.deliveryPrice} Preço do Envio',
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Informações do Restaurante',
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text',
          ),
        ],
      ),
    );
  }
}
