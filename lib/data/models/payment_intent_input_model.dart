import 'package:equatable/equatable.dart';

class PaymentIntentInputModel extends Equatable {
  final String? amount;
  final String currency;
  final String customerId;

  const PaymentIntentInputModel({
    required this.customerId,
    required this.amount,
    required this.currency,
  });

  @override
  List<Object?> get props => [customerId, amount, currency];

  Map<String, dynamic> toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
      'customer': customerId,
    };
  }
}
