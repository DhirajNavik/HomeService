import 'package:homeservice/config/injector/injector_config.dart';
import 'package:homeservice/features/home/data/data_sources/location_datasource.dart';
import 'package:homeservice/features/home/data/data_sources/location_datasource_impl.dart';
import 'package:homeservice/features/home/data/repository/location_repository_impl.dart';
import 'package:homeservice/features/home/domain/repository/location_repository.dart';
import 'package:homeservice/features/home/domain/usecases/get_current_location.dart';
import 'package:homeservice/features/home/presentation/cubit/location_cubit.dart';

class LocationDependency {
  const LocationDependency._();
  static void init() {
    // DataSource
    serviceLocater.registerLazySingleton<LocationDataSource>(
      () => LocationDataSourceImpl(),
    );

    // Repository
    serviceLocater.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImpl(serviceLocater()),
    );

    // UseCase

    serviceLocater.registerLazySingleton(
      () => GetCurrentLocationUseCase(serviceLocater()),
    );

    // Cubit
    serviceLocater.registerLazySingleton<LocationCubit>(
      () => LocationCubit(serviceLocater()),
    );
  }
}
