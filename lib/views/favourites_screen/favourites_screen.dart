import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/controllers/bloc/favourites_bloc.dart';
import 'package:store/views/favourites_screen/no_favourites.dart';

import 'favourites_grid_builder.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favouritesList = context.read<FavouritesBloc>().state.favouriteList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favourite'),
        centerTitle: true,
      ),
      body: favouritesList.isEmpty
          ? const NoFavourites()
          : FavouritesGridBuilder(favouritesList: favouritesList),
    );
  }
}
