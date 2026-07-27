import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homeservice/features/service/domain/entities/service_entity.dart';
import 'package:homeservice/features/service/domain/params/service_param.dart';
import 'package:homeservice/features/service/domain/usecases/services.dart';
import 'package:homeservice/features/service/domain/usecases/top_rated_services.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final ServicesUseCase useCase;
  final TopRatedServicesUseCase topRatedServicesUseCase;

  ServicesBloc(this.useCase, this.topRatedServicesUseCase)
    : super(const ServicesState()) {
    on<GetServices>(_getServices);
    on<GetTopRatedServices>(_getTopRatedServices);
  }

  Future<void> _getServices(
    GetServices event,
    Emitter<ServicesState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: null));

    final result = await useCase(ServiceParam(categoryID: event.categoryId));

    result.fold(
      (failure) {
        emit(state.copyWith(loading: false, error: failure.message));
      },
      (service) {
        emit(state.copyWith(loading: false, services: service, error: null));
      },
    );
  }

  Future<void> _getTopRatedServices(
    GetTopRatedServices event,
    Emitter<ServicesState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: null));

    final result = await topRatedServicesUseCase();

    result.fold(
      (failure) {
        emit(state.copyWith(loading: false, error: failure.message));
      },
      (service) {
        emit(state.copyWith(loading: false, services: service, error: null));
      },
    );
  }
}
