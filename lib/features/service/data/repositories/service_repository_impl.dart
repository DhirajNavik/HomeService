import 'package:fpdart/fpdart.dart';
import 'package:homeservice/core/error/exception.dart';
import 'package:homeservice/core/error/failures.dart';
import 'package:homeservice/features/service/data/datasource/service_datasource.dart';
import 'package:homeservice/features/service/domain/entities/service_entity.dart';
import 'package:homeservice/features/service/domain/params/service_param.dart';
import 'package:homeservice/features/service/domain/repositories/service_repository.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceDataSource dataSource;

  const ServiceRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<ServiceEntity>>> fetchServices(
    ServiceParam params,
  ) async {
    try {
      final result = await dataSource.fetchServices(params);
      return Right(result);
    } on APIException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Unexpected error occurred.'));
    }
  }

  @override
  Future<Either<Failure, List<ServiceEntity>>> fetchTopRatedServices() async {
    try {
      final result = await dataSource.fetchTopRatedServices();
      return Right(result);
    } on APIException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Unexpected error occurred.'));
    }
  }

  @override
  Future<Either<Failure, ServiceEntity>> fetchServiceDetails(String id) async {
    try {
      final result = await dataSource.getServiceDetails(id);
      return Right(result);
    } on APIException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Unexpected error occurred.'));
    }
  }
}
