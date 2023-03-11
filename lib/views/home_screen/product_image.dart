import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CachedNetworkImage(
        imageUrl: (product.imageUrl),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
