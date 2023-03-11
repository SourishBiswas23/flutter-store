import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store/data/models/product_model.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(const FavouritesState(favouriteList: [])) {
    on<AddFavouriteEvent>((event, emit) {
      emit(FavouritesState(
          favouriteList: [...state.favouriteList, event.favourite]));
    });
    on<RemoveFavouriteEvent>((event, emit) {
      emit(FavouritesState(favouriteList: [
        ...state.favouriteList.where((element) => element != event.favourite)
      ]));
    });
  }
}
