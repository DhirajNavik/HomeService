import 'package:fpdart/fpdart.dart';
import 'package:homeservice/core/error/failures.dart';
import 'package:homeservice/core/usecases/usecase.dart';
import 'package:homeservice/features/service/domain/entities/service_entity.dart';
import 'package:homeservice/features/service/domain/params/service_param.dart';
import 'package:homeservice/features/service/domain/repositories/service_repository.dart';

class ServicesUseCase
    implements UseCase<List<ServiceEntity>, ServiceParam> {
  final ServiceRepository repository;

  const ServicesUseCase(this.repository);

  @override
  Future<Either<Failure, List<ServiceEntity>>> call(ServiceParam params) {
    return repository.fetchServices(params);
  }
}
