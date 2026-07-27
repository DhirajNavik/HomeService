part of 'bill_bloc.dart';

class BillItem extends Equatable {
  final double price;
  final int quantity;

  const BillItem({required this.price, required this.quantity});

  @override
  List<Object?> get props => [price, quantity];
}

class BillState extends Equatable {
  final Map<String, BillItem> items;

  const BillState({this.items = const {}});

  double get itemTotal =>
      items.values.fold(0.0, (sum, item) => sum + item.price * item.quantity);

  double get platformFee => items.isEmpty ? 0 : 19;

  double get discount => 0;

  double get total => itemTotal + platformFee - discount;

  BillState copyWith({Map<String, BillItem>? items}) {
    return BillState(items: items ?? this.items);
  }

  @override
  List<Object?> get props => [items];
}
