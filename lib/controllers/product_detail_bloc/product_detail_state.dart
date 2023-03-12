part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable {
  ProductDetailState();
  late final ProductModel product;
  @override
  List<Object> get props => [product];
}

class ProductDetailInitial extends ProductDetailState {
  @override
  late final ProductModel product;
  @override
  List<Object> get props => [product];
}

class ProductState extends ProductDetailState {
  ProductState({required this.product});
  @override
  final ProductModel product;
  @override
  List<Object> get props => [product];
}
