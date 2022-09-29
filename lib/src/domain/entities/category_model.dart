// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int categoryId;
  final String name;

  const Category({
    required this.categoryId,
    required this.name,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [categoryId, name];

  static List<Category> categories = [
    Category(categoryId: 1, name: "Pizza"),
    Category(categoryId: 2, name: "Brasileira"),
    Category(categoryId: 3, name: "Hamburguer"),
    Category(categoryId: 4, name: "Sushi"),
    Category(categoryId: 5, name: "Sobremesas"),
    Category(categoryId: 6, name: "Natural"),
    Category(categoryId: 6, name: "Bebidas"),
  ];
}
