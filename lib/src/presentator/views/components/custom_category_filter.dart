import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/category_model.dart';
import '../../blocs/filter_bloc/filters_bloc.dart';

class CustomCategoryFilter extends StatelessWidget {
  const CustomCategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        if (state is FiltersLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FilterLoadedState) {
          return ListView.builder(
            itemCount: state.filter.categoryFilter.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.filter.categoryFilter[index].category.name,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      SizedBox(
                        height: 25,
                        child: Checkbox(
                          value: state.filter.categoryFilter[index].value,
                          onChanged: (bool? newValue) {
                            context.read<FiltersBloc>().add(
                                  CategoryFilterUpdateEvent(
                                    categoryFilter: state
                                        .filter.categoryFilter[index]
                                        .copyWith(
                                            value: !state.filter
                                                .categoryFilter[index].value),
                                  ),
                                );
                          },
                        ),
                      )
                    ]),
              );
            },
          );
        } else {
          return const Center(
            child: Text("Erro ao carregar"),
          );
        }
      },
    );
  }
}
