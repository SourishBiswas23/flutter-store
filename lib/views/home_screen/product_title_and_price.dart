import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';

class ProductTitleAndPrice extends StatelessWidget {
  const ProductTitleAndPrice({
    super.key,
    required this.product,
  });

  final ProductModel product;

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
              product.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 5),
          Text(
            '₹ ${product.price}',
            style: const TextStyle(
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }
}
