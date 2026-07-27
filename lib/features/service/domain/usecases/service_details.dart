import 'package:fpdart/fpdart.dart';
import 'package:homeservice/core/error/failures.dart';
import 'package:homeservice/core/usecases/usecase.dart';
import 'package:homeservice/features/service/domain/entities/service_entity.dart';
import 'package:homeservice/features/service/domain/repositories/service_repository.dart';

class ServiceDetailsUseCase implements UseCase<ServiceEntity, String> {
  final ServiceRepository repository;

  const ServiceDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, ServiceEntity>> call(String id) {
    return repository.fetchServiceDetails(id);
  }
}
