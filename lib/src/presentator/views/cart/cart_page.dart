import 'package:flutter/material.dart';
import '../components/cart/custom_cart_bottom_app_bar.dart';
import '../components/cart/custom_cupom_cart.dart';
import '../components/cart/custom_items_cart.dart';
import '../components/cart/custom_switch_talher.dart';
import '../components/cart/order_resume.dart';

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
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Carrinho de Compras"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed("/edit-cart");
            },
          )
        ],
        elevation: 0,
      ),
      bottomNavigationBar: const CustomCartBottomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Talher?",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              CustomSwitchTalher(),
              Text(
                "Items",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              CustomItemsCart(),
              SizedBox(
                height: 20,
              ),
              CustomCupomCartWidget(),
              SizedBox(
                height: 20,
              ),
              OrderResume()
            ],
          ),
        ),
      ),
    );
  }
}
