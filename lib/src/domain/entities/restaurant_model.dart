import 'package:equatable/equatable.dart';
import 'package:projeto_delivery_bloc/src/domain/entities/menu_item_model.dart';

class Restaurant extends Equatable {
  final int id;
  final String imageUrl;
  final String name;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final double deliveryPrice;
  final double distance;

  const Restaurant({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.tags,
    required this.deliveryTime,
    required this.deliveryPrice,
    required this.distance,
    required this.menuItems,
  });

  @override
  List<Object?> get props => [
        id,
        imageUrl,
        name,
        tags,
        deliveryTime,
        deliveryPrice,
        distance,
      ];

  static List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      imageUrl:
          'https://content.portaldofranchising.com.br/wp-content/uploads/2016/03/08105636/sushijapa3.jpg',
      name: "SushiJapa",
      tags: ["Sushi"],
      menuItems: MenuItem.menuItems
          .where((menuId) => menuId.restaurantId == 1)
          .toList(),
      deliveryTime: 30,
      deliveryPrice: 5.90,
      distance: 0.1,
    ),
    Restaurant(
      id: 2,
      imageUrl:
          'https://media-cdn.tripadvisor.com/media/photo-s/1a/f9/e2/8a/pizzaria-hermon.jpg',
      name: "Pizzaria do João",
      tags: ["Pizza"],
      menuItems: MenuItem.menuItems
          .where((menuId) => menuId.restaurantId == 2)
          .toList(),
      deliveryTime: 30,
      deliveryPrice: 15.90,
      distance: 0.7,
    ),
    Restaurant(
      id: 3,
      imageUrl:
          'https://gkpb.com.br/wp-content/uploads/2022/07/gkpb-hamburgueria-hellmanns.jpg',
      name: "Hamburguer House",
      tags: ["Hamburguer"],
      menuItems: MenuItem.menuItems
          .where((menuId) => menuId.restaurantId == 3)
          .toList(),
      deliveryTime: 15,
      deliveryPrice: 0,
      distance: 1.1,
    ),
    Restaurant(
      id: 4,
      imageUrl:
          'https://apiceconsultoriajr.com/wp-content/uploads/2021/04/1.jpg',
      name: "Hamburguer Vegano",
      tags: ["Hamburguer"],
      menuItems: MenuItem.menuItems
          .where((menuId) => menuId.restaurantId == 4)
          .toList(),
      deliveryTime: 30,
      deliveryPrice: 7.90,
      distance: 0.3,
    ),
    Restaurant(
      id: 5,
      imageUrl:
          'https://armazemnaturalcereais.com.br/wp-content/uploads/2021/02/MG_1928_100px-768x512.jpg',
      name: "Natural Foods",
      tags: ["Natural"],
      menuItems: MenuItem.menuItems
          .where((menuId) => menuId.restaurantId == 5)
          .toList(),
      deliveryTime: 30,
      deliveryPrice: 5.90,
      distance: 0.1,
    ),
    Restaurant(
      id: 6,
      imageUrl:
          'https://previews.123rf.com/images/cattleyaart/cattleyaart1505/cattleyaart150500031/40037023-vector-illustration-of-ice-cream-shop-building-with-bright-banner-.jpg',
      name: "Gelado ",
      tags: ["Sobremesas"],
      menuItems: MenuItem.menuItems
          .where((menuId) => menuId.restaurantId == 6)
          .toList(),
      deliveryTime: 10,
      deliveryPrice: 0,
      distance: 0.1,
    ),
    Restaurant(
      id: 7,
      imageUrl:
          'https://paribar.com.br/wp-content/uploads/2021/04/comida-brasileira.jpg',
      name: "Restaurante Brasileirinho",
      tags: ["Brasileira"],
      menuItems: MenuItem.menuItems
          .where((menuId) => menuId.restaurantId == 7)
          .toList(),
      deliveryTime: 30,
      deliveryPrice: 5.90,
      distance: 0.8,
    ),
  ];
}
