import 'package:flutter/material.dart';

import '../../../domain/entities/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(restaurant.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  )),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${restaurant.deliveryTime} min',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: restaurant.tags
                      .map((tag) => restaurant.tags.indexOf(tag) ==
                              restaurant.tags.length - 1
                          ? Text(
                              tag,
                              style: TextStyle(),
                            )
                          : Text('$tag, '))
                      .toList(),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${restaurant.distance}km - R\$${restaurant.deliveryPrice}',
                  style: TextStyle(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
