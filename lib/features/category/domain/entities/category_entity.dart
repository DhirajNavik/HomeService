import 'package:equatable/equatable.dart';

abstract class CategoryEntity extends Equatable {
  final String id;
  final String? name;
  final String? description;
  final List<String>? assets;
  final String? icon;

  final int? bookings;
  final double? ratings;
  final bool? isActive;

  const CategoryEntity({
    required this.id,
    this.name,
    this.description,
    this.assets,
    this.icon,
    this.bookings,
    this.ratings,
    this.isActive,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    assets,
    icon,
    bookings,
    ratings,
    isActive,
  ];
}
