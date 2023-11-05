part of 'stripe_payment_cubit.dart';

sealed class StripePaymentState extends Equatable {
  const StripePaymentState();

  @override
  List<Object> get props => [];
}

final class StripePaymentInitial extends StripePaymentState {}

final class PaymentLoading extends StripePaymentState {}

final class PaymentSuccess extends StripePaymentState {}

final class PaymentFailure extends StripePaymentState {
  final String errMessage;

  const PaymentFailure(this.errMessage);
}
