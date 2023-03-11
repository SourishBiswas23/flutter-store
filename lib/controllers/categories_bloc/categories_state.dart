part of 'categories_bloc.dart';

abstract class CategoriesInitialState extends Equatable {
  CategoriesInitialState();
  final List<String> categories = [
    'All',
    'Electronics',
    'Jewelery',
    "Men's Clothing",
    "Women's Clothing"
  ];
  @override
  List<Object> get props => [];
}

class CategoriesState extends CategoriesInitialState {
  CategoriesState({required this.selectedCategory});
  final selectedCategory;
  @override
  List<Object> get props => [selectedCategory];
}
