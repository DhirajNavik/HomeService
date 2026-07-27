import 'package:fpdart/fpdart.dart';
import 'package:homeservice/core/error/failures.dart';
import 'package:homeservice/core/usecases/usecase.dart';
import 'package:homeservice/features/cart/domain/repository/cart_repository.dart';

class IncrementCartUseCase implements UseCase<void, String> {
  final CartRepository repository;

  const IncrementCartUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String serviceId) {
    return repository.increment(serviceId);
  }
}
