import 'package:homeservice/core/error/failures.dart';
import 'package:homeservice/features/category/domain/entities/category_entity.dart';
import 'package:homeservice/features/category/domain/params/category_details_param.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class CategoryRepository {
  Future<Either<Failure, CategoryEntity>> fetchCategoryDetails(
    CategoryDetailsParam params,
  );
  Future<Either<Failure, List<CategoryEntity>>> fetchCategories();
}
