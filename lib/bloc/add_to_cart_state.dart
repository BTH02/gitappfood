import 'package:appfood/enums/enum.dart';
import 'package:appfood/modal/product.dart';
import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  final List<Product> cartItem;
  final BlocStatus status;

  const CartState({this.cartItem = const [], this.status = BlocStatus.initial});

  @override
  List<Object?> get props => [cartItem, status];

  CartState copyWith({
    List<Product>? cartItem,
    BlocStatus? status,
  }) {
    return CartState(
      cartItem: cartItem ?? this.cartItem,
      status: status ?? this.status,
    );
  }

  double get totalPrice {
    double result = 0;
    for (final item in cartItem) {
      result += item.price * item.countItem;
    }

    return result;
  }
}
