import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../blocs/cart_bloc/cart_bloc.dart';

class CustomCupomCartWidget extends StatelessWidget {
  const CustomCupomCartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoadedState) {
                return (state.cart.cupom == null)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Você tem um Cupom?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 90,
                            height: 20,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed("/cupom");
                              },
                              child: const Text("Aplicar"),
                            ),
                          )
                        ],
                      )
                    : Text("Seu cupom já foi aplicado!",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold));
              } else if (state is CartErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return Container();
              }
            },
          ),
          const SizedBox(
            width: 15,
          ),
          Lottie.asset("assets/voucher.json", height: 80)
        ],
      ),
    );
  }
}
