import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const CartPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho de Compras"),
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
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                backgroundColor: Colors.deepPurple,
                shape: const RoundedRectangleBorder()),
            onPressed: () {
              Navigator.of(context).pushNamed('/checkout');
            },
            child: const Text(
              "Finalizar Compra",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ]),
      )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Talher?"),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(child: const Text("Você precisa de Talher")),
                SizedBox(
                  width: 100,
                  child: SwitchListTile(
                    dense: false,
                    value: false,
                    onChanged: (bool? newValue) {},
                  ),
                )
              ],
            ),
          ),
          const Text("Items"),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  margin: const EdgeInsets.only(top: 5),
                  width: double.infinity,
                  child: Row(
                    children: const [
                      //Quantidade
                      Text(
                        "1x",
                        style: TextStyle(),
                      ),
                      SizedBox(
                        width: 20,
                      ),

                      //menuItem name
                      Expanded(child: Text("Pizza Banananevada")),

                      //Preço item
                      Text("R\$19.90"),
                    ],
                  ),
                );
              }),
          Container(
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Lottie.asset("assets/delivery.json", height: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Envio em 20 minutos!",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Trocar"),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Você tem um CUPOM DE DESCONTO?",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Aplicar"),
                    )
                  ],
                ),
                Lottie.asset("assets/voucher.json", height: 50)
              ],
            ),
          ),
          Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Subtotal",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "R\$ 50",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Preço de Entrega",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "R\$ 20",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Total",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "R\$ 70",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
