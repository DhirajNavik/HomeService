import 'package:homeservice/config/injector/injector_config.dart';
import 'package:homeservice/features/category/data/datasource/category_datasource.dart';
import 'package:homeservice/features/category/data/datasource/category_dio.dart';
import 'package:homeservice/features/category/data/repository/category_repository_impl.dart';
import 'package:homeservice/features/category/domain/repository/category_repository.dart';
import 'package:homeservice/features/category/domain/usecases/categories.dart';
import 'package:homeservice/features/category/domain/usecases/category_details.dart';
import 'package:homeservice/features/category/presentation/bloc/categories/categories_bloc.dart';
import 'package:homeservice/features/category/presentation/bloc/category_details/category_details_bloc.dart';

class CategoryDependency {
  const CategoryDependency._();
  static void init() {
    // DataSource
    serviceLocater.registerLazySingleton<CategoryDataSource>(
      () => CategoryDio(serviceLocater()),
    );

    // Repository
    serviceLocater.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(serviceLocater()),
    );

    // UseCase
    serviceLocater.registerLazySingleton<CategoryDetailsUseCase>(
      () => CategoryDetailsUseCase(serviceLocater()),
    );
    serviceLocater.registerLazySingleton<CategoriesUseCase>(
      () => CategoriesUseCase(serviceLocater()),
    );

    // Bloc
    serviceLocater.registerFactory<CategoryDetailsBloc>(
      () => CategoryDetailsBloc(serviceLocater()),
    );

    serviceLocater.registerFactory<CategoriesBloc>(
      () => CategoriesBloc(serviceLocater()),
    );
  }
}
