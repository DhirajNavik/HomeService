import 'package:fpdart/fpdart.dart';
import 'package:homeservice/core/error/exception.dart';
import 'package:homeservice/core/error/failures.dart';
import 'package:homeservice/features/category/data/datasource/category_datasource.dart';
import 'package:homeservice/features/category/domain/entities/category_entity.dart';
import 'package:homeservice/features/category/domain/params/category_details_param.dart';
import 'package:homeservice/features/category/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDataSource dataSource;

  const CategoryRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, CategoryEntity>> fetchCategoryDetails(
    CategoryDetailsParam params,
  ) async {
    try {
      final result = await dataSource.fetchCategoryDetails(params);
      return Right(result);
    } on APIException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('Unexpected error occurred.}'));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> fetchCategories() async {
    try {
      final result = await dataSource.fetchCategories();
      return Right(result);
    } on APIException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Unexpected error occurred.'));
    }
  }
}
