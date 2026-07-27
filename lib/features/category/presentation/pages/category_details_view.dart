import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homeservice/config/injector/injector_config.dart';
import 'package:homeservice/core/components/animated_button.dart';
import 'package:homeservice/core/extensions/context_extension.dart';
import 'package:homeservice/core/extensions/padding_extension.dart';
import 'package:homeservice/core/routes/app_route_path.dart';
import 'package:homeservice/core/utils/app_palettes.dart';
import 'package:homeservice/core/utils/dimens.dart';
import 'package:homeservice/core/utils/sizedBox.dart';
import 'package:homeservice/features/cart/domain/entities/cart_entity.dart';
import 'package:homeservice/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:homeservice/features/category/domain/entities/category_entity.dart';
import 'package:homeservice/features/category/presentation/bloc/category_details/category_details_bloc.dart';
import 'package:homeservice/features/service/presentation/bloc/services/services_bloc.dart';
import 'package:homeservice/features/category/presentation/components/category_card.dart';
import 'package:homeservice/features/service/presentation/components/service_card_view.dart';

class CategoryDetailsView extends StatefulWidget {
  final String id;
  const CategoryDetailsView({super.key, required this.id});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  late final CategoryDetailsBloc categoryViewModel;
  late final ServicesBloc serviceViewModel;
  late final CartBloc cartViewModel;
  @override
  void initState() {
    categoryViewModel = serviceLocater<CategoryDetailsBloc>();
    serviceViewModel = serviceLocater<ServicesBloc>();
    cartViewModel = serviceLocater<CartBloc>();
    categoryViewModel.add(GetCategoryDetails(widget.id));
    serviceViewModel.add(GetServices(widget.id));
    cartViewModel.add(const FetchCartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final cardColor = context.cardColor;
    final horizontalPadding = Dimens.horizontalspacing;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          spacing: Dimens.gapX3,
          children: [
            Stack(
              children: [
                BlocSelector<
                  CategoryDetailsBloc,
                  CategoryDetailsState,
                  CategoryEntity?
                >(
                  bloc: categoryViewModel,
                  selector: (state) {
                    return state.category;
                  },
                  builder: (context, category) {
                    return CategoryCardHeader(
                      category: category,
                      padding: horizontalPadding,
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(Dimens.allPaddingX3),
                  child: BackButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        context.primaryColorMode,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            Container(
              color: context.primaryColorMode,
              padding: .symmetric(horizontal: horizontalPadding),
              child: BlocBuilder<ServicesBloc, ServicesState>(
                bloc: serviceViewModel,
                builder: (context, state) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final service = state.services![index];
                      return BlocSelector<CartBloc, CartState, CartEntity?>(
                        bloc: cartViewModel,
                        selector: (state) => state.cartMap[service.id],
                        builder: (_, cartItem) {
                          return ServiceCardView(
                            service: service,
                            quantity: cartItem?.quantity ?? 0,
                            onAdd: () => cartViewModel.add(
                              IncrementCartEvent(service.id),
                            ),
                            onRemove: () => cartViewModel.add(
                              DecrementCartEvent(service.id),
                            ),
                          );
                        },
                      );
                    },
                    separatorBuilder: (_, _) => Divider(height: 1),
                    itemCount: state.services?.length ?? 0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BlocSelector<CartBloc, CartState, int>(
        bloc: cartViewModel,
        selector: (state) => state.carts.length,
        builder: (context, length) {
          if (length == 0) {
            return SizedBox.shrink();
          }
          return BottomAppBar(
            elevation: 10,
            color: cardColor,
            surfaceTintColor: cardColor,
            shadowColor: cardColor,
            padding: .zero,
            height: Dimens.buttonHeightSpacing,
            child: Row(
              children: [
                SizeBox.sizeWX2,
                Expanded(
                  child: Text(
                    "$length Items added",
                    style: textTheme.titleMedium,
                  ),
                ),
                Expanded(
                  child: CommonButton(
                    text: "View cart",
                    onTap: () =>
                        serviceLocater<GoRouter>().push(AppRoute.cart.path),
                  ),
                ),
              ],
            ).allPadding(horizontalPadding),
          );
        },
      ),
    );
  }
}
