import 'package:flutter/material.dart';
import 'package:store/views/payment_screen/payment_button_and_total_amount.dart';
import 'package:store/views/payment_screen/shipping_address.dart';

import 'payment_options.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [SizedBox(height: 20), PaymentOptions()],
          ),
        ),
      ),
      bottomNavigationBar: const PaymentButtonAndTotal(),
    );
  }
}
