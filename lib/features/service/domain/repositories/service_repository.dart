import 'package:homeservice/core/error/failures.dart';
import 'package:homeservice/features/service/domain/entities/service_entity.dart';
import 'package:homeservice/features/service/domain/params/service_param.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ServiceRepository {
  Future<Either<Failure, List<ServiceEntity>>> fetchServices(
    ServiceParam params,
  );

  Future<Either<Failure, List<ServiceEntity>>> fetchTopRatedServices();

  Future<Either<Failure, ServiceEntity>> fetchServiceDetails(String id);
}
