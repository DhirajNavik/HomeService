import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeservice/config/injector/injector_config.dart';
import 'package:homeservice/core/utils/sizedBox.dart';
import 'package:homeservice/features/category/domain/entities/category_entity.dart';
import 'package:homeservice/features/category/presentation/bloc/categories/categories_bloc.dart';
import 'package:homeservice/features/category/presentation/components/category_grid_skeleton.dart';
import 'package:homeservice/features/category/presentation/components/category_grid_view.dart';
import 'package:homeservice/features/home/domain/entities/location_entity.dart';
import 'package:homeservice/features/home/presentation/components/home_app_bar_widget.dart';
import 'package:homeservice/features/home/presentation/cubit/location_cubit.dart';
import 'package:homeservice/features/service/domain/entities/service_entity.dart';
import 'package:homeservice/features/service/presentation/bloc/services/services_bloc.dart';
import 'package:homeservice/features/service/presentation/components/horizontal_carousel_slider.dart';
import 'package:homeservice/features/service/presentation/components/popular_services_card.dart';
import 'package:homeservice/features/service/presentation/components/popular_services_card_skeleteon.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final CategoriesBloc categoriesViewModel;
  late final ServicesBloc servicesViewModel;
  late final LocationCubit locationViewModel;

  @override
  void initState() {
    categoriesViewModel = serviceLocater<CategoriesBloc>();
    servicesViewModel = serviceLocater<ServicesBloc>();
    locationViewModel = serviceLocater<LocationCubit>();
    categoriesViewModel.add(GetCategories());
    servicesViewModel.add(GetTopRatedServices());
    locationViewModel.getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (nested, isScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(nested),
              sliver: SliverSafeArea(
                top: false,
                bottom: false,
                sliver:
                    BlocSelector<LocationCubit, LocationState, LocationEntity?>(
                      bloc: locationViewModel,
                      selector: (state) {
                        if (state is LocationLoaded) {
                          return state.location;
                        }
                        return null;
                      },
                      builder: (context, location) {
                        return HomeAppBarWidget(location: location);
                      },
                    ),
              ),
            ),
          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizeBox.widgetSpacing),

            SliverToBoxAdapter(
              child:
                  BlocSelector<
                    CategoriesBloc,
                    CategoriesState,
                    List<CategoryEntity>
                  >(
                    bloc: categoriesViewModel,
                    selector: (state) {
                      return state.categories ?? [];
                    },
                    builder: (context, categories) {
                      if (categories.isEmpty) {
                        return const CategoryGridSkeleton();
                      }

                      return CategoryGridView(categories: categories);
                    },
                  ),
            ),
            SliverToBoxAdapter(child: SizeBox.widgetSpacing),

            SliverToBoxAdapter(
              child:
                  BlocSelector<
                    ServicesBloc,
                    ServicesState,
                    List<ServiceEntity>
                  >(
                    bloc: servicesViewModel,
                    selector: (state) {
                      return state.services ?? [];
                    },
                    builder: (context, services) {
                      if (services.isEmpty) {
                        return PopularServicesCardSkeleton();
                      }
                      return PopularServicesCard(services: services);
                    },
                  ),
            ),

            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: HorizontalCarouselSlider(
                  images: [
                    "https://www.urbancompany.com/img/images/growth/luminosity/1745848360087-3d3d8e.jpeg?bucket=urbanclap-prod&quality=90&format=auto&width=394&dpr=2",
                    "https://www.urbancompany.com/img/images/growth/home-screen/1711428213587-b4f7dd.jpeg?bucket=urbanclap-prod&quality=90&format=auto&width=394&dpr=2",
                    "https://www.urbancompany.com/img/images/supply/customer-app-supply/1751349785134-9a43cd.jpeg?bucket=urbanclap-prod&quality=90&format=auto&width=394&dpr=2",
                    "https://www.urbancompany.com/img/images/supply/customer-app-supply/1751349794243-12c84d.jpeg?bucket=urbanclap-prod&quality=90&format=auto&width=394&dpr=2",
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
