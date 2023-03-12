import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.size,
    required this.product,
  });

  final Size size;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5 * size.height,
      width: double.infinity,
      color: Colors.white,
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
