part of 'favourites_bloc.dart';

abstract class FavouritesEvent extends Equatable {
  const FavouritesEvent();

  @override
  List<Object> get props => [];
}

class AddFavouriteEvent extends FavouritesEvent {
  const AddFavouriteEvent({required this.favourite});
  final ProductModel favourite;
}

class RemoveFavouriteEvent extends FavouritesEvent {
  const RemoveFavouriteEvent({required this.favourite});
  final ProductModel favourite;
}
