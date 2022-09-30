part of 'filters_bloc.dart';

abstract class FiltersState extends Equatable {
  const FiltersState();

  @override
  List<Object?> get props => [];
}

class FiltersLoadingState extends FiltersState {}

class FilterLoadedState extends FiltersState {
  final Filter filter;

  const FilterLoadedState({
    this.filter = const Filter(),
  });

  @override
  List<Object?> get props => [filter];
}
