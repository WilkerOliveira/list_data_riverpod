import 'package:equatable/equatable.dart';
import 'package:list_data_riverpod/modules/properties/domain/entities/property_entity.dart';

class PropertyModel extends Equatable {
  const PropertyModel({
    required this.picture,
    required this.address,
    required this.price,
  });

  final String? picture;
  final String address;
  final double price;

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      picture: json['picture'] as String?,
      address: json['address'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  PropertyEntity toEntity() {
    return PropertyEntity(picture: picture, address: address, price: price);
  }

  static List<PropertyModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => PropertyModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  List<Object?> get props => [picture, address, price];
}
