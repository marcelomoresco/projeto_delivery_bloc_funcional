import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/cart_bloc/cart_bloc.dart';

class EditCartPage extends StatelessWidget {
  const EditCartPage({super.key});

  static const String routeName = '/edit-cart';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const EditCartPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Editar"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
        elevation: 0,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomAppBar(
              color: Colors.deepPurple,
              child: Container(
                height: 50,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Done",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  )
                ]),
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<CartBloc, CartState>(
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
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
                            itemCount: state.cart
                                .itemQuantity(state.cart.items)
                                .keys
                                .length,
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
                                                color: Colors.black,
                                                fontSize: 15))),
                                    IconButton(
                                      onPressed: () {
                                        context.read<CartBloc>().add(
                                              RemoveAllItemEvent(
                                                state.cart
                                                    .itemQuantity(
                                                        state.cart.items)
                                                    .keys
                                                    .elementAt(index),
                                              ),
                                            );
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        context.read<CartBloc>().add(
                                            RemoveItemCartEvent(
                                                item: state.cart
                                                    .itemQuantity(
                                                        state.cart.items)
                                                    .keys
                                                    .elementAt(index)));
                                      },
                                      icon: const Icon(
                                        Icons.remove_circle,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        context.read<CartBloc>().add(
                                              AddItemCartEvent(
                                                item: state.cart
                                                    .itemQuantity(
                                                        state.cart.items)
                                                    .keys
                                                    .elementAt(index),
                                              ),
                                            );
                                      },
                                      icon: const Icon(
                                        Icons.add_circle,
                                      ),
                                    )
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
