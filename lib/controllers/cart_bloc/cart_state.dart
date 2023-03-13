part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState({required this.cartItems});
  final Map<ProductModel, int> cartItems;
  @override
  List<Object> get props => [cartItems];
}
