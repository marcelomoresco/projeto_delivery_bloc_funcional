// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:projeto_delivery_bloc/src/domain/entities/category_filter_model.dart';
import 'package:projeto_delivery_bloc/src/domain/entities/price_filter_model.dart';

class Filter extends Equatable {
  final List<CategoryFilter> categoryFilter;
  final List<PriceFilter> priceFilter;
  const Filter({
    this.categoryFilter = const <CategoryFilter>[],
    this.priceFilter = const <PriceFilter>[],
  });

  Filter copyWith({
    List<CategoryFilter>? categoryFilter,
    List<PriceFilter>? priceFilter,
  }) {
    return Filter(
      categoryFilter: categoryFilter ?? this.categoryFilter,
      priceFilter: priceFilter ?? this.priceFilter,
    );
  }

  @override
  List<Object?> get props => [categoryFilter, priceFilter];
}
