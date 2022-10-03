// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Cupom extends Equatable {
  final String id;
  final String code;
  final double value;

  const Cupom({
    required this.id,
    required this.code,
    required this.value,
  });

  Cupom copyWith({
    String? id,
    String? code,
    double? value,
  }) {
    return Cupom(
      id: id ?? this.id,
      code: code ?? this.code,
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [id, code, value];

  static List<Cupom> cupoms = [
    const Cupom(id: '1', code: 'MENOS20', value: 20),
    const Cupom(id: '2', code: 'MENOS10', value: 10),
    const Cupom(id: '3', code: 'MENOS5', value: 5),
  ];
}
