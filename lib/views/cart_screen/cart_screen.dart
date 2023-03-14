import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/utils/app_actions.dart';
import 'package:store/views/cart_screen/empty_cart.dart';

import '../../controllers/cart_bloc/cart_bloc.dart';
import 'cart_list_builder.dart';
import 'sum_total_and_checkout_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
        actions: const [AppActions()],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final keys = state.cartItems.keys.toList();
          final values = state.cartItems.values.toList();
          return state.cartItems.isEmpty
              ? const EmptyCart()
              : CartListBuilder(keys: keys, values: values);
        },
      ),
      bottomNavigationBar: const SumTotalAndCheckoutButton(),
    );
  }
}
