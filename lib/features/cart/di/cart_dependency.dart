import 'package:homeservice/config/injector/injector_config.dart';
import 'package:homeservice/features/cart/data/datasource/cart_local_datasource.dart';
import 'package:homeservice/features/cart/data/datasource/cart_local_database.dart';
import 'package:homeservice/features/cart/data/repository/cart_repository_impl.dart';
import 'package:homeservice/features/cart/domain/repository/cart_repository.dart';
import 'package:homeservice/features/cart/domain/usecases/save_cart_usecase.dart';
import 'package:homeservice/features/cart/domain/usecases/delete_cart_usecase.dart';
import 'package:homeservice/features/cart/domain/usecases/fetch_cart_usecase.dart';
import 'package:homeservice/features/cart/presentation/bloc/bill/bill_bloc.dart';
import 'package:homeservice/features/cart/presentation/bloc/cart/cart_bloc.dart';

class CartDependency {
  const CartDependency._();
  static void init() {
    // DataSource
    serviceLocater.registerLazySingleton<CartLocalDataSource>(
      () => CartLocalDatabase(serviceLocater()),
    );

    // Repository
    serviceLocater.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(serviceLocater()),
    );

    // UseCase
    serviceLocater.registerLazySingleton(
      () => IncrementCartUseCase(serviceLocater()),
    );

    serviceLocater.registerLazySingleton(
      () => DecrementCartUseCase(serviceLocater()),
    );

    serviceLocater.registerLazySingleton(
      () => FetchCartUseCase(serviceLocater()),
    );

    // Bloc
    serviceLocater.registerLazySingleton<CartBloc>(
      () => CartBloc(
        serviceLocater<IncrementCartUseCase>(),
        serviceLocater<DecrementCartUseCase>(),
        serviceLocater<FetchCartUseCase>(),
      ),
    );
    serviceLocater.registerFactory<BillBloc>(() => BillBloc());
  }
}
