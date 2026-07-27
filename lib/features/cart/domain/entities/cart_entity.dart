import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final String id;
  final int quantity;

  const CartEntity({required this.id, required this.quantity});

  CartEntity copyWith({String? id, int? quantity}) {
    return CartEntity(id: id ?? this.id, quantity: quantity ?? this.quantity);
  }

  @override
  List<Object> get props => [id, quantity];
}
