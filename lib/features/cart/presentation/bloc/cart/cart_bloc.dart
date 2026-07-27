import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homeservice/core/usecases/usecase.dart';
import 'package:homeservice/features/cart/domain/entities/cart_entity.dart';
import 'package:homeservice/features/cart/domain/usecases/save_cart_usecase.dart';
import 'package:homeservice/features/cart/domain/usecases/delete_cart_usecase.dart';
import 'package:homeservice/features/cart/domain/usecases/fetch_cart_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final IncrementCartUseCase saveCartUseCase;
  final DecrementCartUseCase deleteCartUseCase;
  final FetchCartUseCase fetchCartUseCase;

  CartBloc(this.saveCartUseCase, this.deleteCartUseCase, this.fetchCartUseCase)
    : super(const CartState()) {
    on<FetchCartEvent>(_fetchCart);
    on<IncrementCartEvent>(_incrementCart);
    on<DecrementCartEvent>(_decrementCart);
  }

  Future<void> _fetchCart(FetchCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartStatus.loading));

    final result = await fetchCartUseCase(NoParams());

    result.fold(
      (failure) {
        emit(
          state.copyWith(status: CartStatus.failure, message: failure.message),
        );
      },
      (cart) {
        emit(state.copyWith(status: CartStatus.success, carts: cart));
      },
    );
  }

  Future<void> _incrementCart(
    IncrementCartEvent event,
    Emitter<CartState> emit,
  ) async {
    final result = await saveCartUseCase(event.id);

    result.fold(
      (failure) {
        emit(
          state.copyWith(status: CartStatus.failure, message: failure.message),
        );
      },
      (_) {
        add(const FetchCartEvent());
      },
    );
  }

  Future<void> _decrementCart(
    DecrementCartEvent event,
    Emitter<CartState> emit,
  ) async {
    final result = await deleteCartUseCase(event.id);

    result.fold(
      (failure) {
        emit(
          state.copyWith(status: CartStatus.failure, message: failure.message),
        );
      },
      (_) {
        add(const FetchCartEvent());
      },
    );
  }
}
