import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeservice/config/injector/injector_config.dart';
import 'package:homeservice/core/components/common_appbar.dart';
import 'package:homeservice/core/extensions/context_extension.dart';
import 'package:homeservice/core/extensions/padding_extension.dart';
import 'package:homeservice/core/utils/dimens.dart';
import 'package:homeservice/core/utils/sizedBox.dart';
import 'package:homeservice/features/cart/presentation/bloc/bill/bill_bloc.dart';
import 'package:homeservice/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:homeservice/features/cart/presentation/components/bill_details_card.dart';
import 'package:homeservice/features/cart/presentation/components/bottom_bar.dart';
import 'package:homeservice/features/cart/presentation/components/cart_item_card.dart';
import 'package:homeservice/features/cart/presentation/components/empty_card_widget.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late final CartBloc cartViewModel;
  late final BillBloc billViewModel;

  @override
  void initState() {
    cartViewModel = serviceLocater<CartBloc>();
    billViewModel = serviceLocater<BillBloc>();
    cartViewModel.add(const FetchCartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Scaffold(
      backgroundColor: context.primaryColorMode,
      appBar: commonAppBar(
        title: "My Cart",
        style: textTheme.headlineMedium?.copyWith(fontWeight: .w700),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocBuilder<CartBloc, CartState>(
              bloc: cartViewModel,
              builder: (_, state) {
                if (state.carts.isEmpty) {
                  return EmptyPageWidget();
                }
                return ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.horizontalspacing,
                  ),

                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    final cart = state.carts[index];
                    return CartItemCard(
                      billBloc: billViewModel,
                      cart: cart,
                      onAdd: () =>
                          cartViewModel.add(IncrementCartEvent(cart.id)),
                      onRemove: () =>
                          cartViewModel.add(DecrementCartEvent(cart.id)),
                      onPriceLoaded: (price, quantity) {},
                    );
                  },
                  separatorBuilder: (_, _) => SizeBox.widgetSpacing,
                  itemCount: state.carts.length,
                );
              },
            ),
          ),

          SliverToBoxAdapter(child: SizeBox.widgetSpacing),

          BlocSelector<CartBloc, CartState, bool>(
            bloc: cartViewModel,
            selector: (state) {
              return state.carts.isEmpty;
            },
            builder: (context, isEmpty) {
              return SliverToBoxAdapter(
                child: isEmpty
                    ? SizedBox.shrink()
                    : BillDetailsCard(
                        bloc: billViewModel,
                      ).horizontalPadding(Dimens.horizontalspacing),
              );
            },
          ),

           SliverToBoxAdapter(child: SizeBox.sizeHX20),
        ],
      ),

      bottomNavigationBar: BlocSelector<CartBloc, CartState, bool>(
        bloc: cartViewModel,
        selector: (state) {
          return state.carts.isEmpty;
        },
        builder: (context, isEmpty) {
          if (isEmpty) {
            return SizedBox.shrink();
          }
          return BlocSelector<BillBloc, BillState, double>(
            bloc: billViewModel,
            selector: (state) {
              return state.total;
            },
            builder: (context, value) {
              return CartBottomBar(total: value);
            },
          );
        },
      ),
    );
  }
}
