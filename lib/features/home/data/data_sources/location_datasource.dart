import 'package:homeservice/features/home/domain/entities/location_entity.dart';

abstract interface class LocationDataSource {
  Future<LocationEntity> getCurrentLocation();
}