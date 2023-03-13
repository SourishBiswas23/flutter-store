import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/cart_bloc/cart_bloc.dart';
import '../../data/models/product_model.dart';

class CartProductTitleAndRemoveIcon extends StatelessWidget {
  const CartProductTitleAndRemoveIcon({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 180,
          child: Text(
            product.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            cartBloc.add(RemoveProductFromCartEvent(product: product));
          },
          child: const Icon(
            Icons.delete,
            color: Colors.deepOrange,
          ),
        )
      ],
    );
  }
}
