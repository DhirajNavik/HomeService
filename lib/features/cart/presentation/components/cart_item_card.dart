import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeservice/config/injector/injector_config.dart';
import 'package:homeservice/core/extensions/context_extension.dart';
import 'package:homeservice/core/helpers/decoration.dart';
import 'package:homeservice/core/utils/app_palettes.dart';
import 'package:homeservice/core/utils/dimens.dart';
import 'package:homeservice/features/cart/domain/entities/cart_entity.dart';
import 'package:homeservice/features/cart/presentation/bloc/bill/bill_bloc.dart';
import 'package:homeservice/features/service/presentation/bloc/service_details/service_details_bloc.dart';
import 'package:homeservice/features/service/presentation/components/add_to_cart_button.dart';

class CartItemCard extends StatefulWidget {
  final CartEntity cart;
  final VoidCallback onAdd;
  final VoidCallback? onRemove;
  final BillBloc billBloc;
  final Function(double price, int quantity) onPriceLoaded;
  const CartItemCard({
    super.key,
    required this.cart,
    required this.onAdd,
    this.onRemove,
    required this.billBloc,
    required this.onPriceLoaded,
  });

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  late final ServiceDetailsBloc serviceDetailsViewModel;

  @override
  void initState() {
    serviceDetailsViewModel = serviceLocater<ServiceDetailsBloc>();
    serviceDetailsViewModel.add(GetServiceDetails(widget.cart.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return BlocConsumer<ServiceDetailsBloc, ServiceDetailsState>(
      bloc: serviceDetailsViewModel,
      listenWhen: (previous, current) {
        return previous.service != current.service && current.service != null;
      },
      listener: (context, state) {
        final service = state.service;
        if (service == null) return;

        widget.billBloc.add(
          UpdateBillEvent(
            id: widget.cart.id,
            price: service.finalPrice ?? 0,
            quantity: widget.cart.quantity,
          ),
        );
      },
      builder: (context, state) {
        final service = state.service;
        return Container(
          padding: EdgeInsets.all(Dimens.allPaddingX5),
          decoration: boxDecorationRoundedWithShadow(
            Dimens.radiusX4,
            backgroundColor: context.cardColor,
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: .spaceBetween,
                    crossAxisAlignment: .start,
                    mainAxisSize: .max,
                    children: [
                      Column(
                        crossAxisAlignment: .start,
                        spacing: Dimens.gapX2B,
                        children: [
                          Text(
                            service?.name ?? "Product Not Found",
                            style: textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          Row(
                            crossAxisAlignment: .end,
                            spacing: Dimens.gapX1B,
                            children: [
                              Text(
                                "₹${service?.finalPrice?.round()}",
                                style: textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  height: 0.9,
                                ),
                              ),
                              Text(
                                "₹${service?.price?.round()}",
                                style: textTheme.titleMedium?.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),

                          Text(
                            "30 days warranty included",
                            style: textTheme.bodySmall?.copyWith(
                              color: AppPalettes.textSecondary,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: 100,
                        height: 35,
                        child: AddToCartButton(
                          onAdd: () {
                            widget.onAdd();

                            if (service != null) {
                              widget.billBloc.add(
                                UpdateBillEvent(
                                  id: widget.cart.id,
                                  price: service.finalPrice ?? 0,
                                  quantity: widget.cart.quantity + 1,
                                ),
                              );
                            }
                          },
                          onRemove: () {
                            widget.onRemove?.call();

                            if (service != null) {
                              widget.billBloc.add(
                                UpdateBillEvent(
                                  id: widget.cart.id,
                                  price: service.finalPrice ?? 0,
                                  quantity: widget.cart.quantity - 1,
                                ),
                              );
                            }
                          },
                          quantity: widget.cart.quantity.toString(),
                        ),
                      ),
                    ],
                  ),
                ),

                ClipRRect(
                  borderRadius: .circular(Dimens.radiusX2),
                  child: CachedNetworkImage(
                    imageUrl: service?.assets ?? "",
                    width: 120,
                    height: 120,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
