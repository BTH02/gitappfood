import 'package:equatable/equatable.dart';
import '../modal/product.dart';

abstract class CartEvent extends Equatable{
  List<Object> get props => [];
}
class AddCart extends CartEvent{
  final Product product;
  AddCart(this.product);

  List<Object> get props => [product];
}
class RemoveFromCart extends CartEvent{
  final Product product;
  RemoveFromCart(this.product);

  List<Object> get props => [product];
}
class TotalCart extends CartEvent{
final Product product;
TotalCart(this.product);
List<Object> get props => [product];
}