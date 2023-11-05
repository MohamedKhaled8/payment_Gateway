import 'item.dart';
import 'package:equatable/equatable.dart';

class ItemListModel extends Equatable {
  final List<OrderItemModel>? orders;

  const ItemListModel({this.orders});

  @override
  List<Object?> get props => [orders];

  factory ItemListModel.fromJson(Map<String, dynamic> json) => ItemListModel(
        orders: (json['items'] as List<dynamic>?)
            ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'items': orders?.map((e) => e.toJson()).toList(),
      };
}
