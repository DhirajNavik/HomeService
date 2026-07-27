part of 'service_details_bloc.dart';

abstract class ServiceDetailsEvent extends Equatable {
  const ServiceDetailsEvent();

  @override
  List<Object?> get props => [];
}

class GetServiceDetails extends ServiceDetailsEvent {
  final String id;

  const GetServiceDetails(this.id);

  @override
  List<Object?> get props => [id];
}