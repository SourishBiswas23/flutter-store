import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.favouriteProduct,
  });

  final ProductModel favouriteProduct;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CachedNetworkImage(
        imageUrl: (favouriteProduct.imageUrl),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
