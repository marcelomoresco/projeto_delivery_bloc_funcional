// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:projeto_delivery_bloc/src/domain/entities/category_model.dart';

class CategoryFilter extends Equatable {
  final int id;
  final Category category;
  final bool value;

  const CategoryFilter({
    required this.id,
    required this.category,
    required this.value,
  });

  CategoryFilter copyWith({int? id, Category? category, bool? value}) {
    return CategoryFilter(
      id: id ?? this.id,
      category: category ?? this.category,
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [id, category, value];

  static List<CategoryFilter> categoryFilters = Category.categories
      .map((category) => CategoryFilter(
            id: category.categoryId,
            category: category,
            value: false,
          ))
      .toList();
}
