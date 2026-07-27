import 'package:fpdart/fpdart.dart';
import 'package:homeservice/core/error/failures.dart';
import 'package:homeservice/features/cart/domain/entities/cart_entity.dart';

abstract interface class CartRepository {
  Future<Either<Failure, void>> increment(String serviceId);

  Future<Either<Failure, void>> decrement(String serviceId);

  Future<Either<Failure, List<CartEntity>>> fetch();
}
