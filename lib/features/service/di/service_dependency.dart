import 'package:homeservice/config/injector/injector_config.dart';
import 'package:homeservice/features/service/data/datasource/service_datasource.dart';
import 'package:homeservice/features/service/data/datasource/service_dio.dart';
import 'package:homeservice/features/service/data/repositories/service_repository_impl.dart';
import 'package:homeservice/features/service/domain/repositories/service_repository.dart';
import 'package:homeservice/features/service/domain/usecases/service_details.dart';
import 'package:homeservice/features/service/domain/usecases/services.dart';
import 'package:homeservice/features/service/domain/usecases/top_rated_services.dart';
import 'package:homeservice/features/service/presentation/bloc/service_details/service_details_bloc.dart';
import 'package:homeservice/features/service/presentation/bloc/services/services_bloc.dart';

class ServiceDependency {
  const ServiceDependency._();
  static void init() {
    // DataSource
    serviceLocater.registerLazySingleton<ServiceDataSource>(
      () => ServiceDio(serviceLocater()),
    );

    // Repository
    serviceLocater.registerLazySingleton<ServiceRepository>(
      () => ServiceRepositoryImpl(serviceLocater()),
    );

    // UseCase
    serviceLocater.registerLazySingleton<ServicesUseCase>(
      () => ServicesUseCase(serviceLocater()),
    );
    serviceLocater.registerLazySingleton<ServiceDetailsUseCase>(
      () => ServiceDetailsUseCase(serviceLocater()),
    );

    serviceLocater.registerLazySingleton<TopRatedServicesUseCase>(
      () => TopRatedServicesUseCase(serviceLocater()),
    );

    // Bloc
    serviceLocater.registerFactory<ServicesBloc>(
      () => ServicesBloc(serviceLocater(), serviceLocater()),
    );
    serviceLocater.registerFactory<ServiceDetailsBloc>(
      () => ServiceDetailsBloc(serviceLocater()),
    );
  }
}
