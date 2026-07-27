import 'package:fpdart/fpdart.dart';
import 'package:homeservice/features/home/domain/entities/location_entity.dart';
import 'package:homeservice/features/home/domain/repository/location_repository.dart';

class GetCurrentLocationUseCase {
  final LocationRepository repository;

  GetCurrentLocationUseCase(this.repository);

  Future<Either<String, LocationEntity>> call() {
    return repository.getCurrentLocation();
  }
}