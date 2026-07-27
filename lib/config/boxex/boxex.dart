import 'package:hive_ce/hive_ce.dart';
import 'package:homeservice/features/cart/data/model/cart_hive_model.dart';

class Boxex {
  const Boxex._();
  static Box<CartHiveModel> getData() => Hive.box<CartHiveModel>('cart');
}
