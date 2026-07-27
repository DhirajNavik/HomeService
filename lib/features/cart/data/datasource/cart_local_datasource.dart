import 'package:homeservice/features/cart/data/model/cart_hive_model.dart';

abstract interface class CartLocalDataSource {
  Future<void> save(CartHiveModel model);
  Future<CartHiveModel?> findById(String id);
  Future<List<CartHiveModel>> fetch();
  Future<void> delete(String id);
  Future<void> clear();
}
