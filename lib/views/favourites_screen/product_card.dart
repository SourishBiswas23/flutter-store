import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';
import 'product_image.dart';
import 'product_rating_and_favourites_icon.dart';
import 'product_title_and_price.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.favouriteProduct});
  final ProductModel favouriteProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 0,
            offset: const Offset(4, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProductImage(favouriteProduct: favouriteProduct),
          ProductTitleAndPrice(favouriteProduct: favouriteProduct),
          ProductRatingAndFavouritesIcon(favouriteProduct: favouriteProduct),
        ],
      ),
    );
  }
}
