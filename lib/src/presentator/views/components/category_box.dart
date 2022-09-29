import 'package:flutter/material.dart';
import 'package:projeto_delivery_bloc/src/domain/entities/category_model.dart';

class CategoryBox extends StatelessWidget {
  final Category category;

  const CategoryBox({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          category.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
