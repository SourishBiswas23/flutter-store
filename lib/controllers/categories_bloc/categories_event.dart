part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class SelectedCategoryEvent extends CategoriesEvent {
  const SelectedCategoryEvent({required this.title});
  final String title;
}

class DeselectItemsEvent extends CategoriesEvent {}
