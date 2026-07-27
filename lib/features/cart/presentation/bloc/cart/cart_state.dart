part of 'cart_bloc.dart';

enum CartStatus { initial, loading, success, failure }

class CartState extends Equatable {
  final CartStatus status;
  final List<CartEntity> carts;
  final String? message;

  const CartState({
    this.status = CartStatus.initial,
    this.carts = const [],
    this.message,
  });

  CartState copyWith({
    CartStatus? status,
    List<CartEntity>? carts,
    String? message,
  }) {
    return CartState(
      status: status ?? this.status,
      carts: carts ?? this.carts,
      message: message,
    );
  }

  Map<String, CartEntity> get cartMap => {
    for (final item in carts) item.id: item,
  };

  @override
  List<Object?> get props => [status, carts, message];
}
