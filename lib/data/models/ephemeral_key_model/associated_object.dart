import 'package:equatable/equatable.dart';

class AssociatedObject extends Equatable {
  final String? id;
  final String? type;

  const AssociatedObject({this.id, this.type});

  @override
  List<Object?> get props => [id, type];

  factory AssociatedObject.fromJson(Map<String, dynamic> json) {
    return AssociatedObject(
      id: json['id'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
      };
}
