import '../modal/product.dart';

abstract class CartEvent {
  const CartEvent();
}

class AddCart extends CartEvent {
  final Product product;

  const AddCart(this.product);
}

class RemoveFromCart extends CartEvent {
  final Product product;

  const RemoveFromCart(this.product);
}

class Increase extends CartEvent {
  final Product product;

  const Increase(this.product);
}

class Decrease extends CartEvent {
  final Product product;

  const Decrease(this.product);
}

class RemoveAllFromCart extends CartEvent{
}