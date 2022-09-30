// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final int id;
  final String price;

  const Price({
    required this.id,
    required this.price,
  });

  @override
  List<Object?> get props => [id, price];

  static List<Price> prices = [
    const Price(id: 1, price: 'R\$'),
    const Price(id: 2, price: 'R\$\$'),
    const Price(id: 3, price: 'R\$\$\$'),
  ];
}
