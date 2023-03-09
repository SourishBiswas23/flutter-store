import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';
import 'product_card.dart';

class FavouritesGridBuilder extends StatelessWidget {
  final List<ProductModel> favouritesList;

  const FavouritesGridBuilder({
    super.key,
    required this.favouritesList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) => ProductCard(
          favouriteProduct: favouritesList[index],
        ),
        itemCount: favouritesList.length,
      ),
    );
  }
}
