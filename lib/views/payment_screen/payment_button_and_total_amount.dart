import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/routes.dart';
import 'package:store/views/loading_screen/loading_screen.dart';

import '../../controllers/cart_bloc/cart_bloc.dart';

class PaymentButtonAndTotal extends StatelessWidget {
  const PaymentButtonAndTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final sumTotal =
            state.cartItems.keys.fold<double>(0, (previousValue, element) {
          return previousValue + double.parse(element.price);
        });

        if (state.cartItems.isEmpty) {
          return const SizedBox();
        } else {
          return Container(
            height: 100,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total', style: TextStyle(fontSize: 18)),
                    Text(
                      '₹$sumTotal',
                      style: const TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    cartBloc.add(ClearCart());
                    AppNavigator.pushReplace(route: Routes.loadingScreen);
                    await Future.delayed(const Duration(seconds: 2));
                    AppNavigator.pushReplace(
                      route: Routes.orderPlacedScreen,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                    ),
                    child: const Center(
                      child: Text(
                        'Make Payment',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
    ;
  }
}
