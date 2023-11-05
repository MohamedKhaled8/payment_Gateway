import 'package:equatable/equatable.dart';

class OrderItemModel extends Equatable {
  final String? name;
  final int? quantity;
  final String? price;
  final String? currency;

  const OrderItemModel({this.name, this.quantity, this.price, this.currency});

  @override
  List<Object?> get props => [name, quantity, price, currency];

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
        name: json['name'] as String?,
        quantity: json['quantity'] as int?,
        price: json['price'] as String?,
        currency: json['currency'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };
}
