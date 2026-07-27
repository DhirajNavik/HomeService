import 'package:fpdart/fpdart.dart';
import 'package:homeservice/features/home/domain/entities/location_entity.dart';

abstract interface class LocationRepository {
  Future<Either<String, LocationEntity>> getCurrentLocation();
}