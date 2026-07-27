import 'package:fpdart/fpdart.dart';
import 'package:homeservice/core/error/failures.dart';
import 'package:homeservice/core/usecases/usecase.dart';
import 'package:homeservice/features/service/domain/entities/service_entity.dart';
import 'package:homeservice/features/service/domain/repositories/service_repository.dart';

class TopRatedServicesUseCase
    implements UseCase<List<ServiceEntity>, NoParams> {
  final ServiceRepository repository;

  const TopRatedServicesUseCase(this.repository);

  @override
  Future<Either<Failure, List<ServiceEntity>>> call([NoParams? params]) {
    return repository.fetchTopRatedServices();
  }
}
