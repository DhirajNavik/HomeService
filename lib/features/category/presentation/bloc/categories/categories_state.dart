part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  final bool loading;
  final List<CategoryEntity>? categories;
  final String? error;

  const CategoriesState({this.loading = false, this.categories, this.error});

  CategoriesState copyWith({
    bool? loading,
    List<CategoryEntity>? categories,
    String? error,
  }) {
    return CategoriesState(
      loading: loading ?? this.loading,
      categories: categories ?? this.categories,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loading, categories, error];
}
