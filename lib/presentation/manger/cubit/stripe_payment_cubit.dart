import 'dart:developer';
import 'package:bloc/bloc.dart';
import '../../view/my_cart_view.dart';
import 'package:flutter/material.dart';
import '../../view/thank_you_view.dart';
import 'package:equatable/equatable.dart';
import '../../../core/helper/api_keys.dart';
import '../../../data/models/amount_model/amount_model.dart';
import 'package:paymentgetway/data/repos/check_out_repo.dart';
import '../../../data/models/item_list_model/item_list_model.dart';
import 'package:paymentgetway/data/models/payment_intent_input_model.dart';
part 'stripe_payment_state.dart';





class PaymentCubit extends Cubit<PaymentState> {
  final CheckoutRepo checkoutRepo;
  PaymentCubit(
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
  void exceutePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transctionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => 
      
      PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": transctionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transctionsData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const ThankYouView();
            }),
            (route) {
              if (route.settings.name == '/') {
                return true;
              } else {
                return false;
              }
            },
          );
        },
        onError: (error) {
          SnackBar snackBar = SnackBar(content: Text(error.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const MyCartView();
            }),
            (route) {
              return false;
            },
          );
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }
}
