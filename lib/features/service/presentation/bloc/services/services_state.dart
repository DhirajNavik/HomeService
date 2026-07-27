part of 'services_bloc.dart';

class ServicesState extends Equatable {
  final bool loading;
  final List<ServiceEntity>? services;
  final String? error;

  const ServicesState({this.loading = false, this.services, this.error});

  ServicesState copyWith({
    bool? loading,
    List<ServiceEntity>? services,
    String? error,
  }) {
    return ServicesState(
      loading: loading ?? this.loading,
      services: services ?? this.services,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loading, services, error];
}
