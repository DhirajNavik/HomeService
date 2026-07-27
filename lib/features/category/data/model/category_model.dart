import 'package:homeservice/features/category/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    super.name,
    super.description,
    super.assets,
    super.icon,
    super.bookings,
    super.ratings,
    super.isActive,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? json['_id'],
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      description: json['description'] as String?,
      assets: List<String>.from(json['assets'] ?? const []),
      bookings: json['bookings'] as int?,
      ratings: (json['ratings'] as num?)?.toDouble(),
      isActive: json['isActive'] as bool?,
    );
  }
}
