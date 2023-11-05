import 'tip.dart';
import 'package:equatable/equatable.dart';

class AmountDetails extends Equatable {
  final Tip? tip;

  const AmountDetails({this.tip});

  factory AmountDetails.fromJson(Map<String, dynamic> json) => AmountDetails(
        tip: json['tip'] == null
            ? null
            : Tip.fromJson(json['tip'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'tip': tip?.toJson(),
      };

  @override
  List<Object?> get props => [tip];

  @override
  bool get stringify => true;
}
