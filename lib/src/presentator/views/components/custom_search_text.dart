import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/place_autocomplete/autocomplete_bloc.dart';

class CustomSearchLocation extends StatelessWidget {
  const CustomSearchLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutocompleteBloc, AutocompleteState>(
      builder: (context, state) {
        if (state is AutocompleteLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AutocompleteLoadedState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Sua Localização",
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.deepPurple,
                ),
                contentPadding:
                    const EdgeInsets.only(left: 20, bottom: 5, right: 5),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
              onChanged: (value) {
                context.read<AutocompleteBloc>().add(
                      LoadAutoCompleteEvent(searchInput: value),
                    );
              },
            ),
          );
        } else {
          return const Center(
            child: Text("Erro ao carregar!"),
          );
        }
      },
    );
  }
}
