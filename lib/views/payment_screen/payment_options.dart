import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/controllers/payment_bloc/payment_bloc.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PaymentBloc paymentBloc = BlocProvider.of<PaymentBloc>(context);
    return Column(
      children: [
        BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            return SizedBox(
              height: 170,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: state.options
                    .asMap()
                    .map((i, item) => MapEntry(
                          i,
                          RadioListTile(
                            title: Text(item),
                            value: i,
                            groupValue: state.selectedOptionIndex,
                            onChanged: (value) {
                              paymentBloc.add(
                                PaymentOptionSelected(selectedOptionIndex: i),
                              );
                            },
                          ),
                        ))
                    .values
                    .toList(),
              ),
            );
          },
        )
      ],
    );
  }
}
