import 'package:fpdart/fpdart.dart';
import 'package:homeservice/core/error/exception.dart';
import 'package:homeservice/core/error/failures.dart';
import 'package:homeservice/features/cart/data/datasource/cart_local_datasource.dart';
import 'package:homeservice/features/cart/data/model/cart_hive_model.dart';
import 'package:homeservice/features/cart/domain/entities/cart_entity.dart';
import 'package:homeservice/features/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource dataSource;

  const CartRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<CartEntity>>> fetch() async {
    try {
      final models = await dataSource.fetch();

      final entities = models.map((e) => e.toEntity()).toList();

      return Right(entities);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> decrement(String serviceId) async {
    try {
      final cart = await dataSource.findById(serviceId);

      if (cart == null) {
        return const Right(null);
      }

      if (cart.quantity == 1) {
        await dataSource.delete(serviceId);
      } else {
        await dataSource.save(cart.copyWith(quantity: cart.quantity - 1));
      }
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> increment(String serviceId) async {
    try {
      final cart = await dataSource.findById(serviceId);
      if (cart == null) {
        await dataSource.save(CartHiveModel(id: serviceId, quantity: 1));
      } else {
        await dataSource.save(cart.copyWith(quantity: cart.quantity + 1));
      }
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}
