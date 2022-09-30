import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/cart_bloc/cart_bloc.dart';

class CustomSwitchTalher extends StatelessWidget {
  const CustomSwitchTalher({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      width: double.infinity,
      child: Row(
        children: [
          const Expanded(
            child: Text(
              "Você precisa de Talher?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CartLoadedState) {
                return SizedBox(
                  width: 100,
                  child: SwitchListTile(
                    dense: false,
                    value: state.cart.talher,
                    onChanged: (bool? newValue) {
                      context.read<CartBloc>().add(const SwitchCartEvent());
                    },
                  ),
                );
              } else if (state is CartErrorState) {
                return ScaffoldMessenger(
                  child: Text(state.errorMessage),
                );
              } else {
                return const Text("Algo deu muito errado!");
              }
            },
          )
        ],
      ),
    );
  }
}
