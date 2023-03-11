import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';
import 'product_card.dart';

class ProductsGridBuilder extends StatelessWidget {
  final List<ProductModel> productsList;

  const ProductsGridBuilder({
    super.key,
    required this.productsList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 0.65,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
        children: [
          for (var product in productsList) ProductCard(product: product)
        ],
      ),
    );
  }
}


// GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 20,
//           crossAxisSpacing: 10,
//           childAspectRatio: 0.65,
//         ),
//         itemBuilder: (context, index) => ProductCard(
//           product: productsList[index],
//         ),
//         itemCount: productsList.length,
//       )