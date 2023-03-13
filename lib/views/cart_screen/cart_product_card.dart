import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/controllers/product_detail_bloc/product_detail_bloc.dart';

import '../../data/models/product_model.dart';
import 'cart_product_description.dart';
import 'cart_product_image.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final ProductDetailBloc productDetailBloc =
        BlocProvider.of<ProductDetailBloc>(context);

    return GestureDetector(
      onTap: () => productDetailBloc.add(LoadProductEvent(product: product)),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 0,
              offset: const Offset(4, 5),
            ),
          ],
        ),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CartProductImage(product: product),
            const SizedBox(width: 10),
            CartProductDescription(product: product)
          ],
        ),
      ),
    );
  }
}
