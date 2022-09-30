// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:projeto_delivery_bloc/src/domain/entities/menu_item_model.dart';

import 'cupom_model.dart';

class Cart extends Equatable {
  final List<MenuItem> items;
  final bool talher;
  final Cupom? cupom;

  Cart({this.items = const <MenuItem>[], this.talher = false, this.cupom});

  Cart copyWith({
    List<MenuItem>? items,
    bool? talher,
    Cupom? cupom,
  }) {
    return Cart(
      items: items ?? this.items,
      talher: talher ?? this.talher,
      cupom: cupom ?? this.cupom,
    );
  }

  @override
  List<Object?> get props => [items, talher, cupom];

  Map itemQuantity(products) {
    var quantity = Map();

    products.forEach((item) {
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item] += 1;
      }
    });
    return quantity;
  }

  double get subTotal =>
      items.fold(0, (total, current) => total + current.price);

  double total(subTotal) {
    if (cupom == null) {
      return subTotal + 5;
    } else {
      return subTotal + 5 - cupom!.value;
    }
  }

  String get subtotalString => subTotal.toStringAsFixed(2);

  String get totalString => total(subTotal).toStringAsFixed(2);
}
