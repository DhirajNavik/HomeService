import 'package:fpdart/fpdart.dart';
import 'package:homeservice/core/error/failures.dart';
import 'package:homeservice/core/usecases/usecase.dart';
import 'package:homeservice/features/category/domain/entities/category_entity.dart';
import 'package:homeservice/features/category/domain/repository/category_repository.dart';

class CategoriesUseCase implements UseCase<List<CategoryEntity>, NoParams> {
  final CategoryRepository repository;

  const CategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call([NoParams? params]) {
    return repository.fetchCategories();
  }
}
