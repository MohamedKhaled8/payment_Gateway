import 'package:dartz/dartz.dart';
import 'package:paymentgetway/core/errors/failures.dart';
import 'package:paymentgetway/data/models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}