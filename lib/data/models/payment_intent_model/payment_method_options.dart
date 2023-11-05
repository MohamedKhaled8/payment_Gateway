import 'card.dart';
import 'package:equatable/equatable.dart';

class PaymentMethodOptions extends Equatable {
  final Card? card;

  const PaymentMethodOptions({this.card});

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    return PaymentMethodOptions(
      card: json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'card': card?.toJson(),
      };

  @override
  List<Object?> get props => [card];

  @override
  bool get stringify => true;
}
