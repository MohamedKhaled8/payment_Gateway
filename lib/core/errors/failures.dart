import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});
}

class PaymentErrorHandlingService {
  Either<Failure, void> handlePaymentException(dynamic e) {
    try {
      if (e is StripeException) {
        return Left(ServerFailure(
          errMessage: e.error.message ?? 'Oops there was an error',
        ));
      } else {
        return Left(ServerFailure(errMessage: e.toString()));
      }
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
