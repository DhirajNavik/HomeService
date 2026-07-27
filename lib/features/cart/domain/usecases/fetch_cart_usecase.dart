import 'package:fpdart/fpdart.dart';
import 'package:homeservice/core/error/failures.dart';
import 'package:homeservice/core/usecases/usecase.dart';
import 'package:homeservice/features/cart/domain/entities/cart_entity.dart';
import 'package:homeservice/features/cart/domain/repository/cart_repository.dart';

class FetchCartUseCase implements UseCase<List<CartEntity>, NoParams> {
  final CartRepository repository;

  const FetchCartUseCase(this.repository);

  @override
  Future<Either<Failure, List<CartEntity>>> call(NoParams params) {
    return repository.fetch();
  }
}
