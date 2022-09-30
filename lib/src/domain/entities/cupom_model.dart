// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Cupom extends Equatable {
  final int id;
  final String code;
  final double value;

  const Cupom({
    required this.id,
    required this.code,
    required this.value,
  });

  @override
  List<Object?> get props => [id, code, value];

  static List<Cupom> cupoms = [
    const Cupom(id: 1, code: 'MENOS20', value: 20),
    const Cupom(id: 1, code: 'MENOS10', value: 10),
    const Cupom(id: 1, code: 'MENOS5', value: 5),
  ];
}
