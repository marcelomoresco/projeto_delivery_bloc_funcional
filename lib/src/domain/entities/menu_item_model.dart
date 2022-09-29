import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String description;
  final double price;

  MenuItem({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        name,
        description,
        price,
      ];

  static List<MenuItem> menuItems = [
    MenuItem(
      id: 1,
      restaurantId: 1,
      name: "Sushi",
      description: "Sushi com Temaki",
      price: 15.99,
    ),
    MenuItem(
      id: 1,
      restaurantId: 1,
      name: "Yakissoba",
      description: "Yakissoba com Macarão",
      price: 15.99,
    ),
  ];
}
