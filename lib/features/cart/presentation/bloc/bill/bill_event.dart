part of 'bill_bloc.dart';

abstract class BillEvent extends Equatable {
  const BillEvent();

  @override
  List<Object?> get props => [];
}

class UpdateBillEvent extends BillEvent {
  final String id;
  final double price;
  final int quantity;

  const UpdateBillEvent({
    required this.id,
    required this.price,
    required this.quantity,
  });

  @override
  List<Object?> get props => [id, price, quantity];
}