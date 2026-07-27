import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homeservice/features/home/domain/entities/location_entity.dart';
import 'package:homeservice/features/home/domain/usecases/get_current_location.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final GetCurrentLocationUseCase getCurrentLocationUsecase;

  LocationCubit(this.getCurrentLocationUsecase) : super(LocationInitial());

  Future<void> getCurrentLocation() async {
    emit(LocationLoading());

    final result = await getCurrentLocationUsecase();

    result.fold(
      (failure) => emit(LocationError(failure)),
      (location) => emit(LocationLoaded(location)),
    );
  }
}
