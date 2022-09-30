import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projeto_delivery_bloc/src/domain/entities/category_filter_model.dart';
import 'package:projeto_delivery_bloc/src/domain/entities/price_filter_model.dart';

import '../../../domain/entities/filter_model.dart';
import '../../../domain/entities/restaurant_model.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersLoadingState()) {
    on<FiltersLoadEvent>(_onLoadEvent);
    on<CategoryFilterUpdateEvent>(_onCategoryUpdateEvent);
    on<PriceFilterUpdateEvent>(_onPriceUpdateEvent);
  }

  void _onLoadEvent(
    FiltersLoadEvent event,
    Emitter<FiltersState> emit,
  ) {
    emit(
      FilterLoadedState(
        filter: Filter(
            categoryFilter: CategoryFilter.categoryFilters,
            priceFilter: PriceFilter.priceFilters),
      ),
    );
  }

  void _onCategoryUpdateEvent(
    CategoryFilterUpdateEvent event,
    Emitter<FiltersState> emit,
  ) {
    final state = this.state;
    if (state is FilterLoadedState) {
      final List<CategoryFilter> updateCategoritesFilter =
          state.filter.categoryFilter.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id
            ? event.categoryFilter
            : categoryFilter;
      }).toList();

      emit(
        FilterLoadedState(
          filter: Filter(
            categoryFilter: updateCategoritesFilter,
            priceFilter: state.filter.priceFilter,
          ),
        ),
      );
    }
  }

  void _onPriceUpdateEvent(
    PriceFilterUpdateEvent event,
    Emitter<FiltersState> emit,
  ) {
    final state = this.state;
    if (state is FilterLoadedState) {
      final List<PriceFilter> updatePriceFilter =
          state.filter.priceFilter.map((priceFilter) {
        return priceFilter.id == event.priceFilter.id
            ? event.priceFilter
            : priceFilter;
      }).toList();

      emit(
        FilterLoadedState(
          filter: Filter(
            categoryFilter: state.filter.categoryFilter,
            priceFilter: updatePriceFilter,
          ),
        ),
      );
    }
  }
}
