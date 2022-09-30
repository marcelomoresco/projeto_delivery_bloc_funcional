import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/price_model.dart';
import '../../blocs/filter_bloc/filters_bloc.dart';

class CustomPriceFilter extends StatelessWidget {
  const CustomPriceFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        if (state is FiltersLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FilterLoadedState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: state.filter.priceFilter
                .asMap()
                .entries
                .map(
                  (price) => GestureDetector(
                    onTap: () {
                      context.read<FiltersBloc>().add(
                            PriceFilterUpdateEvent(
                              priceFilter:
                                  state.filter.priceFilter[price.key].copyWith(
                                value:
                                    !state.filter.priceFilter[price.key].value,
                              ),
                            ),
                          );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      decoration: BoxDecoration(
                        color: state.filter.priceFilter[price.key].value
                            ? Colors.deepPurple
                            : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        state.filter.priceFilter[price.key].price.price,
                        style: TextStyle(
                          color: state.filter.priceFilter[price.key].value
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        } else {
          return const Center(
            child: Text("Algo deu muito errrado!"),
          );
        }
      },
    );
  }
}
