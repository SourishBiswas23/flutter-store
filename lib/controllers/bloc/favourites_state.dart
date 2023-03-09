part of 'favourites_bloc.dart';

class FavouritesState extends Equatable {
  const FavouritesState({required List<ProductModel> favouriteList})
      : _favouriteList = favouriteList;

  final List<ProductModel> _favouriteList;

  List<ProductModel> get favouriteList => _favouriteList;

  @override
  List<Object> get props => [_favouriteList];
}
