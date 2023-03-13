import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';
import 'cart_product_price.dart';
import 'cart_product_title_and_remove_icon.dart';

class CartProductDescription extends StatelessWidget {
  const CartProductDescription({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          CartProductTitleAndRemoveIcon(product: product),
          const SizedBox(height: 20),
          CartProductPrice(product: product)
        ],
      ),
    );
  }
}
