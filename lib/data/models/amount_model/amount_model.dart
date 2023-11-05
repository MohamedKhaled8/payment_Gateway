import 'details.dart';
import 'package:equatable/equatable.dart';

class AmountModel extends Equatable {
  final String? total;
  final String? currency;
  final Details? details;

  const AmountModel({
    required this.total,
    required this.currency,
    required this.details,
  });

  @override
  List<Object?> get props => [total, currency, details];

  factory AmountModel.fromJson(Map<String, dynamic> json) => AmountModel(
        total: json['total'] as String?,
        currency: json['currency'] as String?,
        details: json['details'] == null
            ? null
            : Details.fromJson(json['details'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'currency': currency,
        'details': details?.toJson(),
      };
}
