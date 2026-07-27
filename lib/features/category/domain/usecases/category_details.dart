import 'package:fpdart/fpdart.dart';
import 'package:homeservice/core/error/failures.dart';
import 'package:homeservice/core/usecases/usecase.dart';
import 'package:homeservice/features/category/domain/entities/category_entity.dart';
import 'package:homeservice/features/category/domain/params/category_details_param.dart';
import 'package:homeservice/features/category/domain/repository/category_repository.dart';

class CategoryDetailsUseCase implements UseCase<CategoryEntity, CategoryDetailsParam> {
  final CategoryRepository repository;

  const CategoryDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, CategoryEntity>> call(CategoryDetailsParam params) {
    return repository.fetchCategoryDetails(params);
  }
}
