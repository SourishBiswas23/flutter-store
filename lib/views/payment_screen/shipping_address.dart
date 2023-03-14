import 'package:flutter/material.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        Text(
          'Shipping Address',
          style: TextStyle(color: Colors.deepOrange, fontSize: 18),
        )
      ],
    );
  }
}
