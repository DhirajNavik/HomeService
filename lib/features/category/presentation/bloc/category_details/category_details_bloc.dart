import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homeservice/features/category/domain/entities/category_entity.dart';
import 'package:homeservice/features/category/domain/params/category_details_param.dart';
import 'package:homeservice/features/category/domain/usecases/category_details.dart';

part 'category_details_event.dart';
part 'category_details_state.dart';

class CategoryDetailsBloc extends Bloc<CategoryDetailsEvent, CategoryDetailsState> {
  final CategoryDetailsUseCase useCase;
  CategoryDetailsBloc(this.useCase) : super(const CategoryDetailsState()) {
    on<GetCategoryDetails>(_getCategoryDetails);
  }

  Future<void> _getCategoryDetails(
    GetCategoryDetails event,
    Emitter<CategoryDetailsState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: null));

    final result = await useCase(CategoryDetailsParam(id: event.id));
    result.fold(
      (failure) {
        emit(state.copyWith(loading: false, error: failure.message));
      },
      (category) {
        emit(state.copyWith(loading: false, category: category, error: null));
      },
    );
  }
}
