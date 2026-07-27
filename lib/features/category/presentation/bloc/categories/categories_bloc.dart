import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homeservice/features/category/domain/entities/category_entity.dart';
import 'package:homeservice/features/category/domain/usecases/categories.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc
    extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesUseCase useCase;

  CategoriesBloc(this.useCase) : super(const CategoriesState()) {
    on<GetCategories>(_getCategories);
  }

  Future<void> _getCategories(
    GetCategories event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: null));

    final result = await useCase();

    result.fold(
      (failure) {
        emit(state.copyWith(loading: false, error: failure.message));
      },
      (categories) {
        emit(state.copyWith(loading: false, categories: categories, error: null));
      },
    );
  }
}
