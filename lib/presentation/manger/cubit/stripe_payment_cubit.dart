import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:paymentgetway/data/repos/check_out_repo.dart';
import 'package:paymentgetway/data/models/payment_intent_input_model.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  final CheckoutRepo checkoutRepo;
  StripePaymentCubit(
    this.checkoutRepo,
  ) : super(StripePaymentInitial());

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());

    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    data.fold(
      (l) => emit(PaymentFailure(l.errMessage)),
      (r) => emit(
        PaymentSuccess(),
      ),
    );
  }

  void excuteStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel =
        const PaymentIntentInputModel(
      amount: '100',
      currency: 'USD',
      customerId: 'cus_Ox4eRyZjzeS8Ll',
    );
    makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }
}
