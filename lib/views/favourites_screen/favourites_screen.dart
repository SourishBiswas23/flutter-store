import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/utils/app_actions.dart';

import '../../controllers/favourites_bloc/favourites_bloc.dart';
import 'favourites_grid_builder.dart';
import 'no_favourites.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favouritesList = context.read<FavouritesBloc>().state.favouriteList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favourite'),
        centerTitle: true,
        actions: const [AppActions()],
      ),
      body: favouritesList.isEmpty
          ? const NoFavourites()
          : FavouritesGridBuilder(favouritesList: favouritesList),
    );
  }
}
