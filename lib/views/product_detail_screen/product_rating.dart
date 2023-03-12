import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../data/models/product_model.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RatingBar(
            direction: Axis.horizontal,
            initialRating: double.parse(product.rating),
            ratingWidget: RatingWidget(
              full: const Icon(
                Icons.star_rounded,
                color: Colors.deepOrange,
              ),
              half: const Icon(
                Icons.star_half_rounded,
                color: Colors.deepOrange,
              ),
              empty: const Icon(
                Icons.star_outline_rounded,
                color: Colors.deepOrange,
              ),
            ),
            onRatingUpdate: (value) {},
          ),
          const SizedBox(width: 10),
          Text(
            product.rating,
            style: const TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
