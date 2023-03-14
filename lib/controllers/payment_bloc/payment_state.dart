part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  PaymentState({required this.selectedOptionIndex});
  final List<String> options = [
    'Cash On Delivery',
    'Credit Card',
    'Debit Card'
  ];
  final int selectedOptionIndex;
  @override
  List<Object> get props => [options, selectedOptionIndex];
}
