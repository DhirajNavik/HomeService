part of 'service_details_bloc.dart';

class ServiceDetailsState extends Equatable {
  final bool loading;
  final ServiceEntity? service;
  final String? error;

  const ServiceDetailsState({this.loading = false, this.service, this.error});

  ServiceDetailsState copyWith({
    bool? loading,
    ServiceEntity? service,
    String? error,
  }) {
    return ServiceDetailsState(
      loading: loading ?? this.loading,
      service: service ,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loading, service, error];
}
