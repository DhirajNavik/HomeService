import 'package:homeservice/features/service/domain/entities/service_entity.dart';

class ServiceModel extends ServiceEntity {
  const ServiceModel({
    required super.id,
    super.category,
    super.name,
    super.description,
    super.price,
    super.discountPercent,
    super.isActive,
    super.assets,
    super.finalPrice,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] ?? json['_id'],
      category: json['category'],
      name: json['name'],
      description: json['description'],
      price: json['price'] as int?,
      discountPercent: json['discountPercent'] as int?,
      isActive: json['isActive'] as bool?,
      assets: json['assets'] as String?,
      finalPrice: (json['finalPrice'] as num?)?.toDouble(),
    );
  }
}
