part of 'filters_bloc.dart';

abstract class FiltersEvent extends Equatable {
  const FiltersEvent();

  @override
  List<Object> get props => [];
}

class FiltersLoadEvent extends FiltersEvent {
  @override
  List<Object> get props => [];
}

class CategoryFilterUpdateEvent extends FiltersEvent {
  final CategoryFilter categoryFilter;

  const CategoryFilterUpdateEvent({required this.categoryFilter});

  @override
  List<Object> get props => [categoryFilter];
}

class PriceFilterUpdateEvent extends FiltersEvent {
  final PriceFilter priceFilter;

  const PriceFilterUpdateEvent({required this.priceFilter});

  @override
  List<Object> get props => [priceFilter];
}
