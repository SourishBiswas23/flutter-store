import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/controllers/product_detail_bloc/product_detail_bloc.dart';
import 'package:store/data/models/product_model.dart';

import 'price_and_shop_now_button.dart';
import 'product_description.dart';
import 'product_image.dart';
import 'product_rating.dart';
import 'product_title.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductDetailBloc productDetailBloc =
        BlocProvider.of<ProductDetailBloc>(context);

    final ProductModel product = productDetailBloc.state.product;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImage(size: size, product: product),
              const SizedBox(height: 20),
              ProductTitle(product: product),
              ProductRating(product: product),
              const SizedBox(height: 10),
              ProductDescription(product: product),
              const SizedBox(height: 20),
              PriceAndShopNowButton(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
