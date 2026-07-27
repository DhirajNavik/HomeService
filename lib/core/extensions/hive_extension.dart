import 'package:homeservice/features/cart/data/model/cart_hive_model.dart';
import 'package:homeservice/features/cart/domain/entities/cart_entity.dart';

extension CartHiveMapper on CartHiveModel {
  CartEntity toEntity() {
    return CartEntity(id: id, quantity: quantity);
  }
}

extension FirstWhereOrNullExtension<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
