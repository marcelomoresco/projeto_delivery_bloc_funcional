import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/cart_bloc/cart_bloc.dart';

class CustomItemsCart extends StatelessWidget {
  const CustomItemsCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CartLoadedState) {
          return state.cart.items.isEmpty
              ? Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Sem items no carrinho",
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      state.cart.itemQuantity(state.cart.items).keys.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      margin: const EdgeInsets.only(top: 5),
                      width: double.infinity,
                      child: Row(
                        children: [
                          //Quantidade
                          Text(
                            "${state.cart.itemQuantity(state.cart.items).entries.elementAt(index).value}x",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 20,
                          ),

                          //menuItem name
                          Expanded(
                              child: Text(
                                  "${state.cart.itemQuantity(state.cart.items).keys.elementAt(index).name}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 15))),

                          //Preço item
                          Text(
                              "R\$${state.cart.itemQuantity(state.cart.items).keys.elementAt(index).price}",
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15)),
                        ],
                      ),
                    );
                  });
        } else if (state is CartErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Text("Algo deu muito errado");
        }
      },
    );
  }
}
