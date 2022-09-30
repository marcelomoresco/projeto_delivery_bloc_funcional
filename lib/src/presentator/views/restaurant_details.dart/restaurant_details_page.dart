// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:projeto_delivery_bloc/src/presentator/views/components/restaurant_tags.dart';

import '../../../domain/entities/restaurant_model.dart';
import '../components/restaurant_information.dart';

class RestaurantDetailsPage extends StatelessWidget {
  const RestaurantDetailsPage({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  static const String routeName = '/restaurant-details';

  static Route route({required Restaurant restaurant}) {
    return MaterialPageRoute(
      builder: (context) => RestaurantDetailsPage(restaurant: restaurant),
      settings: const RouteSettings(name: routeName),
    );
  }

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                backgroundColor: Colors.deepPurple,
                shape: const RoundedRectangleBorder()),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
            child: const Text(
              "Carrinho",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ]),
      )),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                    MediaQuery.of(context).size.width,
                    50,
                  ),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(restaurant.imageUrl),
                ),
              ),
            ),
            RestaurantInformation(restaurant: restaurant),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemCount: restaurant.tags.length,
              itemBuilder: (context, index) {
                return _buildMenuItem(restaurant, context, index);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      Restaurant restaurant, BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.00),
          child: Text(
            restaurant.tags[index],
            style: TextStyle(color: Colors.black, fontSize: 19),
          ),
        ),
        Column(
          children: restaurant.menuItems
              .where((menuItem) => menuItem.category == restaurant.tags[index])
              .map((menuItem) => Column(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(menuItem.name),
                          subtitle: Text(menuItem.description),
                          trailing: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("R\$${menuItem.price}"),
                                IconButton(
                                  icon: Icon(Icons.add_circle,
                                      color: Colors.deepPurple),
                                  onPressed: () {},
                                )
                              ]),
                        ),
                      ),
                      Divider(
                        height: 2,
                      )
                    ],
                  ))
              .toList(),
        )
      ],
    );
  }
}
