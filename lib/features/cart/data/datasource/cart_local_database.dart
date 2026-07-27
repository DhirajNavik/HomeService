import 'package:hive_ce/hive_ce.dart';
import 'package:homeservice/features/cart/data/model/cart_hive_model.dart';

import 'cart_local_datasource.dart';

class CartLocalDatabase implements CartLocalDataSource {
  final Box<CartHiveModel> _box;

  const CartLocalDatabase(this._box);

  @override
  Future<void> save(CartHiveModel model) async {
    await _box.put(model.id, model);
  }

  @override
  Future<List<CartHiveModel>> fetch() async {
    return _box.values.toList();
  }

  @override
  Future<void> delete(String id) async {
    await _box.delete(id);
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }

  @override
  Future<CartHiveModel?> findById(String id) async {
    return _box.get(id);
  }
}
