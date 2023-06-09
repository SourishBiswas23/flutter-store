import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/controllers/product_detail_bloc/product_detail_bloc.dart';

import '../../data/models/product_model.dart';
import 'product_image.dart';
import 'product_rating_and_favourites_icon.dart';
import 'product_title_and_price.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final ProductDetailBloc productDetailBloc =
        BlocProvider.of<ProductDetailBloc>(context);

    return GestureDetector(
      onTap: () => productDetailBloc.add(LoadProductEvent(product: product)),
      child: Container(
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
            ProductImage(product: product),
            ProductTitleAndPrice(product: product),
            ProductRatingAndFavouritesIcon(product: product),
          ],
        ),
      ),
    );
  }
}
