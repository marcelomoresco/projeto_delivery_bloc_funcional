// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartLoadingState extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoadedState extends CartState {
  final Cart cart;

  const CartLoadedState({required this.cart});

  @override
  List<Object> get props => [cart];
}

class CartErrorState extends CartState {
  final String errorMessage;

  const CartErrorState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}
