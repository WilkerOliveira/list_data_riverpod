import 'package:equatable/equatable.dart';

class PropertyEntity extends Equatable {
  final String? picture;
  final String address;
  final double price;

  const PropertyEntity({
    required this.picture,
    required this.address,
    required this.price,
  });

  @override
  List<Object?> get props => [picture, address, price];
}
