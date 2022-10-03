import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/cupom_model.dart';
import '../../blocs/cart_bloc/cart_bloc.dart';

class CupomPage extends StatelessWidget {
  const CupomPage({super.key});

  static const String routeName = '/cupom';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const CupomPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cupom"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
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
                    onPressed: () {},
                    child: const Text(
                      "Aplicar",
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Entre com seu Cupom", style: TextStyle()),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Cupom",
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  )),
                ],
              ),
            ),
            const Text("Seus Cupons", style: TextStyle()),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("1x",
                            style: TextStyle(color: Colors.deepPurple)),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(Cupom.cupoms[index].code,
                              style: const TextStyle(color: Colors.black)),
                        ),
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            return TextButton(
                              onPressed: () {
                                context.read<CartBloc>().add(
                                    AddCupomEvent(cupom: Cupom.cupoms[index]));
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Aplicar",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            );
                          },
                        ),
                      ]),
                );
              },
              itemCount: Cupom.cupoms.length,
            )
          ],
        ),
      ),
    );
  }
}
