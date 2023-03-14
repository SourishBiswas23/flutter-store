part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class LoadPaymentScreenEvent extends PaymentEvent {}

class PaymentOptionSelected extends PaymentEvent {
  const PaymentOptionSelected({required this.selectedOptionIndex});
  final int selectedOptionIndex;
  @override
  List<Object> get props => [selectedOptionIndex];
}
