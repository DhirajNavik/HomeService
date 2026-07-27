import 'package:homeservice/core/dio/network_requester.dart';
import 'package:homeservice/core/utils/app_urls.dart';
import 'package:homeservice/features/category/data/datasource/category_datasource.dart';
import 'package:homeservice/features/category/data/model/category_model.dart';
import 'package:homeservice/features/category/domain/params/category_details_param.dart';

class CategoryDio implements CategoryDataSource {
  final NetworkRequester _network;

  const CategoryDio(this._network);

  @override
  Future<CategoryModel> fetchCategoryDetails(
    CategoryDetailsParam params,
  ) async {
    final response = await _network.get("${URLs.categoryDetails}/${params.id}");
    return CategoryModel.fromJson(response['data']);
  }

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final response = await _network.get(URLs.categories);

    return (response['data'] as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }
}
