import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:store/controllers/cart_bloc/cart_bloc.dart';
import 'package:store/routes.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc({required CartBloc cartBloc})
      : _cartBloc = cartBloc,
        super(PaymentState(selectedOptionIndex: 0)) {
    on<LoadPaymentScreenEvent>((event, emit) async {
      await AppNavigator.push(route: Routes.paymentScreen);
    });
    on<PaymentOptionSelected>((event, emit) async {
      if (event.selectedOptionIndex != state.selectedOptionIndex) {
        emit(PaymentState(selectedOptionIndex: event.selectedOptionIndex));
      }
    });
  }
  CartBloc _cartBloc;
}
