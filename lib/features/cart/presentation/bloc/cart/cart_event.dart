part of 'cart_bloc.dart';

sealed class CartEvent {
  const CartEvent();
}

final class FetchCartEvent extends CartEvent {
  const FetchCartEvent();
}

final class IncrementCartEvent extends CartEvent {
  final String id;

  const IncrementCartEvent(this.id);
}

final class DecrementCartEvent extends CartEvent {
  final String id;

  const DecrementCartEvent(this.id);
}
