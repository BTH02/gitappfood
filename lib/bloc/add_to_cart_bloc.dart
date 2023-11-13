import 'dart:async';

import 'package:appfood/enums/enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modal/product.dart';
import 'add_to_cart_event.dart';
import 'add_to_cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddCart>(_addCart);
    on<RemoveFromCart>(_removeFromCart);
    on<Increase>(_increase);
    on<Decrease>(_decrease);
    on<RemoveAllFromCart>(_removeAllFromCart);
  }

  Future<void> _increase(Increase event, Emitter<CartState> emit) async {
    emit(state.copyWith(status: BlocStatus.waiting));

    state.cartItem
        .firstWhere((element) => element.id == event.product.id)
        .countItem++;

    final List<Product> cartItemUpdated = List.from(state.cartItem);

    emit(state.copyWith(cartItem: cartItemUpdated, status: BlocStatus.done));
  }

  FutureOr<void> _addCart(AddCart event, Emitter<CartState> emit) {
    final itemAdd = event.product;

    final updatedCart = List<Product>.from(state.cartItem)..add(itemAdd);
    emit(state.copyWith(cartItem: updatedCart));
  }

  FutureOr<void> _removeFromCart(
      RemoveFromCart event, Emitter<CartState> emit) {
    final updatedCart = List<Product>.from(state.cartItem)
      ..remove(event.product);
    emit(state.copyWith(cartItem: updatedCart));
  }

  FutureOr<void> _removeAllFromCart(
      RemoveAllFromCart event, Emitter<CartState> emit) {
    // final updatedCart = List<Product>.from(state.cartItem)
    //   ..clear();
    emit(state.copyWith(cartItem: []));
  }

  FutureOr<void> _decrease(Decrease event, Emitter<CartState> emit) {
    emit(state.copyWith(status: BlocStatus.waiting));

    state.cartItem
        .firstWhere((element) => element.id == event.product.id)
        .countItem--;

    final List<Product> cartItemUpdated = List.from(state.cartItem);

    emit(state.copyWith(cartItem: cartItemUpdated, status: BlocStatus.done));
  }
}
