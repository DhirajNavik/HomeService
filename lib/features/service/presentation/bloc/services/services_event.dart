part of 'services_bloc.dart';

abstract class ServicesEvent extends Equatable {
  const ServicesEvent();

  @override
  List<Object?> get props => [];
}

class GetServices extends ServicesEvent {
  final String categoryId;

  const GetServices(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}

class GetTopRatedServices extends ServicesEvent {

  const GetTopRatedServices();

  @override
  List<Object?> get props => [];
}