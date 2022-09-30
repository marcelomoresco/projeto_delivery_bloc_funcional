import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String category;
  final String description;
  final double price;

  MenuItem({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        name,
        category,
        description,
        price,
      ];

  static List<MenuItem> menuItems = [
    MenuItem(
      id: 1,
      restaurantId: 1,
      name: "Sushi",
      category: "Sushi",
      description: "Sushi com Temaki",
      price: 15.99,
    ),
    MenuItem(
      id: 1,
      restaurantId: 1,
      name: "Yakissoba",
      category: "Sushi",
      description: "Yakissoba com Macarão",
      price: 15.99,
    ),
    MenuItem(
      id: 2,
      restaurantId: 2,
      name: "Baviera",
      category: "Pizza",
      description: "Pizza de Calabresa",
      price: 55.99,
    ),
    MenuItem(
      id: 2,
      restaurantId: 2,
      name: "Coca Cola",
      category: "Bebidas",
      description: "Refrigerante",
      price: 55.99,
    ),
    MenuItem(
      id: 2,
      restaurantId: 2,
      name: "Pizza",
      category: "Pizza",
      description: "Banana Nevada",
      price: 55.99,
    ),
  ];
}
