part of 'category_details_bloc.dart';


abstract class CategoryDetailsEvent extends Equatable {
  const CategoryDetailsEvent();

  @override
  List<Object?> get props => [];
}

class GetCategoryDetails extends CategoryDetailsEvent {
  final String id;

  const GetCategoryDetails(this.id);

  @override
  List<Object?> get props => [id];
}
