import 'package:equatable/equatable.dart';

class ServiceParam extends Equatable {
  final String categoryID;

  const ServiceParam({
    required this.categoryID,
  });

  @override
  List<Object> get props => [categoryID];
}