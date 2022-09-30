import 'package:flutter/material.dart';

class CustomCartBottomAppBar extends StatelessWidget {
  const CustomCartBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    Navigator.of(context).pushNamed('/checkout');
                  },
                  child: const Text(
                    "Finalizar Compra",
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
    );
  }
}
