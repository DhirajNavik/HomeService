part of 'category_details_bloc.dart';

class CategoryDetailsState extends Equatable {
  final bool loading;
  final CategoryEntity? category;
  final String? error;

  const CategoryDetailsState({this.loading = false, this.category, this.error});

  CategoryDetailsState copyWith({
    bool? loading,
    CategoryEntity? category,
    String? error,
  }) {
    return CategoryDetailsState(
      loading: loading ?? this.loading,
      category: category,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loading, category, error];
}
