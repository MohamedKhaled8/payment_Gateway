import 'package:equatable/equatable.dart';

class InitPaymentSheetInputModel extends Equatable {
  final String clientSecret;
  final String customerId;
  final String ephemeralKeySecret;

  const InitPaymentSheetInputModel({
    required this.clientSecret,
    required this.customerId,
    required this.ephemeralKeySecret,
  });

  @override
  List<Object?> get props => [clientSecret, customerId, ephemeralKeySecret];
}
