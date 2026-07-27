import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeservice/core/extensions/context_extension.dart';
import 'package:homeservice/core/utils/dimens.dart';
import 'package:homeservice/features/cart/presentation/bloc/bill/bill_bloc.dart';

class BillDetailsCard extends StatelessWidget {
  final BillBloc bloc;
  const BillDetailsCard({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    Widget row(String title, String value, {bool bold = false}) {
      return Padding(
        padding: .symmetric(vertical: Dimens.verPaddingX2),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: bold
                    ? textTheme.titleMedium?.copyWith(fontWeight: .w700)
                    : textTheme.bodyMedium,
              ),
            ),
            Text(
              value,
              style: bold
                  ? textTheme.titleMedium?.copyWith(fontWeight: .w700)
                  : textTheme.bodyMedium,
            ),
          ],
        ),
      );
    }

    return BlocBuilder<BillBloc, BillState>(
      bloc: bloc,
      builder: (context, state) {
        return Container(
          padding: .all(Dimens.allPaddingX5),
          decoration: BoxDecoration(
            color: context.cardColor,
            borderRadius: .circular(Dimens.radiusX4),
          ),
          child: Column(
            spacing: Dimens.gapX2,
            children: [
              Align(
                alignment: .centerLeft,
                child: Text(
                  "Bill Details",
                  style: textTheme.titleLarge?.copyWith(fontWeight: .w700),
                ),
              ),

              Column(
                children: [
                  row("Item Total", "₹${state.itemTotal}"),
                  row("Platform Fee", "₹${state.platformFee}"),
                  row("Discount", "₹${state.discount}"),
                ],
              ),

              const Divider(height: 2),

              row("To Pay", "₹${state.total}", bold: true),
            ],
          ),
        );
      },
    );
  }
}
