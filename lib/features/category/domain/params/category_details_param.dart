import 'package:equatable/equatable.dart';

class CategoryDetailsParam extends Equatable {
  final String id;

  const CategoryDetailsParam({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}