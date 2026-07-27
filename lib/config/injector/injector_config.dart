import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce/hive.dart';
import 'package:homeservice/core/dio/network_requester.dart';
import 'package:homeservice/core/routes/app_route_conf.dart';
import 'package:homeservice/features/cart/data/model/cart_hive_model.dart'
    show CartHiveModel;
import 'package:homeservice/features/cart/di/cart_dependency.dart';
import 'package:homeservice/features/category/di/category_dependency.dart';
import 'package:homeservice/features/home/di/location_dependency.dart';
import 'package:homeservice/features/service/di/service_dependency.dart';
import 'package:homeservice/l10n/general_stream.dart';

final serviceLocater = GetIt.instance;

Future<void> initDependencies(String env) async {
  final cartBox = await Hive.openBox<CartHiveModel>(env);
  serviceLocater.registerLazySingleton<Box<CartHiveModel>>(() => cartBox);

  // Core
  serviceLocater.registerLazySingleton<LocaleCubit>(() => LocaleCubit());

  serviceLocater.registerSingleton<GoRouter>(AppRouteConf.router);

  serviceLocater.registerLazySingleton<NetworkRequester>(
    () => NetworkRequester(),
  );

  ServiceDependency.init();
  CategoryDependency.init();
  CartDependency.init();
  LocationDependency.init();
}
