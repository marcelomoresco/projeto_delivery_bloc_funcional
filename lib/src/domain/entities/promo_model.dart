import 'package:equatable/equatable.dart';

class Promo extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imgUrl;

  Promo(
      {required this.id,
      required this.title,
      required this.description,
      required this.imgUrl});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        description,
        imgUrl,
      ];

  static List<Promo> promos = [
    Promo(
        id: 1,
        title: "FRETE GRÁTIS em suas primeiras compras",
        description: "Garanta hoje mesmo mais de 30 reais de descontos",
        imgUrl:
            'https://d5y9g7a5.rocketcdn.me/wp-content/uploads/2021/01/comidas-preferidas-saiba-quais-sao-em-alguns-paises-pelo-mundo.jpeg')
  ];
}
