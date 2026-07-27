import 'package:equatable/equatable.dart';

abstract class ServiceEntity extends Equatable {
  final String id;
  final String? category;
  final String? name;
  final String? description;
  final int? price;
  final int? discountPercent;
  final bool? isActive;
  final String? assets;
  final double? finalPrice;

  const ServiceEntity({
    required this.id,
    this.category,
    this.name,
    this.description,
    this.price,
    this.discountPercent,
    this.isActive,
    this.assets,
    this.finalPrice,
  });

  @override
  List<Object?> get props => [
        id,
        category,
        name,
        description,
        price,
        discountPercent,
        isActive,
        assets,
        finalPrice,
      ];
}