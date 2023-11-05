import 'package:equatable/equatable.dart';

class Details extends Equatable {
  final String? subtotal;
  final String? shipping;
  final int? shippingDiscount;

  const Details({this.subtotal, this.shipping, this.shippingDiscount});

  @override
  List<Object?> get props => [subtotal, shipping, shippingDiscount];

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        subtotal: json['subtotal'] as String?,
        shipping: json['shipping'] as String?,
        shippingDiscount: json['shipping_discount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };
}
