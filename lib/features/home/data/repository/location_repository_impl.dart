import 'package:fpdart/fpdart.dart';
import 'package:homeservice/features/home/data/data_sources/location_datasource.dart';
import 'package:homeservice/features/home/domain/entities/location_entity.dart';
import 'package:homeservice/features/home/domain/repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource datasource;

  LocationRepositoryImpl(this.datasource);

  @override
  Future<Either<String, LocationEntity>> getCurrentLocation() async {
    try {
      final model = await datasource.getCurrentLocation();

      return right(model);
    } catch (e) {
      return left(e.toString());
    }
  }
}
