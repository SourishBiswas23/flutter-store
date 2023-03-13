import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';

class CartProductImage extends StatelessWidget {
  const CartProductImage({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: CachedNetworkImage(
        imageUrl: (product.imageUrl),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
        ),
        fit: BoxFit.contain,
      ),
    );
  }
}
