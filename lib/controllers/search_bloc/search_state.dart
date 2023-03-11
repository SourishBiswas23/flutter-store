part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState();
  final String title = '';

  @override
  List<Object> get props => [];
}

class SearchStateInitial extends SearchState {}

class Searching extends SearchState {
  const Searching({required this.title});
  @override
  final String title;
}

class ProductCategoryListState extends SearchState {
  const ProductCategoryListState({
    required this.productList,
    required this.title,
  });
  @override
  final String title;
  final List<ProductModel> productList;
}

class ErrorSearchState extends SearchState {
  const ErrorSearchState({required this.errorMessage});
  final String errorMessage;
}

class ProductNotFoundState extends SearchState {
  const ProductNotFoundState({required this.title});
  @override
  final String title;
}

class ProductById extends SearchState {
  const ProductById({required this.product, required this.title});
  final ProductModel product;
  @override
  final String title;
}
