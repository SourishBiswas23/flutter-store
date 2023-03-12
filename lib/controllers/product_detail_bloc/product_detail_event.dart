part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadProductEvent extends ProductDetailEvent {
  const LoadProductEvent({required this.product});
  final ProductModel product;
}

class RemoveProductScreenEvent extends ProductDetailEvent {}
