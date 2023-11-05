import 'associated_object.dart';
import 'package:equatable/equatable.dart';

class EphemeralKeyModel extends Equatable {
  final String? id;
  final String? object;
  final List<AssociatedObject>? associatedObjects;
  final int? created;
  final int? expires;
  final bool? livemode;
  final String? secret;

  const EphemeralKeyModel({
    this.id,
    this.object,
    this.associatedObjects,
    this.created,
    this.expires,
    this.livemode,
    this.secret,
  });

  @override
  List<Object?> get props => [
        id,
        object,
        associatedObjects,
        created,
        expires,
        livemode,
        secret,
      ];

  factory EphemeralKeyModel.fromJson(Map<String, dynamic> json) {
    return EphemeralKeyModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      associatedObjects: (json['associated_objects'] as List<dynamic>?)
          ?.map((e) => AssociatedObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: json['created'] as int?,
      expires: json['expires'] as int?,
      livemode: json['livemode'] as bool?,
      secret: json['secret'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'object': object,
        'associated_objects':
            associatedObjects?.map((e) => e.toJson()).toList(),
        'created': created,
        'expires': expires,
        'livemode': livemode,
        'secret': secret,
      };
}
