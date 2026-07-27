import 'package:hive_ce/hive_ce.dart';
import 'package:homeservice/features/cart/domain/entities/cart_entity.dart';

part 'cart_hive_model.g.dart';

@HiveType(typeId: 0)
class CartHiveModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  int quantity;

  CartHiveModel({required this.id, required this.quantity});
  factory CartHiveModel.fromEntity(CartEntity entity) {
    return CartHiveModel(id: entity.id, quantity: entity.quantity);
  }

  CartEntity toEntity() {
    return CartEntity(id: id, quantity: quantity);
  }

  CartHiveModel copyWith({
  String? id,
  int? quantity,
}) {
  return CartHiveModel(
    id: id ?? this.id,
    quantity: quantity ?? this.quantity,
  );
}
}
