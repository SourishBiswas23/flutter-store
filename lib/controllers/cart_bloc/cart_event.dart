part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  CartEvent();
  late final ProductModel product;
  @override
  List<Object> get props => [];
}

class AddProductToCartEvent extends CartEvent {
  AddProductToCartEvent({required this.product});
  @override
  final ProductModel product;
  @override
  List<Object> get props => [product];
}

class RemoveProductFromCartEvent extends CartEvent {
  RemoveProductFromCartEvent({required this.product});
  @override
  final ProductModel product;
  @override
  List<Object> get props => [product];
}

class DecreaseCountEvent extends CartEvent {
  DecreaseCountEvent({required this.product});
  @override
  final ProductModel product;
}

class ClearCart extends CartEvent {}
