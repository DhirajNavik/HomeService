import 'package:homeservice/features/category/data/model/category_model.dart';
import 'package:homeservice/features/category/domain/params/category_details_param.dart';

abstract interface class CategoryDataSource {
  Future<List<CategoryModel>> fetchCategories();
  Future<CategoryModel> fetchCategoryDetails(CategoryDetailsParam params);
}
