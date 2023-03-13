import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/controllers/cart_bloc/cart_bloc.dart';

import '../../data/models/product_model.dart';

class PriceAndShopNowButton extends StatelessWidget {
  const PriceAndShopNowButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            '₹${product.price}',
            style: const TextStyle(
              color: Colors.deepOrange,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 50),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                ),
              ),
              onPressed: () {
                cartBloc.add(AddProductToCartEvent(product: product));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Added Product to cart'),
                    action: SnackBarAction(
                      label: 'Dismiss',
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                    ),
                  ),
                );
              },
              child: const Center(
                child: Text(
                  'Shop Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
