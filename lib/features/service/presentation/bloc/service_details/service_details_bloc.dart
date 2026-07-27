import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homeservice/features/service/domain/entities/service_entity.dart';
import 'package:homeservice/features/service/domain/usecases/service_details.dart';

part 'service_details_event.dart';
part 'service_details_state.dart';

class ServiceDetailsBloc
    extends Bloc<ServiceDetailsEvent, ServiceDetailsState> {
  final ServiceDetailsUseCase useCase;
  ServiceDetailsBloc(this.useCase) : super(ServiceDetailsState()) {
    on<GetServiceDetails>(_getServiceDetails);
  }

  Future<void> _getServiceDetails(
    GetServiceDetails event,
    Emitter<ServiceDetailsState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: null));

    final result = await useCase(event.id);

    result.fold(
      (failure) {
        emit(state.copyWith(loading: false, error: failure.message));
      },
      (service) {
        emit(state.copyWith(loading: false, service: service, error: null));
      },
    );
  }
}
