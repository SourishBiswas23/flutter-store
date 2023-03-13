import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';
import 'cart_product_card.dart';

class CartListBuilder extends StatelessWidget {
  const CartListBuilder({
    super.key,
    required this.keys,
    required this.values,
  });

  final List<ProductModel> keys;
  final List<int> values;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: keys.length,
      itemBuilder: (context, index) {
        final product = keys[index];
        return CartProductCard(product: product);
      },
    );
  }
}
