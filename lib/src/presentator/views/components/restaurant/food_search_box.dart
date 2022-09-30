import 'package:flutter/material.dart';

class FoodSearchBox extends StatelessWidget {
  const FoodSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "O que você quer comer?",
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.deepPurple,
                ),
                contentPadding: const EdgeInsets.only(
                    left: 20, bottom: 5, right: 5, top: 12.5),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.deepPurple,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/filter');
              },
            ),
          )
        ],
      ),
    );
  }
}
