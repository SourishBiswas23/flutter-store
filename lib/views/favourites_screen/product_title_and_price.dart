import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';

class ProductTitleAndPrice extends StatelessWidget {
  const ProductTitleAndPrice({
    super.key,
    required this.favouriteProduct,
  });

  final ProductModel favouriteProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              favouriteProduct.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 5),
          Text(
            '₹ ${favouriteProduct.price}',
            style: const TextStyle(
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }
}
