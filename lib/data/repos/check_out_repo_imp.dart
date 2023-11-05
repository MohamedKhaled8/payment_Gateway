import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymentgetway/core/errors/failures.dart';
import 'package:paymentgetway/data/repos/check_out_repo.dart';
import 'package:paymentgetway/core/services/stripe_service.dart';
import 'package:paymentgetway/data/models/payment_intent_input_model.dart';

class CheckOutRepoImp extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);

      return right(null);
    } on StripeException catch (e) {
      return left(ServerFailure(
          errMessage: e.error.message ?? 'Oops there was an error'));
    } catch (e) {
      return PaymentErrorHandlingService().handlePaymentException(e);
    }
  }
}
