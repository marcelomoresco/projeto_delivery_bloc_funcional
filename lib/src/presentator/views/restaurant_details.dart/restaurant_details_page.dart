// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:projeto_delivery_bloc/src/presentator/views/components/restaurant/restaurant_tags.dart';

import '../../../domain/entities/restaurant_model.dart';
import '../../blocs/cart_bloc/cart_bloc.dart';
import '../components/restaurant/restaurant_information.dart';

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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomAppBar(
              color: Colors.deepPurple,
              child: Container(
                height: 50,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/cart');
                    },
                    child: const Text(
                      "Carrinho",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  )
                ]),
              )),
        ),
      ),
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
    Restaurant restaurant,
    BuildContext context,
    int index,
  ) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.00),
            child: Text(
              restaurant.tags[index],
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: restaurant.menuItems
                .where(
                    (menuItem) => menuItem.category == restaurant.tags[index])
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
                                  BlocBuilder<CartBloc, CartState>(
                                    builder: (context, state) {
                                      return IconButton(
                                        icon: const Icon(Icons.add_circle,
                                            color: Colors.deepPurple),
                                        onPressed: () {
                                          context.read<CartBloc>().add(
                                              AddItemCartEvent(item: menuItem));
                                          const snackBar = SnackBar(
                                            content: Text(
                                                "Produto adicionado ao carrinho",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            backgroundColor: Colors.green,
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        },
                                      );
                                    },
                                  )
                                ]),
                          ),
                        ),
                        const Divider(
                          height: 2,
                        )
                      ],
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
