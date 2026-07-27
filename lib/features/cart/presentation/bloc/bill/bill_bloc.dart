import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bill_event.dart';
part 'bill_state.dart';

class BillBloc extends Bloc<BillEvent, BillState> {
  BillBloc() : super(const BillState()) {
    on<UpdateBillEvent>(_updateBill);
  }

  void _updateBill(UpdateBillEvent event, Emitter<BillState> emit) {
    final items = Map<String, BillItem>.from(state.items);

    if (event.quantity <= 0) {
      items.remove(event.id);
    } else {
      items[event.id] = BillItem(price: event.price, quantity: event.quantity);
    }

    emit(state.copyWith(items: items));
  }
}
