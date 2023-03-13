import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';

class CartProductPrice extends StatelessWidget {
  const CartProductPrice({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          '₹ ${product.price}',
          style: const TextStyle(
            color: Colors.deepOrange,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
