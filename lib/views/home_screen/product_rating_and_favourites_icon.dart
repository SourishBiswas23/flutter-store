import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/favourites_bloc/favourites_bloc.dart';
import '../../data/models/product_model.dart';

class ProductRatingAndFavouritesIcon extends StatefulWidget {
  const ProductRatingAndFavouritesIcon({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<ProductRatingAndFavouritesIcon> createState() =>
      _ProductRatingAndFavouritesIconState();
}

class _ProductRatingAndFavouritesIconState
    extends State<ProductRatingAndFavouritesIcon> {
  @override
  Widget build(BuildContext context) {
    final favouriteBloc = context.read<FavouritesBloc>();
    bool selected = favouriteBloc.state.favouriteList.contains(widget.product);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.star_rounded,
                color: Colors.deepOrange,
              ),
              const SizedBox(width: 5),
              Text(
                '(${widget.product.rating})',
                style: const TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
          Center(
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () => setState(() {
                if (selected) {
                  favouriteBloc
                      .add(RemoveFavouriteEvent(favourite: widget.product));
                } else {
                  favouriteBloc
                      .add(AddFavouriteEvent(favourite: widget.product));
                }
                selected = !selected;
              }),
              icon: selected
                  ? const Icon(Icons.favorite_rounded)
                  : const Icon(Icons.favorite_outline),
              color: Colors.deepOrange,
              // size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
