// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCartEvent extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddItemCartEvent extends CartEvent {
  final MenuItem item;

  const AddItemCartEvent({
    required this.item,
  });

  @override
  List<Object> get props => [item];
}

class RemoveItemCartEvent extends CartEvent {
  final MenuItem item;

  const RemoveItemCartEvent({
    required this.item,
  });

  @override
  List<Object> get props => [item];
}

class SwitchCartEvent extends CartEvent {
  const SwitchCartEvent();

  @override
  List<Object> get props => [];
}

class RemoveAllItemEvent extends CartEvent {
  final MenuItem item;

  const RemoveAllItemEvent(this.item);

  @override
  List<Object> get props => [item];
}

class AddCupomEvent extends CartEvent {
  final Cupom cupom;
  const AddCupomEvent({required this.cupom});

  @override
  List<Object> get props => [cupom];
}
