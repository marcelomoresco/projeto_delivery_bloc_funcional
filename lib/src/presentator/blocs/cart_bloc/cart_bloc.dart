import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/cart_model.dart';
import '../../../domain/entities/cupom_model.dart';
import '../../../domain/entities/menu_item_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoadingState()) {
    on<LoadCartEvent>(_loadCartEvent);
    on<AddItemCartEvent>(_addItemCartEvent);
    on<RemoveItemCartEvent>(_removeItemCartEvent);
    on<SwitchCartEvent>(_switchItemCartEvent);
    on<RemoveAllItemEvent>(_onRemoveAllItemEvent);
    on<AddCupomEvent>(_onAddCupomEvent);
  }

  void _loadCartEvent(
    LoadCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoadingState());
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      emit(CartLoadedState(cart: Cart()));
    } catch (e) {
      emit(const CartErrorState(errorMessage: "Erro ao Carregar Carrinho"));
    }
  }

  void _addItemCartEvent(
    AddItemCartEvent event,
    Emitter<CartState> emit,
  ) {
    final state = this.state;
    if (state is CartLoadedState) {
      try {
        emit(CartLoadedState(
            cart: state.cart.copyWith(
                items: List.from(state.cart.items)..add(event.item))));
      } catch (e) {
        emit(const CartErrorState(
            errorMessage: "Error ao Adicionar Item ao Carrinho"));
      }
    }
  }

  void _onRemoveAllItemEvent(
      RemoveAllItemEvent event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoadedState) {
      try {
        emit(
          CartLoadedState(
            cart: state.cart.copyWith(
              items: List.from(state.cart.items)
                ..removeWhere((item) => item == event.item),
            ),
          ),
        );
      } catch (e) {
        emit(const CartErrorState(
            errorMessage: "Error ao Adicionar Item ao Carrinho"));
      }
    }
  }

  void _removeItemCartEvent(
    RemoveItemCartEvent event,
    Emitter<CartState> emit,
  ) {
    final state = this.state;
    if (state is CartLoadedState) {
      try {
        emit(CartLoadedState(
            cart: state.cart.copyWith(
                items: List.from(state.cart.items)..remove(event.item))));
      } catch (e) {
        emit(const CartErrorState(
            errorMessage: "Error ao Adicionar Item ao Carrinho"));
      }
    }
  }

  void _switchItemCartEvent(
    SwitchCartEvent event,
    Emitter<CartState> emit,
  ) {
    final state = this.state;
    if (state is CartLoadedState) {
      try {
        emit(
          CartLoadedState(
            cart: state.cart.copyWith(talher: !state.cart.talher),
          ),
        );
      } catch (e) {
        emit(const CartErrorState(errorMessage: "Erro ao adicionar talher!"));
      }
    }
  }

  void _onAddCupomEvent(AddCupomEvent event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoadedState) {
      try {
        emit(CartLoadedState(cart: state.cart.copyWith(cupom: event.cupom)));
      } catch (e) {
        emit(
          const CartErrorState(errorMessage: "Erro ao Aplicar Cupom"),
        );
      }
    }
  }
}
