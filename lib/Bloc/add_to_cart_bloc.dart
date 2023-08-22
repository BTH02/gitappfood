
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modal/product.dart';
import 'add_to_cart_event.dart';
import 'add_to_cart_state.dart';

class CartBloc extends Bloc<CartEvent,CartState>{
  CartBloc():super(CartState([])){
    on<CartEvent>(_mapEvenToState);
  }
  Future<void> _mapEvenToState(
      CartEvent event, Emitter<CartState> emit) async {
    if(event is AddCart){
      final updatedCart = List<Product>.from(state.cartItem)..add(event.product);
      emit(CartState(updatedCart));
    }
    else if(event is RemoveFromCart){
      final updatedCart = List<Product>.from(state.cartItem)..remove(event.product);
      emit(CartState(updatedCart));
    }
  }
}